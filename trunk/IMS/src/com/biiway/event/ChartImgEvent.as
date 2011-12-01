package com.biiway.event
{
	import flash.events.Event;
	
	public class ChartImgEvent extends Event
	{
		
		public static const CHART_IMG_EVENT:String = "chartImgEvent";
		
		public var name:String;
		public var typeStr:String;
		
		public function ChartImgEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}