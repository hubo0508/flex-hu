package com.biiway.event
{
	import flash.events.Event;
	
	public class PanelEvent extends Event
	{
		
		public static const PANEL_EVENT:String = "panelEvent";
		
		public var clickType:String;
		
		public function PanelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}