package org.hu.fextjs.components.dataGrid.renderer
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mx.controls.*;
	import mx.events.*;
	
	import org.hu.fextjs.components.dataGrid.DGColumn;
	
	/**
	 * 对列头部增加checkbox
	 */
	public class CheckBoxHeaderRenderer extends CheckBox
	{
		public var selectItems:Array;
		
		public function CheckBoxHeaderRenderer()
		{
			super();
			addEventListener("click", clickHandler);
			
			this.setStyle("borderColor",0x8DB2E3);
		}

		
		private var _data:DGColumn;
		override public function get data():Object
		{
			return _data;
		}
		
		override public function set data(value:Object):void
		{
			_data = value as DGColumn;
			DataGrid(listData.owner).addEventListener(DataGridEvent.HEADER_RELEASE, sortEventHandler);
			selected = _data.selected;
		}
		
		private function sortEventHandler(event:DataGridEvent):void
		{
			if (event.itemRenderer == this)
				event.preventDefault();
		}
		
		override protected function clickHandler(event:MouseEvent):void
		{
			super.clickHandler(event);
			data.selected = selected;
			data.dispatchEvent(event);
		}		
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void   
		{   
			super.updateDisplayList(unscaledWidth, unscaledHeight);   
			var n:int = numChildren;   
			for(var i:int = 0; i < n; i++)   
			{   
				var c:DisplayObject = getChildAt(i)
				if( !(c is TextField))   
				{   
					c.x = Math.round((unscaledWidth - c.width) / 2);   
					c.y = Math.round((unscaledHeight - c.height) /2 );   
				}   
			}   
		}   
	}
}