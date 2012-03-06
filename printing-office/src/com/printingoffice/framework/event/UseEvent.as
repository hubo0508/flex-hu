package com.printingoffice.framework.event
{
	import flash.events.Event;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-3-6  /  hubo.0508ⓐgmail.com</br>com.printingoffice.framework.event.MouseEvent.as</b>
	 * </p>
	 */
	public class UseEvent extends Event
	{
		
		public static const ITEM_LIST_CLICK:String = "itemListClick";
		
		public var data:Object;
		
		public function UseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}