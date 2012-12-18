/**
 * @Project IWMP_lib
 * @Title ClickSecondaryMenuEvent.as
 * @Package com.biiway.framework.event
 * @Description TODO
 * @date Apr 19, 2011 2:32:11 PM
 * @version V1.0  
 */
package com.biiway.framework.event
{
	import flash.events.Event;
	
	
	/** 
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 19, 2011
	 */
	public class ClickSecondaryMenuEvent extends Event
	{
		public static const CLICK_SECONDARY_MENU:String = "clickSecondaryMenu";
		
		private var _eventType:String;
		
		private var _sid:String;
		
		private var _name:String;
		
		public function ClickSecondaryMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public function get eventType():String
		{
			return _eventType;
		}

		public function set eventType(value:String):void
		{
			_eventType = value;
		}

		public function get sid():String
		{
			return _sid;
		}

		public function set sid(value:String):void
		{
			_sid = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}


	}
}