package org.hu.fextjs.components
{
	import flash.display.CapsStyle;
	import flash.display.Graphics;
	import flash.display.LineScaleMode;
	import flash.events.MouseEvent;

	import spark.components.Group;
	import spark.components.HGroup;

	public class HContainer extends HGroup
	{
		public function HContainer()
		{
			super();
		}

		private const LEFT:String="left";
		private const RIGHT:String="right";
		private const TOP:String="top";
		private const BOTTOM:String="bottom";

		private var _mouseOutColor:uint;
		private var _mouseOverColor:uint;

		private var _borderSides:String="";

		private var _borderColor:uint=0xB5B8C8;

		private var _backgroupColor:uint;


		protected function mouseOverHandler(event:MouseEvent):void
		{
			this._backgroupColor=_mouseOverColor;
			this.invalidateDisplayList();
		}

		protected function mouseOutHandler(event:MouseEvent):void
		{
			this._backgroupColor=_mouseOutColor;
			this.invalidateDisplayList();
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

			if (backgroupColor != 0)
			{
				g.beginFill(backgroupColor, 1); //指定一种简单的单一颜色填充
				g.drawRect(0, 0, w, h); //绘制一个矩形
				g.endFill();
			}

			g.lineStyle(1, borderColor);

			if (sides.left == this.LEFT)
			{
				g.moveTo(0, 0);
				g.lineTo(0, h);
			}
			if (sides.right == this.RIGHT)
			{
				g.moveTo(w, 0);
				g.lineTo(w, h);
			}
			if (sides.top == this.TOP)
			{
				g.moveTo(0, 0);
				g.lineTo(w, 0);
			}
			if (sides.bottom == this.BOTTOM)
			{
				g.moveTo(0, h);
				g.lineTo(w, h);
			}
		}

		/**++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**private*/
		/**++++++++++++++++++++++++++++++++++++++++++++++++++*/

		private function lineSides(value:String):Array
		{
			var arr:Array=[];
			value=this.trim(value);
			if (value)
			{
				var sidesArr:Array=value.split(" ");

				var i:int=0, len:int=sidesArr.length;
				for (i; i < len; i++)
				{
					var line:String=sidesArr[i];
					if (line == this.LEFT)
					{
						arr.left=this.LEFT;
					}
					else if (line == this.RIGHT)
					{
						arr.right=this.RIGHT;
					}
					else if (line == this.TOP)
					{
						arr.top=this.TOP;
					}
					else if (line == this.BOTTOM)
					{
						arr.bottom=this.BOTTOM;
					}
				}
			}
			return arr;
		}

		/**
		 * 对语句进行清理,该清理器用于清理语句左右两边的空格
		 *
		 * @param str:String 一 语句
		 *
		 * @return 清理完成的语句
		 */
		private function trim(str:String):String
		{
			if (str == null)
			{
				return str;
			}
			return str.replace(/^\s*|\s*$/g, "").split(" ").join(" ").replace(new RegExp("\\s{2,}", "g"), " ");
		}

		/**++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**set and get */
		/**++++++++++++++++++++++++++++++++++++++++++++++++++*/

		/**
		 * 边框边。指定要显示的边框边的以空格分隔的 String。此 String 可以任意顺序包含 "left"、"top"、"right" 和 "bottom"。默认值为 "left top right bottom"，此值会显示所有四条边。仅当 borderStyle 为 "solid" 时才使用此样式。
		 *
		 * @param value:String(defalut=bottom)
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
			_borderSides=value;
		}

		/**
		 * 定义线条颜色
		 *
		 * @param value:uint(default=0xB5B8C8)
		 */
		public function get borderColor():uint
		{
			return _borderColor;
		}

		/**
		 * @private
		 */
		public function set borderColor(value:uint):void
		{
			_borderColor=value;
		}

		public function get backgroupColor():uint
		{
			return _backgroupColor;
		}

		public function set backgroupColor(value:uint):void
		{
			_backgroupColor=value;
		}

		public function get mouseOutColor():uint
		{
			return _mouseOutColor;
		}

		public function set mouseOutColor(value:uint):void
		{
			_mouseOutColor=value;

			if (mouseOutColor)
			{
				this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler, false, 0, true);
			}
		}

		public function get mouseOverColor():uint
		{
			return _mouseOverColor;
		}

		public function set mouseOverColor(value:uint):void
		{
			_mouseOverColor=value;

			if (mouseOverColor)
			{
				this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler, false, 0, true);
			}
		}


	}
}