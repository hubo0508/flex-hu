package org.hubo.flexextjs.event.gridButton
{
	import flash.events.Event;
	
	import mx.controls.DataGrid;
	
	/**
	 * 点击SGButtonBar上所有按钮事件类
	 * 
	 * @HUBO
	 */
	public class ButtonEvent extends Event
	{
	
		/**
		 * 事件类型：buttonClick
		 */
		public static const BUTTON:String = "buttonClick";
		
		/**
		 * SimpleGrid组件内的DataGrid
		 */
		private var _dataGrid:DataGrid;
		
		/**
		 * 到得SimpleGrid控件内DataGrid选择了数居源
		 */
		private var _data:Array;
		
		/**
		 * 事件类型，用于区分所对应控件SGButtonBar的那个按钮
		 */
		private var _eventType:String;
	
		
		public function ButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
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

		/**
		 * 事件类型，用于区分所对应控件SGButtonBar的那个按钮
		 */
		public function get eventType():String
		{
			return _eventType;
		}

		/**
		 * @private
		 */
		public function set eventType(value:String):void
		{
			_eventType = value;
		}

	}
}