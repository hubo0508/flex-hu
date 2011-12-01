package com.biiway.event
{
	import flash.events.Event;
	
	public class ToolsEvent extends Event
	{
		
		public static const TOOLS_EVENT:String = "clickTools";
		
		public var toolsType:String;
		
		public function ToolsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}