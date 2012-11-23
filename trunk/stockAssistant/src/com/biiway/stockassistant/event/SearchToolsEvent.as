package com.biiway.stockassistant.event
{
	import flash.events.Event;
	
	public class SearchToolsEvent extends Event
	{
		public static const CLICKEVENT:String = "clickEvent";
		
		public static const CLOSEEVENT:String = "closeEvent";
		
		public static const CHANGE_SEARCH_CONDITION:String = "changeSearchCondition";
		
		public var text:String;
		
		public var datetype:String;
		
		public var startdate:String;
		
		public var enddate:String;
		
		public function SearchToolsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}