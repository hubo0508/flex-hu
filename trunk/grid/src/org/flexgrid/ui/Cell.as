package org.flexgrid.ui
{
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.events.DynamicEvent;
	
	import org.flexgrid.components.CellLabel;
	import org.flexgrid.components.CustomGroup;
	import org.flexgrid.util.ConstantsLibrary;
	
	import spark.components.Group;
	import spark.components.Label;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-4-8  /  hubo.0508ⓐgmail.com</br>org.flexgrid.ui.Cell.as</b>
	 * </p>
	 */
	public class Cell extends CustomGroup
	{
		
		/*
		 * 显示文本 
		 */
		private var tagText:CellLabel;
		
		/**
		 * 显示文本是否在过长时截断文本，默认为true
		 */
		private var _isTruncated:Boolean = true;
		
		/**
		 * 显示文本左右便宜量，默认为1 
		 */
		private var _offset:int = 5;
		
		/**
		 * 显示文本
		 */
		private var _text:String;
		
		public function Cell()
		{
			super();
		}
		
		override protected function measure():void
		{
			super.measure();
			this.measuredHeight = ConstantsLibrary.CELL_HEIGHT;
			this.measuredWidth = ConstantsLibrary.CELL_WEIGHT;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			if(!tagText)
			{
				tagText = new CellLabel();
				tagText.addEventListener("changeCellLabel",changeCellLabel);
				
				this.addElement(tagText);
			}
		}

		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if(tagText)
			{
				tagText.verticalCenter = 0;
				tagText.setStyle("paddingLeft",offset);
				tagText.text = text;
				if(isTruncated){
					tagText.maxDisplayedLines = 1;
				}
			}
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w,h);
			
			if(tagText && tagText.maxWidth != w)
			{
				tagText.maxWidth = this.width;
				//mx.controls.Alert.show(this.verticalScrollPosition+"");
			}
		}
		
		/**
		 * 当CellLabel组件高度
		 */
		protected function changeCellLabel(event:DynamicEvent):void
		{
			var newHeight:Number = event.value as Number;
			if(this.height < newHeight && this.height != (newHeight + 8))
			{
				this.height = newHeight + 8;
			}
		}
		
		/**
		 * 显示文本是否在过长时截断文本，默认为true
		 */
		public function get isTruncated():Boolean
		{
			return _isTruncated;
		}

		/**
		 * @private
		 */
		public function set isTruncated(value:Boolean):void
		{
			_isTruncated = value;
		}

		/**
		 * 显示文本左右便宜量，默认为1 
		 */
		public function get offset():int
		{
			return _offset;
		}

		/**
		 * @private
		 */
		public function set offset(value:int):void
		{
			_offset = value;
		}

		/**
		 * 显示文本
		 */
		public function get text():String
		{
			return _text;
		}

		/**
		 * @private
		 */
		public function set text(value:String):void
		{
			_text = value;
		}


	}
}