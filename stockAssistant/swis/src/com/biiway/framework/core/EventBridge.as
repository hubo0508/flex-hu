/**
 * @Project IWMP
 * @Title EventBridge.as
 * @Package com.baiwu.util
 * @Description TODO
 * @date Apr 16, 2011 10:08:59 AM
 * @version V1.0  
 */
package com.biiway.framework.core
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	
	/** 
	 * 在Flex应用中,由于actionscript3的事件机制是在显示对象一层层向上冒泡的,
	 * 所以如果在比较复杂的页面结构的时候，你可能会被事件的一层层的冒泡搞的晕头转向.
	 * 而且在底层派发事件,高层侦听事件，也是很麻烦的一件事情.
	 * 有了”事件桥”这一切将不再是问题,事件桥的功能是它可以把一个事件从一个地方传到任意另外一个地方.不需要冒泡!
	 * 因为他不通过显示对象的父子关系级级散发,而通过一个第三方类来跳转。
	 * 
	 * <p>
	 * 将事件转换成单例的形似 事件的广播与接受不再由DisplayObject来发送与接受 都从EventBridge中操作 就不需要像传统事件 需要冒泡找到事件指定的源
	 * </P>
	 * 
	 * <p>
	 * 在需要的任意地方添加监听：EventBridge.addEventListener("event_name", eventhandler);
	 * </P>
	 * 
	 * <p>
	 * 在需要的任意地方抛出事件，不需要一层层冒泡：EventBridge.dispatchEvent(event);
	 * </p>
	 * 
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 16, 2011
	 */
	public class EventBridge extends EventDispatcher
	{
		public function EventBridge(target:IEventDispatcher=null)
		{
			super(target);
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