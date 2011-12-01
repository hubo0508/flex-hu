package com.hongguan.event
{
	import flash.events.Event;
	
	/**
	 * 用户登录处理事件
	 */
	public class LoginEvent extends Event
	{
		
		public static const LOGIN_EVENT:String = "loginEvent";
		
		/**用户名*/
		public var username:String;
		
		/**密码*/
		public var password:String;
		
		public function LoginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}