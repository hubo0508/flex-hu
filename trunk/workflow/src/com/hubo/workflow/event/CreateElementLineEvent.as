package com.hubo.workflow.event
{
	import com.hubo.workflow.ui.child.ElementLine;
	
	import flash.events.Event;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-6-7  /  hubo.0508ⓐgmail.com</br>com.hubo.workflow.event.CreateElementNodeEvent.as</b>
	 * </p>
	 */
	public class CreateElementLineEvent extends Event
	{
		public static const CREATE_ELEMENT_LINE:String = "createElementLine";
		
		public var line:ElementLine;
		
		public var upElementNodeSID:int;
		
		public function CreateElementLineEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}