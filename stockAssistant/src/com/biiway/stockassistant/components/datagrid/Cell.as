package com.biiway.stockassistant.components.datagrid
{
	import assets.skin.CheckBoxSkin;
	
	import com.biiway.stockassistant.util.Util;
	
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.events.DynamicEvent;
	import mx.events.FlexEvent;
	import mx.graphics.SolidColor;
	import mx.managers.CursorManager;
	
	import spark.components.BorderContainer;
	import spark.components.CheckBox;
	import spark.components.Group;
	import spark.components.Label;
	import spark.primitives.Rect;

	/**
	 * <p>
	 *     <b>HUBO 2012-2-18  /  hubo.0508ⓐgmail.com</br>com.printingoffice.framework.components.datagrid.Cell.as</b>
	 * </p>
	 */
	public class Cell extends Group
	{
		public function Cell()
		{
			super();
		}
		
		public var backgroupColor:uint;
		
		public var constColor:uint;
		
		public var borderColor:uint=0xE7E5E5;
		
		private var _text:String="";
		
		private var _cellType:String = "LABEL";
		
		private var _data:Object;
		
		private var label:Label;
		
		private var box:CheckBox;
		
		/**
		 * 当<code>Cell.cellType=Cell.BOX</code>时，表示当前单元格是否选中。默认值为：false。
		 */
		private var _selected:Boolean = false;
		
		//创建常量组件
		public static const LABEL:String = "LABEL";
		public static const BOX:String  = "BOX";
		public static const ICON:String = "ICON";		
		
		/**
		 * 复选框Click点击
		 */
		public static const CHECKBOX_CLICK:String = "checkboxClick";
		
		override protected function measure():void
		{
			super.measure();
			
			this.measuredWidth=42;
			this.measuredHeight=42;
		}
		
		/**
		 * <p>重写父组件updateDisplayList</p>
		 *
		 * 1、对容器增加填充背景，根据属性bgMark(default=false)来定义。颜色设置根据属性backgroupColor(default=0xF3F3F3)</br>
		 * 2、对容器增加底部边框，根据属性borderColor(default=0xE7E5E5)定义颜色值。
		 */
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);

			var g:Graphics=graphics;
			g.clear();
			
			g.beginFill(backgroupColor);
			g.drawRect(0, 0, w, h);
			g.endFill();
			
			g.lineStyle(1, borderColor);
			g.moveTo(0, h-1);
			g.lineTo(w, h-1);
			
//			g.moveTo(w, 0);
//			g.lineTo(w, h);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			if(cellType == "LABEL" && !label) 
			{
				label = new Label();
				label.left = 4;
				label.right = 4;
				label.verticalCenter = 0;
//				label.useHandCursor = true;
//				label.buttonMode = true;
				label.maxDisplayedLines = 1;
				
				this.addElement(label);
			}
			
			if(cellType == "BOX" && !box) 
			{
				box = new CheckBox();
				box.verticalCenter = 0;
				box.horizontalCenter = 0;
				box.setStyle("skinClass",Class(CheckBoxSkin));
				box.addEventListener(MouseEvent.CLICK,checkboxHandler,false,0,true);
				box.addEventListener(FlexEvent.VALUE_COMMIT,checkboxHandler,false,0,true);

				this.addElement(box);
			}
			
		}
		
		protected function checkboxHandler(event:Event):void
		{
			var box:CheckBox = event.currentTarget as CheckBox;
			selected = box.selected;
			switch(event.type)
			{
				case MouseEvent.CLICK :
//					var dye:DynamicEvent = new DynamicEvent(CHECKBOX_CLICK);
//					dye.rowsIndex = (box.parent as Object).id;
//					dye.selected = box.selected;
//					
//					this.dispatchEvent(dye);
					
					box.selected = !box.selected;
					selected = box.selected;
					break;
				
				case FlexEvent.VALUE_COMMIT :
					var e:CellEvent = new CellEvent(CellEvent.CELL_VALUE_COMMIT,true);
					e.selected = box.selected;
					e.data = data;
					e.rowsIndex = (box.parent as Object).id;
					dispatchEvent(e);
					break;
				
				default:
					break;
			}
		}
		
		public function clearSelectedOrValue():void
		{
			if(label)
			{
				label.text = "";
			}
			
			if(box)
			{
				box.selected = false;
			}
			
			this.data = null;
		}
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
			
			if(label)
			{
				label.text = value;
			}
		}
		
		public function set textColor(color:uint):void
		{
			if(label)
			{
				this.label.setStyle("color",color);	
			}
		}

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}


		[Inspectable(category="General", enumeration="LABEL,BOX,ICON", defaultValue="LABEL")]
		
		/**
		 * 单元格类型，可选值有<code>Cell.LABEL;Cell.BOX;Cell.ICON</code>，默认为<code>Cell.LABEL</cdoe>
		 */
		public function get cellType():String
		{
			return _cellType;
		}
		
		/**
		 * @private
		 */
		public function set cellType(value:String):void
		{
			_cellType = value;
		}

		/**
		 * 当<code>Cell.cellType=Cell.BOX</code>时，表示当前单元格是否选中。默认值为：false。
		 */
		public function get selected():Boolean
		{
			return _selected;
		}

		/**
		 * @private
		 */
		public function set selected(value:Boolean):void
		{
			if(value != selected)
			{
				_selected = value;
				
				box.selected = value;  
			}
		}

	}
}