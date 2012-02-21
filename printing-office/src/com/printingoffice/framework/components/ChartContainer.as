package com.printingoffice.framework.components
{
	import flash.events.Event;
	
	import mx.events.DynamicEvent;
	
	import spark.components.VGroup;
	
	[Event(name="updateSizeEvent", type="mx.events.DynamicEvent")]
	
	/**
	 * <p>图表外部容器</p>
	 * 
	 * <p>
	 *     <b>HUBO 2012-2-21  /  hubo.0508ⓐgmail.com</br>com.printingoffice.framework.components.ChartContainer.as</b>
	 * </p>
	 */
	public class ChartContainer extends VGroup
	{
		
		public static const UPDATE_SIZE_EVENT:String = "updateSizeEvent";
		
		public function ChartContainer()
		{
			super();
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w,h);
			
			var dye:DynamicEvent = new DynamicEvent(UPDATE_SIZE_EVENT);
			dye.w = w;
			dye.h  = h;
			
			this.dispatchEvent(dye);
		}
	}
}