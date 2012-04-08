package org.flexgrid.components
{
	import flash.display.Graphics;
	
	import org.flexgrid.util.Utils;
	
	import spark.components.Group;
	
	/**
	 * <p>
	 *     <b>HUBO 2012-4-8  /  hubo.0508ⓐgmail.com</br>org.flexgrid.components.CustomGroup.as</b>
	 * </p>
	 */
	public class CustomGroup extends Group
	{
		public function CustomGroup()
		{
		}
		
		/**
		 * 容器边框属性，以字符串形式定义；多个值以单个空格相隔，如“left right"，表示创建容器时一同将左边与右边边框线显示出来。显示默认值为空字符串。</br>
		 * 可用值为：left right top bottom，这四个值可随意组合。
		 */
		private var _borderSides:String="";
		public var bgColor:Object;
		public var borderColor:uint = 0xB5B8C8;
		
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);
			
			if(borderSides == "" && bgColor == null)
				return;
			
			var g:Graphics=graphics;
			if (isNaN(w) || isNaN(h))
				return;
			g.clear();
			
			if(bgColor != null)
			{
				Utils.drawBackgroup(bgColor as uint,g,w,h);	
			}
			
			if(borderSides != "")
			{
				g.lineStyle(1, borderColor);
				Utils.drawBorder(Utils.lineSides(borderSides),g,w,h);
			}
		}

		/**
		 * 容器边框属性，以字符串形式定义；多个值以单个空格相隔，如“left right"，表示创建容器时一同将左边与右边边框线显示出来。显示默认值为空字符串。</br>
		 * 可用值为：left right top bottom，这四个值可随意组合。
		 */
		public function get borderSides():String
		{
			return _borderSides;
		}

		/**
		 * @private
		 */
		public function set borderSides(value:String):void
		{
			_borderSides = value;
		}

	}
}