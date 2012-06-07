package com.hubo.workflow.core
{
	import com.hubo.workflow.ui.child.Tools;
	import com.hubo.workflow.util.Global;
	import com.hubo.workflow.util.UIUtil;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.events.MoveEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.BorderContainer;
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
		 * 工具栏
		 */
		private var tool:Tools;
		
		/**
		 * 工具栏消失记时器
		 */
		private var timer:Timer;

		/**
		 * @param location:Point 元素节点最新X,Y坐标
		 * @param w:Number 元素节点宽度
		 * @param h:Number 元素节点高度
		 * @param nodeName:String 元素节点名字
		 * @param url:String 标签图片路径
		 */
		public function ElementNode(location:Point, nodeName:String, url:Object, w:Number=48, h:Number=70)
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
		private function init(url:Object):void
		{
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseHandler,false,0,true);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseHandler,false,0,true);
			this.addEventListener(MouseEvent.MOUSE_DOWN, tagMouseHandler,false,0,true);
			this.addEventListener(MouseEvent.MOUSE_UP, tagMouseHandler,false,0,true);
			this.addEventListener(MouseEvent.MOUSE_MOVE, tagMouseHandler,false,0,true);
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
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			if(tool == null)
			{
				tool = new Tools();
				tool.addEventListener(MouseEvent.MOUSE_OUT,toolMouseHandler,false,0,true);
				tool.addEventListener(MouseEvent.MOUSE_OVER,toolMouseHandler,false,0,true);
			}
		}
		
		protected function mouseHandler(event:Event):void
		{
			if(tagImg == null) return;
			
			switch (event.type)
			{
				case MouseEvent.MOUSE_OUT:
					tagImg.filters=[];
					this.startTimer();
					break;

				case MouseEvent.MOUSE_OVER:
					tagImg.filters=[Global.glowFilter()];

					var point:Point = UIUtil.getUiAbsolutePosition(this);
					tool.x = point.x + this.width+10;
					tool.y = point.y + this.height*0.5-10;
					
					PopUpManager.addPopUp(tool, UIUtil.getApplication(this), false);
					break;
				
				default:
					break;
			}
		}
		
		protected function toolMouseHandler(event:MouseEvent):void
		{
			switch(event.type)
			{
				case MouseEvent.MOUSE_OUT :
					PopUpManager.removePopUp(tool);
					break;
				
				case MouseEvent.MOUSE_OVER :
					this.stopTimer();
					break;
				
				default:
					break;
			}
		}
		
		private function startTimer():void
		{
			if(!timer){
				timer=new Timer(1000,1);
			}
			
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, function closeAlert(event:Event):void
			{
				PopUpManager.removePopUp(tool);
				
				timer.stop();
			},false,0,true);					
			timer.start();	
		}
		
		private function stopTimer():void
		{
			if(timer.running)
			{
				timer.stop();	
			}
			
			if(timer)
			{
				timer = null;
			}
		}
		
		protected function tagMouseHandler(event:Event):void
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
				
				case mx.events.MoveEvent.MOVE :
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
				tagText = new Label
				tagText.maxWidth = 48;
			}
			tagText.text=text;
			tagText.horizontalCenter = 0;
			tagText.bottom = 2;
		}
		
		/**
		 * 初始标签图片
		 */
		private function initTagImg(url:Object):void
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
			return this.x + this.width;
		} 

		public function getCenterY():int
		{
			return this.y + 30;
		}
	}
}