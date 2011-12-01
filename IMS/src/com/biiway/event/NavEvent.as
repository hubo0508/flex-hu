package com.biiway.event
{
	import flash.events.Event;
	
	public class NavEvent extends Event
	{
		
		public static const NAV_EVENT:String = "navEvent";
		
		public var moduleURL:String;
		
		public function NavEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}