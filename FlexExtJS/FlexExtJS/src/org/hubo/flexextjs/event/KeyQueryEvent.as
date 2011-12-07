package org.hubo.flexextjs.event
{
	import flash.events.Event;
	
	/**
	 * 关键字查询事件类
	 * 
	 * @HUBO
	 */
	public class KeyQueryEvent extends Event
	{
		
		/**
		 * 事件类型：keyQuery
		 */
		public static const KEY_QUERY:String = "keyQuery";
		
		/**
		 * 存储查询关键字
		 */
		private var _queryText:String;
		
		public function KeyQueryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		/**
		 * 查询关键字
		 * 
		 * @param value:String
		 */
		public function get queryText():String
		{
			return _queryText;
		}

		/**
		 * @parivate
		 */
		public function set queryText(value:String):void
		{
			_queryText = value;
		}

	}
}