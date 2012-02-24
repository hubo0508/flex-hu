package com.printingoffice.framework.event
{
	import flash.events.Event;
	import flash.geom.Point;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-24  /  hubo.0508ⓐgmail.com</br>com.printingoffice.framework.event.MenuButtonEvent.as</b>
	 * </p>
	 */
	public class MenuButtonEvent extends Event
	{
		
		public static const CLICK_MENU_BUTTON:String = "clickMenuButton";
		
		public static const CLICK_SETTING_MENU:String = "clickSettingMenu";
		
		public var point:Point;
		
		public var types:String;
		
		public function MenuButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}