package org.hubo.flexextjs.event
{
	import flash.events.Event;
	
	import org.hubo.flexextjs.vo.JavaPageVo;
	
	/**
	 * 分页事件类
	 * 
	 * @HUBO
	 */
	public class PageEvent extends Event
	{
		
		/**
		 * 事件类型：pageEvent
		 */
		public static const PAGE_EVENT:String = "pageEvent";
		
		/**
		 * 点击分页按钮类型
		 * 
		 */
		private var _pageType:String;
		
		/**
		 * 分页相关参数存储对象
		 */
		private var _pageVo:JavaPageVo;
		
		/**+++++++++++++++++++++++++++++++++++++++++++*/
		/**分页状态*/
		/**+++++++++++++++++++++++++++++++++++++++++++*/
		/**
		 * 首页
		 */
		public static const PAGE_FIRST_STATUS:String = "pageFirst";
		
		/**
		 * 下一页
		 */
		public static const PAGE_NEXT_STATUS:String = "pageNext";
		
		/**
		 * 上一页
		 */
		public static const PAGE_PREV_STATUS:String = "pagePrev";
		
		/**
		 * 末页
		 */
		public static const PAGE_LAST_STATUS:String  = "pageLast";	
	
		
		public function PageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		/**
		 *  分页相关参数存储对象
		 */
		public function get pageVo():JavaPageVo
		{
			return _pageVo;
		}

		/**
		 * @private
		 */
		public function set pageVo(value:JavaPageVo):void
		{
			_pageVo = value;
		}

		/**
		 * 点击分页按钮类型
		 * 
		 * @param pageFirst:String 首页
		 * @param pageNext:String 下一页
		 * @param pagePrev:String 上一页
		 * @param pageLast:String 末页
		 */
		public function get pageType():String
		{
			return _pageType;
		}

		/**
		 * @private
		 */
		public function set pageType(value:String):void
		{
			_pageType = value;
		}


	}
}