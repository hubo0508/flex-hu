/**
 * @Project IWMP_lib
 * @Title ClosePanelBoxEvent.as
 * @Package com.biiway.framework.event
 * @Description TODO
 * @date Apr 20, 2011 12:45:46 AM
 * @version V1.0  
 */
package com.biiway.framework.event
{
	import flash.events.Event;
	
	
	/** 
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 20, 2011
	 */
	public class ClosePanelBoxEvent extends Event
	{
		public static const CLOSE_PANEL_BOX:String = "closePanelBox";
		
		private var _SID:String;
		private var _name:String;
		
		public function ClosePanelBoxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get SID():String
		{
			return _SID;
		}

		public function set SID(value:String):void
		{
			_SID = value;
		}


	}
}