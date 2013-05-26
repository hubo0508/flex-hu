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
	import flash.text.TextLineMetrics;
	import flash.utils.Timer;
	
	import mx.core.IFlexDisplayObject;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	import spark.components.Application;
	import spark.components.Label;
	import spark.filters.DropShadowFilter;

	public class Util
	{
		public function Util()
		{
		}
		
		private static var instanceDropShadow:spark.filters.DropShadowFilter = null;
		
		public static function getID(object:Object):String
		{
			try{
				return object.id;
			}catch(e:*){
				return "_error_";
			}
			return "_null_"
		}
		
		public static function getLabelHeight(label:Label):Number
		{
			var lineHeightStyle:* = label.getStyle("lineHeight");
							
			//its already a value in pixels
			if (lineHeightStyle is Number) var lineHeight:Number = lineHeightStyle;
				//it's a relative value: let's calculate
			else {
				var lineMetrics:TextLineMetrics = label.measureText(label.text);
				//get the numeric value from the string and divide it by 100
				var ratio:Number = int(lineHeightStyle.match(/\d+/)[0]) / 100;
				lineHeight = lineMetrics.height * ratio;
			}
			
			return lineHeight;
		}
		
		public static function getInstanceDropShadow():DropShadowFilter
		{
			if(!instanceDropShadow)
			{ 
				instanceDropShadow = new DropShadowFilter(); 
				instanceDropShadow.angle = 45;
				instanceDropShadow.blurX = 8;
				instanceDropShadow.blurY = 8;
				instanceDropShadow.distance = 0;
				instanceDropShadow.alpha = 0.5;
				instanceDropShadow.color = 0x000000;
				instanceDropShadow.knockout = false;
				instanceDropShadow.quality = 1;
				instanceDropShadow.strength =1;
				instanceDropShadow.inner = false;
				instanceDropShadow.hideObject = false;
			} 
			
			return instanceDropShadow; 
		}

		public static function elementVisible(ui:Object, value:Boolean):void
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