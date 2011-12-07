package org.hu.fextjs.event
{
	import flash.events.Event;
	
	
	/**
	 * @作者：HUBO
	 * @创建时间：2011-12-7
	 * @邮件：hubo.0508@gmail.com
	 * @全路径： org.hu.fextjs.event.FColumnMouseEvent.as
	 */
	public class CellsMouseEvent extends Event
	{
		
		public static const EVENT_TYPE:String = "cellsMouseEvent";
		
		public var types:String;
		
		public function CellsMouseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}