package org.hu.fextjs.components.dataGrid.renderer
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mx.binding.utils.BindingUtils;
	import mx.collections.XMLListCollection;
	import mx.controls.Alert;
	import mx.controls.CheckBox;
	import mx.controls.DataGrid;
	
	import org.hu.fextjs.components.dataGrid.DGColumn;
	import org.hu.fextjs.event.ClickColumnBeforeBoxEvent;

	[Event(name="clickColumnBeforeBox",type="org.hu.fextjs.event.ClickColumnBeforeBoxEvent")]
	
	/**
	 * 对每列数据增加checkbox</br>
	 * 
	 * 扩展mx.controls.CheckBox控件
	 * 
	 * @author HUBO hubo.0508@gmail.com
	 */	
	public class CheckBoxItemRenderer extends CheckBox
	{

		public var selectItemsData:Array=[];
		
		protected function init():void{
			Alert.show("fff");
			BindingUtils.bindProperty(this,"selected",data,"selected");
			
			this.setStyle("borderColor",0x8DB2E3);
		}
		public function CheckBoxItemRenderer()
		{
			super();
			this.addEventListener(Event.CHANGE, checkBoxClickHandler); //单击行CheckBox时触发
			this.addEventListener(MouseEvent.CLICK,click_Handler);
		}
		
		protected function click_Handler(event:MouseEvent):void
		{
			this.dispatchEvent(new Event(ClickColumnBeforeBoxEvent.EVENT_TYPE,true));
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);			
			var n:int=numChildren;
			for (var i:int=0; i < n; i++)
			{
				var c:DisplayObject=getChildAt(i)
				if (!(c is TextField))
				{
					c.x=Math.round((unscaledWidth - c.width) / 2);
					c.y=Math.round((unscaledHeight - c.height) / 2);
				}
			}
		}

		/**
		 * 由布局逻辑用于通过调用 commitProperties() 方法来验证组件的属性
		 * @author HUBO hubo.0508@gmail.com
		 */
		override public function validateProperties():void
		{
			super.validateProperties();
			if (listData)
			{
				var dg:DataGrid=DataGrid(listData.owner);
				var column:DGColumn=dg.columns[listData.columnIndex];
				column.addEventListener('click', checkBoxHanderClickHandler); //单击列头时触发
			}
		}

		private var _data:Object;

		override public function get data():Object
		{
			return _data;
		}

		override public function set data(value:Object):void
		{			
			
			_data=value;
			try
			{
				if ("true" == _data['selected'].toString())
				{
					this.selected=true;
				}
				else
				{
					
					this.selected=false;
				}
			}
			catch (error:*)
			{
				this.selected=false;
			}


		}

		/********************************************************************************************/
		/**CLICK EVENT*/
		/********************************************************************************************/
		
		/**
		 * 单击列头
		 * @author HUBO hubo.0508@gmail.com
		 */
		private function checkBoxHanderClickHandler(e:Event):void
		{
			var dg:DataGrid=DataGrid(this.listData.owner);
			var column:DGColumn=dg.columns[listData.columnIndex];
			selected=e.target.selected;
			
			//单选
			if (column.radioBox)
			{
				selected=false;
				this.clearAllCacheValue(true,column);
			}

			//selected=true
			if (selected)
			{
				if (theOnlyStoreData(column))
				{	
					//将当前选择的行Item数据保存到DGColumn.selectItems属性中
					column.selectItemsData.push(this.data);
					//将当前页面保存到DGColumn.saveSelectedItem属性中
					column.saveSelectedItem.push(this);
					//将当前页面selectItems中存值
					this.selectItemsData = column.selectItemsData;	
				}
			}
			
			//selected=false
			else
			{
				this.clearAllCacheValue(false,column);
			}	
			
		}
	
		
		/**
		 * 点击列时
		 * @author HUBO hubo.0508@gmail.com
		 * 
		 * 点击check box时，根据状况向selectedItems array中添加当前行的引用，或者从array中移除</br>
		 *
		 * selectedItems array中数据是否有重，根据每条数据的ID来识别.所以每条数据必须有ID元素</br>
		 */
		private function checkBoxClickHandler(e:Event):*
		{
			var dg:DataGrid=DataGrid(this.listData.owner);
			var column:DGColumn=dg.columns[listData.columnIndex];
			selected=e.target.selected;
			
			if(!column)
			{
				return;
			}
			
			//单选或多选：单选：true,  多选择：flase
			var radioOrCheckbox:Boolean = column.radioBox;						
		
			//selected=true
			if (selected) 
			{
				//根据ID判断此次值是否为唯一
				if (theOnlyStoreData(column))
				{					
					//判断是单选还是多选
					if(radioOrCheckbox)//单选
					{
						this.clearAllCacheValue(true,column);
					}
					
					//将当前选择的行Item数据保存到DGColumn.selectItems属性中
					column.selectItemsData.push(this.data);
					//将当前页面保存到DGColumn.saveSelectedItem属性中
					column.saveSelectedItem.push(this);
					//将当前页面selectItems中存值
					this.selectItemsData = column.selectItemsData;	
				}
				
				selected = true;
			}
			
			//selected=false
			else
			{
				//selected=false,清除当前选择的行Item数据在this.selectItems属性中的内存值
				this.clearTheSpecifiedValue(this.selectItemsData,this.data);	
				
				//selected=false,清除当前选择的行Item数据在DGColumn.selectItems属性中的内存值
				this.clearTheSpecifiedValue(column.selectItemsData,this.data);	
				
				//selected=false,清除当前页面在DGColumn.saveSelectedItem属性中的内存值
				this.clearTheSpecifiedValue(column.saveSelectedItem,this,"selected");	
			}	
			
			this.dispatchEventClick(column.addClickEvent);
		}
		
		/**
		 * 当点击列的复选框时，是否进行事件跳转
		 * @author HUBO hubo.0508@gmail.com
		 */
		private function dispatchEventClick(dispatchFlag:Boolean):void
		{
			if(dispatchFlag)
			{
				var cEvent:ClickColumnBeforeBoxEvent = new ClickColumnBeforeBoxEvent(ClickColumnBeforeBoxEvent.EVENT_TYPE,true);
				cEvent.selectedItem = this.selectItemsData;
				
				this.dispatchEvent(cEvent);
			}
		}
		
		/**
		 * 判断数据的唯一性
		 * @author HUBO hubo.0508@gmail.com
		 */
		private function theOnlyStoreData(column:DGColumn):Boolean
		{
			var onlyFlag:Boolean = true;
			var selectedData:int = column.selectItemsData.length;

			if(selectedData == 0)
			{
				return onlyFlag;
			}
		
			for (var i:Number=0; i < selectedData; i++)
			{
				var id:String=column.selectItemsData[i].id;
				if (id == this.data.id)
				{
					onlyFlag = false; break;
				}
			}
			
			return onlyFlag;
		}
		
		/**
		 * 清除指定内存值
		 * @author HUBO hubo.0508@gmail.com
		 */
		private function clearTheSpecifiedValue(items:Array,datas:Object, type:String = ""):void
		{			
			for (var i:Number=0; i < items.length; i++)
			{
				if (items[i] == datas)
				{
					if(type == "selected")
					{
						items[i].selected = false;
					}
					else
					{
						items.splice(i, 1)
					}					
				}
			}
		}
		
		/**
		 * 清除所有内存值
		 * @author HUBO hubo.0508@gmail.com
		 */
		private function clearAllCacheValue(chooseMark:Boolean,column:DGColumn):void
		{
			if(column.selectItemsData.length != 0)
			{
				column.selectItemsData = [];
			}
			
			if(column.saveSelectedItem.length != 0)
			{
				if(chooseMark){
					column.saveSelectedItem[0].selected = false;
				}
				column.saveSelectedItem = [];
			}
			
			if(this.selectItemsData.length != 0)
			{
				this.selectItemsData = [];
			}			
		}
		
	}
}