package com.hubo.workflow.core
{
	import com.hubo.workflow.util.Global;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.controls.Image;
	import mx.events.MoveEvent;
	
	import spark.components.BorderContainer;
	import spark.components.Group;
	import spark.components.Label;

	/**
	 * 元素节点
	 */
	public class ElementNode extends BorderContainer
	{
		/**
		 * 元素节点名字
		 */
		private var nodeName:String="网元";
		
		/**
		 * 存储当前元素节点所关联的线条集合
		 */
		private var linesCollection:Array=[];
		private var oldIndex:int=0;
		
		/**
		 * 标签图片
		 */
		private var tagImg:Image;
		
		/**
		 * 标签文本
		 */
		private var tagText:Label;

		/**
		 * @param location:Point 元素节点最新X,Y坐标
		 * @param w:Number 元素节点宽度
		 * @param h:Number 元素节点高度
		 * @param nodeName:String 元素节点名字
		 * @param url:String 标签图片路径
		 */
		public function ElementNode(location:Point, nodeName:String, url:String, w:Number=60, h:Number=80)
		{
			this.setLocation(location);
			this.setSize(w,h);
			this.nodeName=nodeName;
			this.init(url);
		}

		/**
		 * 初始化
		 * 
		 * @param url:String 标签图片路径
		 */
		private function init(url:String):void
		{
			this.addEventListener(flash.events.MouseEvent.MOUSE_OVER, mouseHandler,false,0,true);
			this.addEventListener(flash.events.MouseEvent.MOUSE_OUT, mouseHandler,false,0,true);
			this.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, tagMouseHandler,false,0,true);
			this.addEventListener(flash.events.MouseEvent.MOUSE_UP, tagMouseHandler,false,0,true);
			this.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, tagMouseHandler,false,0,true);
			this.addEventListener(mx.events.MoveEvent.MOVE, tagMouseHandler,false,0,true);
			
			this.initTagtext(this.nodeName);
			this.addElement(tagText); 
			
			this.initTagImg(url);
			this.addElement(tagImg);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			this.useHandCursor = true;
			this.buttonMode = true;
		}
		
		protected function mouseHandler(event:MouseEvent):void
		{
			if(tagImg == null) return;
			
			switch (event.type)
			{
				case MouseEvent.MOUSE_OUT:
					tagImg.filters=[];
					break;

				case MouseEvent.MOUSE_OVER:
					tagImg.filters=[Global.glowFilter()];
					break;
				
				default:
					break;
			}
		}
		
		protected function tagMouseHandler(event:MouseEvent):void
		{
			switch(event.type)
			{
				case MouseEvent.MOUSE_DOWN :
					this.startDrag();
					oldIndex=this.parent.getChildIndex(this);
					this.parent.setChildIndex(this, this.parent.numChildren - 1);
					break;
				
				case MouseEvent.MOUSE_UP : 
					this.stopDrag();
					this.parent.setChildIndex(this, oldIndex);
					break;
				
				case MouseEvent.MOUSE_MOVE :
					this.reloadLine();
					break;
				
				case MoveEvent.MOVE :
					this.reloadLine();
					break;
				
				default:
					break;
			}
		}
		
		/**
		 * 重新加载线条
		 */
		private function reloadLine():void
		{
			for (var i:int=0, len:int=linesCollection.length; i<len; i++)
			{
				var lineFlag:LineProperties=linesCollection[i];
				var line:ElementLine=lineFlag.elementLine;
				
				var point:Point = new Point(getCenterX(), getCenterY());
				lineFlag.arrowsMark ? line.setStartPoint(point) : line.setEndPoint(point);
				line.drawLine();
			}
		}

		/**
		 * 添加与当前元素节点关联的线条
		 */
		public function addAssociatedLines(elementLine:ElementLine, arrowsMark:Boolean):void
		{
			linesCollection.push(new LineProperties(elementLine, arrowsMark));
		}

		/**
		 * 设置元素节点最新X,Y坐标
		 */
		public function setLocation(point:Point):void
		{
			if(point == null) return;
			
			if(this.x != point.x)
			{
				this.x = point.x;	
			}
			
			if(this.y != point.y)
			{
				this.y = point.y;	
			}
		}
		
		/**
		 * 设置元素节点最新大小
		 */
		public function setSize(w:Number, h:Number):void
		{
			if(this.width != w)
			{
				this.width = w;	
			}
			
			if(this.height != h)
			{
				this.height = h;	
			}
		}

		/**
		 * 初始标签文本
		 */
		private function initTagtext(text:String):void
		{
			if(tagText == null)
			{
				tagText = new spark.components.Label
			}
			tagText.text=text;
			tagText.horizontalCenter = 0;
			tagText.bottom = 2;
		}
		
		/**
		 * 初始标签图片
		 */
		private function initTagImg(url:String):void
		{
			if(tagImg == null)
			{
				tagImg = new Image();
			}
			
			tagImg.horizontalCenter = 0;
			tagImg.source = url;
		}
		
		public function getCenterX():int
		{
			return this.x + 30;
		} 

		public function getCenterY():int
		{
			return this.y + 30;
		}
	}
}