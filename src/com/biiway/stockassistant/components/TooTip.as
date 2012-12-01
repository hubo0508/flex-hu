package com.biiway.stockassistant.components
{
	
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.geom.Point;
	
	import mx.core.IVisualElement;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	
	/**
	 * <p>消息提示容器</p>
	 * 
	 * <p>
	 *     <b>HUBO 2012-2-9  /  hubo.0508ⓐgmail.com</br>com.printingoffice.components.SkinnableContainer.as</b>
	 * </p>
	 */
	public class TooTip extends SkinnableContainer
	{
		public function TooTip(message:String = "")
		{
			super();
			
			this.text = message;
		}
		
		/**
		 * 容器显示文本值
		 */
		private var _text:String;
		
		/**
		 * 容器顶部三角形默认高度(default=8)
		 */
		private var _triangleH:int = 8;
		
		/**
		 * 容器顶部三角形默认宽度(default=8)
		 */
		private var _triangleW:int = 8;
		
		/**
		 * 文本标签【内部使用】
		 */
		private var label:Label;
		
		/**
		 * 容器背景颜色(default=0x000000)
		 */
		private var _bgColor:uint = 0x000000;
		
		/**
		 * 继续父容器measure()，重新定义默认高度
		 */
		override protected function measure():void
		{
			super.measure();
			measuredHeight = 29;
		}
		
		/**
		 * 继续父容器createChildren()，创建文本标签
		 */
		override protected function createChildren():void
		{
			super.createChildren();
			
			if(!label)
			{
				label = new Label();
				label.text = this.text;
				
				this.addElement(label);
			}
		}
		
		/**
		 * 继续父容器commitProperties()，更改文本标签的属性值设置
		 */
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if(label)
			{
				label.horizontalCenter = 0;
				label.verticalCenter = -1;
				label.setStyle("color",0xFFFFFF);
				label.setStyle("paddingLeft",8);
				label.setStyle("paddingRight",8);
			}
		}
		
		/**
		 * <p>继续父容器updateDisplayList()</p>
		 * 
		 * 对容器真充背景颜色，重新绘制边框，在其容器顶部增加三角形。
		 */
		override protected function updateDisplayList(w:Number, h:Number):void
		{			
			super.updateDisplayList(w, h);
			
			graphics.clear();
			graphics.beginFill(bgColor);

			this.graphics.moveTo(0, 0);
			
			var _x:Number  = w*0.5 - triangleW*0.5;			
			this.graphics.lineTo(_x, 0);
			this.graphics.lineTo(_x+triangleW*0.5, -triangleH);
			this.graphics.lineTo(_x+triangleW, 0);
			this.graphics.lineTo(_x+triangleW, 0);
			
			//top>right>bottom>left
			this.graphics.lineTo(w, 0);		
			this.graphics.lineTo(w, h);
			this.graphics.lineTo(0, h);
			this.graphics.lineTo(0, 0);
			
			graphics.endFill();
		}


		/**
		 * 容器显示文本值
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
			
			if(label && label.text != value)
			{
				label.text = value;
			}
		}

		/**
		 * 容器顶部三角形默认高度(default=8)
		 */
		public function get triangleH():int
		{
			return _triangleH;
		}

		/**
		 * @private
		 */
		public function set triangleH(value:int):void
		{
			_triangleH = value;
		}

		/**
		 * 容器顶部三角形默认宽度(default=8)
		 */
		public function get triangleW():int
		{
			return _triangleW;
		}

		/**
		 * @private
		 */
		public function set triangleW(value:int):void
		{
			_triangleW = value;
		}

		/**
		 * 容器背景颜色(default=0x000000)
		 */
		public function get bgColor():uint
		{
			return _bgColor;
		}

		/**
		 * @private
		 */
		public function set bgColor(value:uint):void
		{
			_bgColor = value;
		}
	}
}