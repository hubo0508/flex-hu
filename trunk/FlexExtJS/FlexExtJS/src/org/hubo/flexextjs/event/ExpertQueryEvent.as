package org.hubo.flexextjs.event
{
	import flash.events.Event;
	
	/**
	 * 关键字查询事件类
	 * 
	 * @HUBO
	 */
	public class ExpertQueryEvent extends Event
	{
		
		/**
		 * 事件类型：expertQuery
		 */
		public static const EXPERT_QUERY:String = "expertQuery";
		
	
		
		public function ExpertQueryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

	}
}