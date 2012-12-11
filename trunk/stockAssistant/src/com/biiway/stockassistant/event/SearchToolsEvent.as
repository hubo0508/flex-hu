package com.biiway.stockassistant.event
{
	import flash.events.Event;
	
	public class SearchToolsEvent extends Event
	{
		
		public static const CLICKEVENT:String = "clickEvent";
		
		public static const CLOSEEVENT:String = "closeEvent";
		
		public static const CHANGE_SEARCH_CONDITION_EVENT:String = "changeSearchConditionEvent";
		
		public static const SELECTED_STOCK_EVENT:String = "seectedStockEvent";
		
		public var text:String;
		
		public var datetype:String;
		
		public var startdate:String;
		
		public var enddate:String;
		
		public var data:Object;
		
		public function SearchToolsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}