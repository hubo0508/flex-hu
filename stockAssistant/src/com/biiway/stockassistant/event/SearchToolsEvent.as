package com.biiway.stockassistant.event
{
	import flash.events.Event;
	
	public class SearchToolsEvent extends Event
	{
		public static const CLICKEVENT:String = "clickEvent";
		
		public static const CLOSEEVENT:String = "closeEvent";
		
		public var searchtext:String;
		
		public function SearchToolsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}