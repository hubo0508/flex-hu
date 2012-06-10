package com.hubo.workflow.event
{
	import flash.events.Event;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-6-10  /  hubo.0508ⓐgmail.com</br>com.hubo.workflow.event.ClickNavMenuEvent.as</b>
	 * </p>
	 */
	public class ClickTopNavMenuEvent extends Event
	{
		public static const CLICK_NAV_MENU:String = "clickNavMenu";
		
		public var selected:Boolean;
		
		public var name:String;
		
		public function ClickTopNavMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}