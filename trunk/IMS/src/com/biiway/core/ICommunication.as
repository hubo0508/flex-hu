package com.biiway.core
{
	import flash.events.IEventDispatcher;

	public interface ICommunication extends IEventDispatcher
//	public interface ICommunication
	{
		
		/**
		 * 设置消息
		 */
		function setMessage(obj:Object):void;
		
		/**
		 * 得到消息
		 */
		function getMessage():Object;

	}
}