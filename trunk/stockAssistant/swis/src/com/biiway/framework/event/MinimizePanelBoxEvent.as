/**
 * @Project IWMP_lib
 * @Title MinimizePanelBoxEvent.as
 * @Package com.biiway.framework.event
 * @Description TODO
 * @date Apr 20, 2011 12:46:04 AM
 * @version V1.0  
 */
package com.biiway.framework.event
{
	import flash.events.Event;
	
	
	/** 
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 20, 2011
	 */
	public class MinimizePanelBoxEvent extends Event
	{
		public static const MINIMIZE_PANEL_BOX:String = "minimizePanelBox";
		
		private var _SID:String;
		private var _name:String;
		
		public function MinimizePanelBoxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
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