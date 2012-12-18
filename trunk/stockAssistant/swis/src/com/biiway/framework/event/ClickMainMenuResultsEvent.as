/**
 * @Project IWMP_lib
 * @Title ClickMainMenuResultsEvent.as
 * @Package com.biiway.framework.event
 * @Description TODO
 * @date Apr 19, 2011 10:42:59 PM
 * @version V1.0  
 */
package com.biiway.framework.event
{
	import flash.events.Event;
	
	
	/** 
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 19, 2011
	 */
	public class ClickMainMenuResultsEvent extends Event
	{
		
		public static const CLICK_MAIN_MENU_RESULTS:String = "clickMainMenuResults";
	
		private var _addFlag:Boolean = false;
		private var _name:String;
		private var _eventType:String;
		
		public function ClickMainMenuResultsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public function get addFlag():Boolean
		{
			return _addFlag;
		}

		public function set addFlag(value:Boolean):void
		{
			_addFlag = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get eventType():String
		{
			return _eventType;
		}

		public function set eventType(value:String):void
		{
			_eventType = value;
		}


	}
}