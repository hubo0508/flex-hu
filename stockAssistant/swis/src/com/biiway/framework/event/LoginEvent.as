/**
 * @Project IWMP_lib
 * @Title LoginEvent.as
 * @Package com.biiway.framework.event
 * @Description TODO
 * @date Apr 22, 2011 2:28:47 PM
 * @version V1.0  
 */
package com.biiway.framework.event
{
	import flash.events.Event;
	
	
	/** 
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 22, 2011
	 */
	public class LoginEvent extends Event
	{
		
		public static const LOGIN_EVENT:String = "loginEvent";
		
		private var _username:String;
		
		private var _password:String;
		
		private var _functionModule:String;
		
		private var _url2:String;
		
		private var _eventType:String;
		
		private var _name:String;
		
		public function LoginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		
		public function get password():String
		{
			return _password;
		}

		public function set password(value:String):void
		{
			_password = value;
		}

		public function get functionModule():String
		{
			return _functionModule;
		}

		public function set functionModule(value:String):void
		{
			_functionModule = value;
		}

		public function get username():String
		{
			return _username;
		}

		public function set username(value:String):void
		{
			_username = value;
		}

		public function get url2():String
		{
			return _url2;
		}

		public function set url2(value:String):void
		{
			_url2 = value;
		}

		public function get eventType():String
		{
			return _eventType;
		}

		public function set eventType(value:String):void
		{
			_eventType = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}


	}
}