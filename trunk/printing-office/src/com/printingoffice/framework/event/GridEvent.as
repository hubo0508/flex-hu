package com.printingoffice.framework.event
{
	import flash.events.Event;
	import flash.geom.Point;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-20  /  hubo.0508ⓐgmail.com</br>com.printingoffice.framework.event.GridEvent.as</b>
	 * </p>
	 */
	public class GridEvent extends Event
	{
		public static const ICON_ROLL_EVENT:String = "iconRollEvent";
		
		public static const GRID_EVENT:String = "gridEvent";
		
		public var point:Point;
		
		public var types:String;
		
		public function GridEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}