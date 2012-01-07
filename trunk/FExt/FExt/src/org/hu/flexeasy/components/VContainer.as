package org.hu.flexeasy.components
{
	import flash.display.CapsStyle;
	import flash.display.Graphics;
	import flash.display.LineScaleMode;
	import flash.events.MouseEvent;

	import spark.components.Group;
	import spark.components.VGroup;

	public class VContainer extends VGroup
	{
		
		public var borderSides:String="all";
		public var backgroupColor:uint = 0;
		public var borderColor:uint = 0xB5B8C8;		
		public var itemColorsVisible:Boolean = false;
		public var rollOverColor:uint = 0xB2E1FF;
		
		public function VContainer()
		{
			super();
		}

		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);
			
			var g:Graphics=graphics;
			if (isNaN(w) || isNaN(h))
				return;
			g.clear();
			
			//具体显示那些线段
			var sides:Array=this.lineSides(this.borderSides);
			
			//背景色
			if(backgroupColor != 0)
			{
				g.beginFill(backgroupColor, 1);
				g.drawRect(0, 0, w, h);
				g.endFill();
			}
			
			//边框线条颜色
			g.lineStyle(1, borderColor);
			
			if (sides.left == "left")
			{
				g.moveTo(0, 0);
				g.lineTo(0, h);
			}
			if (sides.right == "right")
			{
				g.moveTo(w, 0);
				g.lineTo(w, h);
			}
			if (sides.top == "top")
			{
				g.moveTo(0, 0);
				g.lineTo(w, 0);
			}
			if (sides.bottom == 'bottom')
			{
				g.moveTo(0, h);
				g.lineTo(w, h);
			}
		}
		
		private function lineSides(value:String):Array
		{
			value = value == "all" ? "left right bottom top" : value;
			
			var arr:Array=[];
			value=this.trim(value);
			if (value)
			{
				var sidesArr:Array=value.split(" ");
				
				var i:int=0, len:int=sidesArr.length;
				for (i; i < len; i++)
				{
					var line:String=sidesArr[i];
					if (line == "left") { arr.left=line; }
					if (line == "right") { arr.right=line; }
					if (line == "top") { arr.top=line; }
					if (line == "bottom") { arr.bottom=line; }
				}
			}
			return arr;
		}
		
		private function trim(str:String):String
		{
			if (str == null)
			{
				return str;
			}
			return str.replace(/^\s*|\s*$/g, "").split(" ").join(" ").replace(new RegExp("\\s{2,}", "g"), " ");
		}
		
	}
}