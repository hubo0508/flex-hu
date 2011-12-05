package org.hu.fextjs.components.dataGrid
{
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.controls.dataGridClasses.DataGridColumn;
	
	
	[Event(name="click", type="flash.events.MouseEvent")]
	
	
	/**
	 * 自定义列
	 */
	public class DGColumn extends DataGridColumn
	{
		/**
		 * 用户保存用户选中的数据 
		 */
		public var selectItemsData:Array = [];
		
		/**存储选择数据*/
		public var saveSelectedItem:Array = [];
		
		/**DataGrid前的选择框是否为单选*/
		private var _radioBox:Boolean = false;
		
		/**对每列前的复选框设置是否捕获事件  (default=false)*/
		private var _addClickEvent:Boolean = false;
		
		/**is the checkbox selected**/
		public var selected:Boolean = false;
		
		public function DGColumn()
		{
			super();			
		}
		
		/**
		 * DataGrid前的选择框是否为单选
		 * 
		 * @param value:Boolean(defalut=flase)　默认用户可以选择多个值
		 */
		public function get radioBox():Boolean
		{
			return _radioBox;
		}

		public function set radioBox(value:Boolean):void
		{
			_radioBox = value;
		}
		
		
		public function get addClickEvent():Boolean
		{
			return _addClickEvent;
		}
		
		public function set addClickEvent(value:Boolean):void
		{
			_addClickEvent = value;
		}

	}
}