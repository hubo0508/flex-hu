package org.hubo.flexextjs.utils
{
	public class StringUtils
	{
		
		private static const LEFT:String="left";
		private static const RIGHT:String="right";
		private static const TOP:String="top";
		private static const BOTTOM:String="bottom";
		private static const LINE_TOP:String = "lineTop";
		
		
		public function StringUtils()
		{
			
		}
		
		public static function analysisPackage(value:String):Array
		{
			var arr:Array = [];
			
			var packages:String = value.substring(0, value.lastIndexOf("."));
			var methods:String = value.substring(value.lastIndexOf(".")+1);
			arr.packages = packages;
			arr.methods = methods;
			
			return arr;
		}
		
		public static function lineSides(value:String):Array
		{
			var arr:Array=[];
			value=trim(value);
			if (value)
			{
				var sidesArr:Array=value.split(" ");
				
				var i:int=0, len:int=sidesArr.length;
				for (i; i < len; i++)
				{
					var line:String=sidesArr[i];
					if (line == LEFT)
					{
						arr.push(LEFT);
					}
					else if (line == RIGHT)
					{
						arr.push(RIGHT);
					}
					else if (line == TOP)
					{
						arr.push(TOP);
					}
					else if (line == BOTTOM)
					{
						arr.push(BOTTOM);
					}
					else if(line == LINE_TOP)
					{
						arr.push(LINE_TOP);
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