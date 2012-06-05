package com.njit
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.events.MoveEvent;
	
	import spark.components.Group;

	/**
	 * 元素节点
	 */
	public class ElementNode extends Group
	{
		/**
		 * 元素节点名字
		 */
		private var nodeName:String="网元";
		
		private var linesCollection:Array=new Array();
		private var lineCount:int=0;
		private var oldIndex:int=0;
		
		/**
		 * 标签图片
		 */
		private var tagImg:Image=new Image();
		
		/**
		 * 标签文本
		 */
		private var tagText:Label=new Label();

		/**
		 * @param location:Point 元素节点最新X,Y坐标
		 * @param w:Number 元素节点宽度
		 * @param h:Number 元素节点高度
		 * @param nodeName:String 元素节点名字
		 * @param url:String 标签图片路径
		 */
		public function ElementNode(location:Point, nodeName:String, url:String, w:Number=100, h:Number=100)
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
			this.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, tagMouseHandler,false,0,true);
			this.addEventListener(flash.events.MouseEvent.MOUSE_UP, tagMouseHandler,false,0,true);
			this.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, tagMouseHandler,false,0,true);
			this.addEventListener(mx.events.MoveEvent.MOVE, tagMouseHandler,false,0,true);
			
			this.initTagtext(this.nodeName);
			this.addElement(tagText); 
			
			tagImg.source = url;
			this.addElement(tagImg);
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
					this.refreshLine();
					break;
				
				case MoveEvent.MOVE :
					this.refreshLine();
					break;
				
				default:
					break;
			}
		}
		
		private function refreshLine():void
		{
			var x:int=this.getCenterX();
			var y:int=this.getCenterY();
			for (var i:int=0, len:int=linesCollection.length; i<len; i++)
			{
				var lineFlag:LineFlag=linesCollection[i];
				var line:ElementLine=lineFlag.getLine();
				var isHeaderLine:Boolean=lineFlag.getFlag();
				if (isHeaderLine)
				{
					line.setStartPoint(new Point(x, y));
				}
				else
				{
					line.setEndPoint(new Point(x, y));
				}
				line.drawLine();
			}
		}

		/**
		 * 添加与当前元素节点关联的线条
		 */
		public function addAssociatedLines(line:ElementLine, flag:Boolean):void
		{
			var lineFlag:LineFlag=new LineFlag(line, flag);
			linesCollection[lineCount]=lineFlag;
			lineCount++;
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
		 * 初始标签文本horizontalCenter
		 */
		private function initTagtext(text:String):void
		{
			tagText.text=text;
			tagText.horizontalCenter = 0;
			tagText.bottom = 10;
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