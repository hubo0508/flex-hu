package com.hongguan.event
{
	import flash.events.Event;
	
	public class CutlineEvent extends Event
	{	
		public static const CUTLINE_EVENT:String = "cutlineEvent";
		
		public var cutlineType:String;
		public var selected:Boolean;
		
		public function CutlineEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}