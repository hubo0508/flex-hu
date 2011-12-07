package org.hubo.flexextjs.event.gridButton
{
	import flash.events.Event;
	
	import mx.controls.DataGrid;
	
	/**
	 * 更新事件类
	 * 
	 * @HUBO
	 */
	public class UpdateEvent extends Event
	{
	
		/**
		 * 事件类型：updateClick
		 */
		public static const UPDATE:String = "updateClick";
		
		/**
		 * SimpleGrid组件内的DataGrid
		 */
		private var _dataGrid:DataGrid;
		
		/**
		 * 到得SimpleGrid控件内DataGrid选择了数居源
		 */
		private var _data:Array;
		
		public function UpdateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		/**
		 * SimpleGrid组件内的DataGrid
		 */
		public function get dataGrid():DataGrid
		{
			return _dataGrid;
		}
		
		/**
		 * @private
		 */
		public function set dataGrid(value:DataGrid):void
		{
			_dataGrid=value;
		}
		
		/**
		 * 到得SimpleGrid控件内DataGrid选择了数居源
		 */
		public function get data():Array
		{
			return _data;
		}
		
		/**
		 * @private
		 */
		public function set data(value:Array):void
		{
			_data=value;
		}

	}
}