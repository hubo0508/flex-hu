package com.biiway.event
{
	import flash.events.Event;
	
	public class MenuBarEvent extends Event
	{
		
		public static const MENU_BAR_EVENT:String = "menuBarEvent";
		
		public var menuName:String;
		public var menuType:String;
		
		public function MenuBarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}