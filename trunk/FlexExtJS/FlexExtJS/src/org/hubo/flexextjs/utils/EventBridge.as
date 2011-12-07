/**
 * @Project FlexExtJS_lib
 * @Title EventBridge.as
 * @Package org.hubo.flexextjs.utils
 * @date Jan 25, 2011 12:11:13 PM
 * @version V1.0 
 */
package org.hubo.flexextjs.utils
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * author： HUBO hubo.0508ⓐgmail.com    /  date：Jan 23, 2011 7:08:40 PM
	 * 
	 * 在需要的任意地方添加监听：
	 * EventBridge.addEventListener("event_name", eventhandler);
	 * 
	 * 在需要的任意地方抛出事件，不需要一层层冒泡：
	 * EventBridge.dispatchEvent(event);
	 */
	public class EventBridge extends EventDispatcher
	{
		public function EventBridge()
		{
		}

		private static var instance:EventBridge=new EventBridge();

		public static function dispatchEvent(event:Event):void
		{
			instance.dispatchEvent(event);
		}

		public static function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			instance.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		public static function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			instance.removeEventListener(type, listener, useCapture);
		}

		public static function hasEventListener(type:String):Boolean
		{
			return instance.hasEventListener(type);
		}

	}
}