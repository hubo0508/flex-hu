package com.hubo.workflow.ui.child
{
	import com.hubo.workflow.IWorkFlow;
	import com.hubo.workflow.util.Global;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	import spark.filters.GlowFilter;

	/**
	 * 带箭头线条
	 */
	public class ElementLine extends UIComponent implements IWorkFlow
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
		private var lineColor:uint=0x222222;

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
		
		/**
		 * 存储当前元素节点所关联的元素节点集合
		 */
		private var nodeCollection:Array=[];
		
		public function addAssociatedElementNode(elementNode:ElementNode):void
		{
			if(this.nodeCollection == null)
			{
				nodeCollection = [];
			}
			this.nodeCollection.push(elementNode);
		}
		
		public function getAssociatedElementNode():Array
		{
			return nodeCollection;
		}
				
		/**
		 * 清除内存
		 */
		public function clear():void
		{
			this.removeQuote();			
			this.startPoint = null;	
			this.endPoint = null;
		}
		
		/**
		 * 引用关系删除
		 */
		public function removeQuote():void
		{
			if(nodeCollection == null) return;
			
			for(var i:int=0, num:int=nodeCollection.length; i<num; i++)
			{
				if(nodeCollection[i].removeQuote(this))
				{
					break;
				}
			}
			
			nodeCollection = null;
		}

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
					objUI.filters=[Global.glowFilter()];
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
		public function draw():void
		{
			this.graphics.clear();
			this.graphics.lineStyle(1, lineColor);
			this.graphics.moveTo(startPoint.x, startPoint.y);
			this.graphics.lineTo(endPoint.x, endPoint.y);
			//this.toolTip=tip;
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
		
		public function getEndPoint():Point
		{
			return endPoint;
		}
		
		public function getStartPoint():Point
		{
			return startPoint;
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