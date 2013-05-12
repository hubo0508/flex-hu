//*********************************************
// C:2013.05.04
// HUBO
// hubo.0508@gmail.com
//*********************************************
package com.workflow.util
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.utils.Timer;

	import mx.core.IFlexDisplayObject;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;

	import spark.components.Application;

	public class Util
	{
		public function Util()
		{
		}

		public static function elementVisible(ui:UIComponent, value:Boolean):void
		{
			ui.visible == value ? null : ui.visible=value;
		}

		public static function stopTimer(timer:Timer):void
		{
			if (timer)
			{
				timer.running ? timer.stop() : null;
				timer=null;
			}
		}

		public static function getUiAbsolutePosition(ui:UIComponent):Point
		{
			var point:Point=new Point();
			point.x=ui.x;
			point.y=ui.y;
			var temp:DisplayObject=ui;
			do
			{
				var parent:DisplayObject=temp.parent;
				if (parent == null || parent is Application)
				{
					break;
				}
				point.x+=parent.x;
				point.y+=parent.y;
				temp=parent;

			} while (true)

			return point;
		}

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public static function drawGrid(ui:UIComponent, areaSize:int=10, lineColor:uint=0xF3F3F3):void
		{
			var g:Graphics=ui.graphics;
			g.lineStyle(1, lineColor, 1);

			var w:Number=ui.width;
			var h:Number=ui.height;

			//Draw horizontal lines
			for (var i:int=areaSize; i < h; i+=areaSize)
			{
				g.moveTo(0, i);
				g.lineTo(w, i);
			}

			//Draw vertical lines
			for (var j:int=areaSize; j < w; j+=areaSize)
			{
				g.moveTo(j, 0);
				g.lineTo(j, h);
			}

			g.lineStyle(1, 0xDCDCDC, 1);

			for (var k:int=0; k < h; k+=areaSize * 5)
			{
				g.moveTo(0, k);
				g.lineTo(w, k);
			}

			for (var u:int=0; u < w; u+=areaSize * 5)
			{
				g.moveTo(u, 0);
				g.lineTo(u, h);
			}

			g.endFill();
		}
	}
}