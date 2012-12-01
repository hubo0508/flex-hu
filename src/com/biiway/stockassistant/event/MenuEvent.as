package com.biiway.stockassistant.event
{
	import flash.events.Event;
	
	public class MenuEvent extends Event
	{
		public static const MENUEVENT:String = "menuEvent";
		
		public var data:Object;
		
		public var text:String;
		
		public function MenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}