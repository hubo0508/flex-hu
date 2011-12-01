package com.biiway.event
{
	import flash.events.Event;
	
	public class ToolTipCutilineEvent extends Event
	{
		
		public static const TOOLTIP_CUTILINE_EVENT:String = "toolTipCutilineEvent";
		
		public var item:Object;
		
		public var eventType:String;
		
		public function ToolTipCutilineEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}