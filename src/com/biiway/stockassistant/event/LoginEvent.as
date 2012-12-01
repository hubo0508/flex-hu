package com.biiway.stockassistant.event
{
	import flash.events.Event;
	
	public class LoginEvent extends Event
	{
		
		public static const LOGIN_EVENT:String = "loginEvent";
		
		/**
		 * 登录用户名
		 */
		public var username:String;
		
		/**
		 * 登录密码
		 */
		public var password:String;
		
		public function LoginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}