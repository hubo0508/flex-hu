package com.printingoffice.event
{
	import flash.events.Event;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-7  /  hubo.0508ⓐgmail.com</br>com.printingoffice.event.LoginEvent.as</b>
	 * </p>
	 */
	public class LoginEvent extends Event
	{
		
		public static const LOGIN_EVENT:String = "login";
		
		public var useranem:String;
		public var password:String;
		
		public function LoginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}