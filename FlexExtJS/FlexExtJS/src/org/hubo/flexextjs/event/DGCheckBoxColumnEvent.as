package org.hubo.flexextjs.event
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * 点击每列前复选框时事件
	 * 
	 * @author HUBO hubo.0508@gmail.com
	 */
	public class DGCheckBoxColumnEvent extends  Event
	{
		public static const DG_CHECK_BOX_COLUMN:String = "DGCheckBoxColumnEvent";
		
		private var _dgSelectedItem:Array;
		
		public function DGCheckBoxColumnEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public function get dgSelectedItem():Array
		{
			return _dgSelectedItem;
		}

		public function set dgSelectedItem(value:Array):void
		{
			_dgSelectedItem = value;
		}

	}
}