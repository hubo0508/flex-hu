package com.biiway.stockassistant.components.datagrid
{
	import flash.events.Event;
	
	public class CellEvent extends Event
	{
		public static const CELLEVENT:String = "cellEvent";
		
		public static const CELL_VALUE_COMMIT:String = "cellValueCommit";
		
		public var data:Object;
		
		public var selected:Boolean;
		
		public function CellEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}