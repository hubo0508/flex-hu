package org.hu.flexeasy.event
{
	import flash.events.Event;
	
	/**
	 * 点击每列前复选框时事件
	 * 
	 * <p><b>HUBO   /  hubo.0508ⓐgmail.com</br>org.hu.flexeasy.util.Constant.as</b></p>
	 */
	public class ClickColumnBeforeBoxEvent extends  Event
	{
		public static const EVENT_TYPE:String = "clickColumnBeforeBoxEvent";
		
		public var selectedItem:Array;
		
		public function ClickColumnBeforeBoxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

	}
}