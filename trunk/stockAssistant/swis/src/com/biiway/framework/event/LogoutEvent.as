package com.biiway.framework.event
{
	import flash.events.Event;
	
	public class LogoutEvent extends Event
	{
		
		public static const LOGOUT_EVENT:String = "logoutEvent";
		
		public var item:Object;
		
		public function LogoutEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}