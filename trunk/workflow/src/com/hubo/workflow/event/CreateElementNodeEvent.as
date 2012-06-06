package com.hubo.workflow.event
{
	import com.hubo.workflow.core.ElementNode;
	
	import flash.events.Event;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-6-7  /  hubo.0508ⓐgmail.com</br>com.hubo.workflow.event.CreateElementNodeEvent.as</b>
	 * </p>
	 */
	public class CreateElementNodeEvent extends Event
	{
		public static const CREATE_ELEMENT_NODE:String = "createElementNode";
		
		public var node:ElementNode;
		
		public function CreateElementNodeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}