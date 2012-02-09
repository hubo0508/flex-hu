package  com.printingoffice.components
{
	
	import flash.display.Graphics;
	import flash.geom.Point;
	
	import mx.core.IVisualElement;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	
	public class TooTip extends SkinnableContainer
	{
		public function TooTip(message:String = "")
		{
			super();
			
			this.text = message;
		}
		
		private var _text:String;
		private var _triangleH:int = 8;
		private var _triangleW:int = 8;
		
		private var label:Label;
		
		override protected function measure():void
		{
			super.measure();
			measuredHeight = 29;
		}
		
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
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if(label)
			{
				label.horizontalCenter = 0;
				label.verticalCenter = -2;
				label.setStyle("color",0xFFFFFF);
				label.setStyle("paddingLeft",5);
				label.setStyle("paddingRight",5);
			}
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void
		{			
			super.updateDisplayList(w, h);
			
			graphics.clear();
			graphics.beginFill(0x000000);

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

		public function get triangleH():int
		{
			return _triangleH;
		}

		public function set triangleH(value:int):void
		{
			_triangleH = value;
		}

		public function get triangleW():int
		{
			return _triangleW;
		}

		public function set triangleW(value:int):void
		{
			_triangleW = value;
		}

		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

		
	}
}