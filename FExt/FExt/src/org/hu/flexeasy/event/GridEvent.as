package org.hu.flexeasy.event
{
	import flash.events.Event;
	
	
	/**
	 * @作者：HUBO
	 * @创建时间：2011-12-12
	 * @邮件：hubo.0508@gmail.com
	 * @全路径： org.hu.fextjs.event.GridEvent.as
	 */
	public class GridEvent extends Event
	{
		public static const ITEM_CLICK:String = "itemClick";
		
		public static const BOX_COLUMN_CHANGE:String = "boxCloumnChange";
		
		public var selectItems:Array;
		public var selectRowsIndex:Array;
		public var selected:Boolean;
		
		public function GridEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}