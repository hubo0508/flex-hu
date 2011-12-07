package org.hubo.flexextjs.components
{
	import flash.events.FocusEvent;
	
	import spark.components.TextInput;
	
	public class Input extends TextInput
	{
		[Bindable]
		private var _emptyText:String;
		
		[Bindable]
		private var _emptyColor:uint = 7171437;
		
		private var sysColor:uint = 0;
		
		private var textChanged:Boolean = true;
		
		public function Input()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			if(emptyText)
			{
				super.text = emptyText;
				super.setStyle("color",emptyColor);
			}
			else
			{
				super.setStyle("color",sysColor);
			}
		}
		
		override protected function focusInHandler(event:FocusEvent):void
		{
			super.focusInHandler(event);
			var color:uint = super.getStyle("color");
			if(super.text == emptyText && emptyColor == color )
			{
				super.text = null;
				super.setStyle("color",sysColor);
			}		
		}
		
		override protected function focusOutHandler(event:FocusEvent):void
		{
			super.focusOutHandler(event);
			if((super.text == null || super.text.replace(/^\s*|\s*$/g, "").split(" ").join("") == "" ))
			{				
				super.text = emptyText;
				super.setStyle("color",emptyColor);
			}
		}
		
		override public function get text():String
		{			
			var color:uint = super.getStyle("color") as uint;
			if(super.text == emptyText && color == emptyColor)
			{
				return null;
			}
			else
			{
				return super.text;
			}
		}
		
		/**
		 * 对语句进行清理,该清理器用于清理语句左右两边的空格
		 * 
		 * @param str:String 一 语句
		 * 
		 * @return 清理完成的语句
		 */
		public function textTrim():String
		{
			if(text == null)
			{
				return text;
			}
			return text.replace(/^\s*|\s*$/g, "").split(" ").join(" ")
		}
		
		override protected function updateDisplayList(unscaledWidth :Number,unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
		}
		

		public function get emptyText():String
		{
			return _emptyText;
		}

		public function set emptyText(value:String):void
		{
			_emptyText = value;
		}

		public function get emptyColor():uint
		{
			return _emptyColor;
		}

		public function set emptyColor(value:uint):void
		{
			_emptyColor = value;
		}
	}
}