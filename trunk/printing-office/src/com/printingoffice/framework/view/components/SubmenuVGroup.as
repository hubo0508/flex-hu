package com.printingoffice.framework.view.components
{
	import flash.events.Event;
	
	import spark.components.VGroup;

	[Event(name="scrollPositionChange",type="flash.events.Event")]

	/**
	 * <p>
	 *     <b>HUBO 2012-2-17  /  hubo.0508ⓐgmail.com</br>com.printingoffice.framework.view.components.SubmenuVGroup.as</b>
	 * </p>
	 */
	public class SubmenuVGroup extends VGroup
	{
		public function SubmenuVGroup()
		{
			super();
		}
		
		override public function set verticalScrollPosition(value:Number):void
		{
			super.verticalScrollPosition = value;

			this.dispatchEvent(new Event("scrollPositionChange"));
		}
	}
}