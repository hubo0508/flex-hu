package org.hu.flexeasy.event
{
	import flash.events.Event;
		
	/**
	 * <p><b>HUBO 2011-12-12  /  hubo.0508ⓐgmail.com</br>org.hu.flexeasy.util.Constant.as</b></p>
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