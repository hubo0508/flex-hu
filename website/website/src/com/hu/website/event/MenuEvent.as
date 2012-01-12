package com.hu.website.event
{
	import flash.events.Event;
	
	
	/**
	 * <p><b>HUBO 2012-1-12  /  hubo.0508ⓐgmail.com</br>com.hu.website.MenuEvent.as</b></p>
	 */
	public class MenuEvent extends Event
	{
		
		public static const MENUEVENT:String = "menuEvent";
		
		public var value:String;
		
		public function MenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}