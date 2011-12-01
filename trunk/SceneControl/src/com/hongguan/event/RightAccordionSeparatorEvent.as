package com.hongguan.event
{
	import flash.events.Event;
	
	public class RightAccordionSeparatorEvent extends Event
	{
		
		public static const RIGHT_SEPARATOR_EVENT:String = "rightAccordionSeparatorEvent";
		
		public var separatorType:String;
		
		public function RightAccordionSeparatorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}