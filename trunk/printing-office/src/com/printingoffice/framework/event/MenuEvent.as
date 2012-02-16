package com.printingoffice.framework.event
{
	import flash.events.Event;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-13  /  hubo.0508ⓐgmail.com</br>com.printingoffice.event.MenuEvent.as</b>
	 * </p>
	 */
	public class MenuEvent extends Event
	{
				
		public static const MENU_EVENT:String = "menuEvent";
		
		public var types:String;
		
		public var url:String;
		
		public var data:Object;
		
		public function MenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}