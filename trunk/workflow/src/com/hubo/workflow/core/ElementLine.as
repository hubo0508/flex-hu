package com.hubo.workflow.core
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	import spark.filters.GlowFilter;

	/**
	 * 带箭头线条
	 */
	public class ElementLine extends UIComponent
	{

		/**
		 * 线起点坐标
		 */
		private var startPoint:Point;

		/**
		 * 线终点坐标
		 */
		private var endPoint:Point;

		/**
		 * 线条颜色
		 */
		private var lineColor:uint=0x000000;

		/**
		 * 线条提示语
		 */
		private var tip:String=" ";

		/**
		 * 是否要箭头
		 */
		private var isArrow:Boolean=true;

		/**
		 * 箭头大小
		 */
		private var radius:uint = 8;


		public function ElementLine()
		{
			super();
			
			this.addEventListener(flash.events.MouseEvent.MOUSE_OVER, mouseHandler,false,0,true);
			this.addEventListener(flash.events.MouseEvent.MOUSE_OUT, mouseHandler,false,0,true);
			
			this.useHandCursor = true;
			this.buttonMode = true;
		}
		
		protected function mouseHandler(event:MouseEvent):void
		{
			var objUI:UIComponent = event.currentTarget as UIComponent;
			switch (event.type)
			{
				case MouseEvent.MOUSE_OUT:
					objUI.filters=[];
					break;
				
				case MouseEvent.MOUSE_OVER:
					objUI.filters=[this.glowFilter()];
					break;
				
				default:
					break;
			}
		}

		/**
		 * 获得线的角度
		 */
		public function getAngle():Number
		{
			var tmpx:Number=endPoint.x - startPoint.x;
			var tmpy:Number=startPoint.y - endPoint.y;
			var angle:Number=Math.atan2(tmpy, tmpx) * (180 / Math.PI);
			return angle;
		}

		/**
		 * 画线
		 */
		public function drawLine():void
		{
			this.graphics.clear();
			this.graphics.lineStyle(2, lineColor);
			this.graphics.moveTo(startPoint.x, startPoint.y);
			this.graphics.lineTo(endPoint.x, endPoint.y);
			this.toolTip=tip;
			if (isArrow)
			{
				var angle:Number=this.getAngle();
				var centerX:Number=endPoint.x - radius * Math.cos(angle * (Math.PI / 180));
				var centerY:Number=endPoint.y + radius * Math.sin(angle * (Math.PI / 180));
				var topX:Number=endPoint.x;
				var topY:Number=endPoint.y;
				var leftX:Number=centerX + radius * Math.cos((angle + 120) * (Math.PI / 180));
				var leftY:Number=centerY - radius * Math.sin((angle + 120) * (Math.PI / 180));
				var rightX:Number=centerX + radius * Math.cos((angle + 240) * (Math.PI / 180));
				var rightY:Number=centerY - radius * Math.sin((angle + 240) * (Math.PI / 180));
				this.graphics.beginFill(lineColor, 1);
				this.graphics.lineStyle(2, lineColor, 1);
				this.graphics.moveTo(topX, topY);
				this.graphics.lineTo(leftX, leftY);
				this.graphics.lineTo(centerX, centerY);
				this.graphics.lineTo(rightX, rightY);
				this.graphics.lineTo(topX, topY);
				this.graphics.endFill();
			}
		}
		
		private function glowFilter():spark.filters.GlowFilter
		{
			var glow:spark.filters.GlowFilter = new spark.filters.GlowFilter();
			glow.blurX = 5;
			glow.blurY = 5;
			glow.alpha = 1;
			glow.color = 0xC67036;
			glow.knockout = false;
			glow.quality = 	1;
			glow.strength = 1;
			glow.inner = false;
			
			return glow;
		}
		
		/**
		 * 创建投影效果
		 */
		private function createDropShadowFilter():void				
		{				
			var dsf:spark.filters.DropShadowFilter = new spark.filters.DropShadowFilter();
			dsf.angle = 45;
			dsf.blurX = 10;
			dsf.blurY = 10;
			dsf.distance = 0;
			dsf.alpha = 0.8;
			dsf.color = 0x00000;
			dsf.knockout = false;
			dsf.quality = 1;
			dsf.strength = 1;
			dsf.inner = false;
			dsf.hideObject = false;
			
			this.filters = [dsf];
		}

		public function removeLine():void
		{
			this.graphics.clear();
		}

		/**
		 * 设置线起点坐标
		 */
		public function setStartPoint(point:Point):void
		{
			this.startPoint=point;
		}

		/**
		 * 设置线终点坐标
		 */
		public function setEndPoint(point:Point):void
		{
			this.endPoint=point;
		}

		/**
		 * 设置线条颜色
		 */
		public function setLineColor(color:uint):void
		{
			this.lineColor=color;
		}

		/**
		 * 线条提示语
		 */
		public function setTip(tip:String):void
		{
			this.tip=tip;
		}

		/**
		 * 是否要箭头
		 */
		public function setArrow(flag:Boolean):void
		{
			this.isArrow=flag;
		}
	}
}