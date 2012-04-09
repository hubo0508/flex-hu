package org.flexgrid.util
{
	import flash.display.Graphics;
	

	/**
	 * <p><b>HUBO 2012-1-18  /  hubo.0508ⓐgmail.com</br>org.hu.flexeasy.util.Utils.as</b></p>
	 */
	public class Utils
	{
		public function Utils()
		{
		}
		
		
		public static function drawBackgroup(color:uint, g:Graphics, w:Number, h:Number,alpha:Number=1):void
		{
			if (color != 0)
			{
				g.beginFill(color, alpha);
				g.drawRect(0, 0, w, h);
				g.endFill();
			}
		}

		public static function drawBorder(sides:Array, g:Graphics, w:Number, h:Number):void
		{
			if (sides.left == "left")
			{
				g.moveTo(0, 0);
				
				if (sides.bottom != 'bottom'){
					g.lineTo(0, h);
				}else{
					g.lineTo(0, h-1);
				}
			}
			
			if (sides.right == "right")
			{
				g.moveTo(w-1, 0);
				g.lineTo(w-1, h-1);
				
				if (sides.bottom != 'bottom'){
					g.lineTo(w, h);
				}else{
					g.lineTo(w-1, h-1);
				}
			}
			
			if (sides.top == "top")
			{
				g.moveTo(0, 0);
				g.lineTo(w-1, 0);
			}
			
			if (sides.bottom == 'bottom')
			{
				g.moveTo(0, h-1);
				g.lineTo(w, h-1);
			}
		}

		public static function lineSides(value:String):Array
		{
			value=value == "all" ? "left right bottom top" : value;

			var arr:Array=[];
			value=trim(value);
			if (value)
			{
				var sidesArr:Array=value.split(" ");

				var i:int=0, len:int=sidesArr.length;
				for (i; i < len; i++)
				{
					var line:String=sidesArr[i];
					if (line == "left")
					{
						arr.left=line;
					}
					if (line == "right")
					{
						arr.right=line;
					}
					if (line == "top")
					{
						arr.top=line;
					}
					if (line == "bottom")
					{
						arr.bottom=line;
					}
				}
			}
			return arr;
		}

		public static function trim(str:String):String
		{
			if (str == null)
			{
				return str;
			}
			return str.replace(/^\s*|\s*$/g, "").split(" ").join(" ").replace(new RegExp("\\s{2,}", "g"), " ");
		}
	}
}