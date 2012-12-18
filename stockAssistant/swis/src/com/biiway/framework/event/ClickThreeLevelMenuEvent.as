/**
 * @Project IWMP_lib
 * @Title ClickThreeLevelMenuEvent.as
 * @Package com.biiway.framework.event
 * @Description TODO
 * @date Apr 21, 2011 11:13:23 AM
 * @version V1.0 
 */
package com.biiway.framework.event
{
	import flash.events.Event;


	/**
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 21, 2011
	 */
	public class ClickThreeLevelMenuEvent extends Event
	{
		public static const CLICK_THREE_LEVEL_MENU:String="clickThreeLevelMenu";

		private var _name:String;
		private var _eventType:String;

		public function ClickThreeLevelMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name=value;
		}

		public function get eventType():String
		{
			return _eventType;
		}

		public function set eventType(value:String):void
		{
			_eventType=value;
		}


	}
}