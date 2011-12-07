package org.hubo.flexextjs.components.dataGrid.renderer
{
	import flash.display.DisplayObject;
	import flash.text.TextField;
	
	import mx.collections.IList;
	import mx.containers.VBox;
	import mx.controls.Label;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.ListBase;
	import mx.core.UITextField;
	
	import org.hubo.flexextjs.ui.datagrid.DataGrid;
	
	import spark.components.HGroup;

	public class SequenceItemRenderer extends VBox
	{
		private var _label:Label;

		public function SequenceItemRenderer()
		{
			super();
		}

		override public function set data(value:Object):void
		{
			super.data=value;
			if (this.owner && this.owner is DataGrid)
			{
				var objCollection:Object=DataGrid(this.owner).dataProvider;
				var snumber:int=0;
				if (value && objCollection)
				{
					snumber=objCollection.getItemIndex(value);
				}

				this.createAndAddChildLabel(snumber);

				//horizontalAlign="center" verticalAlign="middle"
				this.setStyle("horizontalAlign", "center");
				this.setStyle("verticalAlign", "middle");
			}
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}

		/***********************************************************************************************/
		/**create*/
		/***********************************************************************************************/

		private function createAndAddChildLabel(snumber:int):void
		{
			if (_label)
			{
				_label.text=String(snumber + 1);
			}
			else
			{
				_label=new Label();
				_label.text=String(snumber + 1);
			}

			this.addChild(_label);
		}

		//      另一种方法获取dataProvider并调用getItemIndex方法  
		//      override public function set data(value:Object):void{  
		//          super.data = value;  
		//          text = (((listData.owner as ListBase).dataProvider as IList)  
		//              .getItemIndex(data) + 1).toString();  
		//      }  
//		override public function set listData(value:BaseListData):void
//		{
//			super.listData=value;
//			text=((value.owner as ListBase).itemRendererToIndex(this) + 1).toString();
//		}
//		
//		override public function validateProperties():void
//		{
//			super.validateProperties();
//		}

	}
}