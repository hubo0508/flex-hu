package org.flexgrid.ui
{
	import org.flexgrid.components.CustomGroup;
	
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
		private var tagText:Label;
		
		/**
		 * 显示文本是否在过长时截断文本，默认为true
		 */
		private var _isTruncated:Boolean = true;
		
		/**
		 * 显示文本左右便宜量，默认为1 
		 */
		private var _offset:int = 2;
		
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
			this.measuredHeight = 20;
			this.measuredWidth = 100;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			if(!tagText)
			{
				tagText = new Label();
				tagText.text = "xxxx";
				
				this.addElement(tagText);
			}
		}

		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if(tagText)
			{
				tagText.verticalCenter = 0;
				tagText.left = this.offset;
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