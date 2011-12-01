package com.biiway.event
{
	import flash.events.Event;
	
	/**
	 * 注销事件
	 */
	public class LogoutEvent extends Event
	{
		
		public static const LOGOUT_EVENT:String = "logoutEvent";
		
		public function LogoutEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}