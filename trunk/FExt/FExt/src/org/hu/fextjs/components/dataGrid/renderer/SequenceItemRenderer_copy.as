package  org.hu.fextjs.components.dataGrid.renderer
{
	import flash.display.DisplayObject;
	import flash.text.TextField;

	import mx.collections.IList;
	import mx.controls.Label;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.ListBase;
	import mx.core.UITextField;

	import spark.components.HGroup;

	public class SequenceItemRenderer_copy extends Label
	{
		public function SequenceItemRenderer_copy()
		{
			super();
		}

		//      另一种方法获取dataProvider并调用getItemIndex方法  
		//      override public function set data(value:Object):void{  
		//          super.data = value;  
		//          text = (((listData.owner as ListBase).dataProvider as IList)  
		//              .getItemIndex(data) + 1).toString();  
		//      }  
		override public function set listData(value:BaseListData):void
		{
			super.listData=value;
			text=((value.owner as ListBase).itemRendererToIndex(this) + 1).toString();
		}

		override public function validateProperties():void
		{
			super.validateProperties();
		}

	}
}