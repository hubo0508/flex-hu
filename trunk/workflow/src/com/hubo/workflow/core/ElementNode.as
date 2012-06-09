package com.hubo.workflow.core
{
	import com.hubo.workflow.event.CreateElementLineEvent;
	import com.hubo.workflow.ui.child.ConfigNodeWindown;
	import com.hubo.workflow.ui.child.ConfigTools;
	import com.hubo.workflow.util.Global;
	import com.hubo.workflow.util.PopUpUtil;
	import com.hubo.workflow.util.UIUtil;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.events.DynamicEvent;
	import mx.events.FlexEvent;
	import mx.events.MoveEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.BorderContainer;
	import spark.components.Group;

	[Event(name="createElementLine", type="com.hubo.workflow.event.CreateElementLineEvent")]

	/**
	 * 元素节点
	 */
	public class ElementNode extends Group
	{
		/**
		 * 元素节点名字
		 */
		private var nodeName:String;

		/**
		 * 存储当前元素节点所关联的线条集合
		 */
		private var linesCollection:Array=[];

		/**
		 * 标示
		 */
		public var SID:int;

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
		private var configTools:ConfigTools;

		/**
		 * 工具栏消失记时器
		 */
		private var removeConfigToolsTimer:Timer;
		
		/**
		 * 显示配置工具栏的记时器，添加该记时器可延迟。
		 */
		private var showConfigToolsTimer:Timer;
		
		/**
		 * 缓存移动前坐标
		 */
		private var cachePoint:Point = new Point();

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
			this.setSize(w, h);
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
			this.addEventListener(MouseEvent.ROLL_OUT, mouseHandler, false, 0, true);
			this.addEventListener(MouseEvent.ROLL_OVER, mouseHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_DOWN, tagMouseHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_UP, tagMouseHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_MOVE, tagMouseHandler, false, 0, true);
			this.addEventListener(FlexEvent.CREATION_COMPLETE,createionCompleteHandler,false,0,true);

			this.initTagtext(this.nodeName);
			this.addElement(tagText);

			this.initTagImg(url);
			this.addElement(tagImg);
		}

		override protected function commitProperties():void
		{
			super.commitProperties();

			this.useHandCursor=true;
			this.buttonMode=true;
		}

		override protected function createChildren():void
		{
			super.createChildren();

			if (configTools == null)
			{
				configTools=new ConfigTools();
				configTools.addEventListener(MouseEvent.ROLL_OUT, configToolsMouseHandler, false, 0, true);
				configTools.addEventListener(MouseEvent.ROLL_OVER, configToolsMouseHandler, false, 0, true);
				configTools.addEventListener(ConfigTools.DYE_CLICK, configToolsClickHandler, false, 0, true);
			}
		}
		
		protected function createionCompleteHandler(event:FlexEvent):void
		{
			this.updateCachePoint();
		}

		private function updateCachePoint():void
		{
			this.cachePoint = UIUtil.getUiAbsolutePosition(this);
		}
		
		/**
		 * 取得当前元素节点在Application中的中心点坐标
		 */
		public function centerPoint():Point
		{
			var point:Point=UIUtil.getUiAbsolutePosition(this);
			point.x+=this.width * 0.5;
			point.y+=this.width * 0.5;
			return point;
		}

		protected function mouseHandler(event:Event):void
		{
			if (tagImg == null)
				return;

			switch (event.type)
			{
				case MouseEvent.ROLL_OUT:
					tagImg.filters=[];
//					if(this.configTools.markPopUp)
//					{
						this.startRemoveConfigToolsTimer();
//					}
					break;

				case MouseEvent.ROLL_OVER:
					tagImg.filters=[Global.glowFilter()];
					this.showConfigTools();
					break;

				default:
					break;
			}
		}
		
		protected function configToolsClickHandler(event:DynamicEvent):void
		{
			switch (event.name)
			{
				case ConfigTools.NODE_ATTRIBUTES:
					PopUpUtil.messageWindow(new ConfigNodeWindown(), this, false);
					break;

				case ConfigTools.NODE_DELETE:
					this.removeConfigTools();
					this.configTools=null;
					this.linesCollection=null;
					(parent as Object).removeElement(this);
					break;

				case ConfigTools.NODE_CONNECT:
					this.removeConfigTools();

					var elementLine:ElementLine=new ElementLine();
					elementLine.setStartPoint(this.centerPoint());
					elementLine.addAssociatedElementNode(this);
					this.addAssociatedLines(elementLine, true);

					var cEvent:CreateElementLineEvent=new CreateElementLineEvent(CreateElementLineEvent.CREATE_ELEMENT_LINE);
					cEvent.line=elementLine;
					cEvent.upElementNodeSID=this.SID;
					this.dispatchEvent(cEvent);
					break;

				default:
					break;
			}
		}

		protected function configToolsMouseHandler(event:MouseEvent):void
		{
			switch (event.type)
			{
				case MouseEvent.ROLL_OUT:
					removeConfigTools();
					break;

				case MouseEvent.ROLL_OVER:
					this.stopTimer(this.removeConfigToolsTimer);
					break;

				default:
					break;
			}
		}

		private function removeConfigTools():void
		{
			//TweenLite.tweenTo(tool, .3, {alpha: 0, onComplete:function():void{
			PopUpManager.removePopUp(configTools);
			configTools.markPopUp = false;
			//}});
		}

		private function showConfigTools():void
		{
			startShowConfigToolsTimer();
		}
		
		private function startShowConfigToolsTimer():void
		{
//			if (showConfigToolsTimer == null)
//			{
//				showConfigToolsTimer=new Timer(500, 1);
//			}
//			
//			showConfigToolsTimer.addEventListener(TimerEvent.TIMER_COMPLETE, function closeAlert(event:Event):void
//			{
				var point:Point=UIUtil.getUiAbsolutePosition(this);
				configTools.x=point.x + this.width + 5;
				configTools.y=point.y + this.height * 0.5 - 10;
				//tool.setStyle("alpha",0.8);
				
				PopUpManager.addPopUp(configTools, UIUtil.getApplication(this), false);
				configTools.markPopUp = true;
				
//				stopTimer(showConfigToolsTimer);
//			}, false, 0, true);
//			showConfigToolsTimer.start();
		}

		private function startRemoveConfigToolsTimer():void
		{
			if (removeConfigToolsTimer == null)
			{
				removeConfigToolsTimer=new Timer(50, 1);
			}

			removeConfigToolsTimer.addEventListener(TimerEvent.TIMER_COMPLETE, function closeAlert(event:Event):void
			{
				removeConfigTools();

				removeConfigToolsTimer.stop();
			}, false, 0, true);
			removeConfigToolsTimer.start();
		}

		private function stopTimer(timer:Timer):void
		{
			if (timer && timer.running)
			{
				timer.stop();
			}

			if (timer)
			{
				timer=null;
			}
		}

		/**
		 * 元素节点鼠标事件
		 */
		protected function tagMouseHandler(event:Event):void
		{
			switch (event.type)
			{
				case MouseEvent.MOUSE_DOWN:
					this.startDrag();
					break;

				case MouseEvent.MOUSE_UP:
					this.stopDrag();
					this.refreshArrow();
					break;

				case MouseEvent.MOUSE_MOVE:
					var thisPoint:Point = UIUtil.getUiAbsolutePosition(this);
					if(this.cachePoint.x != thisPoint.x || this.cachePoint.y != thisPoint.y)
					{
						this.refreshLine();
					}
					this.updateCachePoint();
					break;

				default:
					break;
			}
		}
		
		/**
		 * 重新加载箭头
		 */
		public function refreshArrow(data:Array=null):void
		{
			data == null ? data = this.linesCollection : data;
			
			for (var i:int=0, len:int=data.length; i<len; i++)
			{
				var linePro:LineProperties=data[i];
				var line:ElementLine=linePro.elementLine;
				
				//flase 有箭头
				if (line && linePro.arrowsMark == false)
				{
					
					trace("***");
					
					//ody = odist/dist*dy  \  odx = odist/dist*dx
					var dx:Number = line.getStartPoint().x - line.getEndPoint().x;
					var dy:Number = line.getStartPoint().y - line.getEndPoint().y;
					var dist:Number=Math.sqrt(dx * dx + dy * dy);
					var ody:Number = this.width*0.5/dist*dy;
					var odx:Number = this.width*0.5/dist*dx;
					
					var point:Point = this.centerPoint();
					point.x += odx;
					point.y += ody;
					line.setEndPoint(point);
					line.draw();
				}
			}
		}
		

		/**
		 * 重新加载线条
		 */
		public function refreshLine():void
		{
			for (var i:int=0, len:int=linesCollection.length; i < len; i++)
			{
				var linePro:LineProperties=linesCollection[i];
				var line:ElementLine=linePro.elementLine;
				if(line)
				{
					trace("**********重新加载线条**********" + linePro.arrowsMark);
					linePro.arrowsMark ? line.setStartPoint(centerPoint()) : line.setEndPoint(centerPoint());
					line.draw();
				}
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
			if (point == null)
				return;

			if (this.x != point.x)
			{
				this.x=point.x;
			}

			if (this.y != point.y)
			{
				this.y=point.y;
			}
		}

		/**
		 * 设置元素节点最新大小
		 */
		public function setSize(w:Number, h:Number):void
		{
			if (this.width != w)
			{
				this.width=w;
			}

			if (this.height != h)
			{
				this.height=h;
			}
		}

		/**
		 * 初始标签文本
		 */
		private function initTagtext(text:String):void
		{
			if (tagText == null)
			{
				tagText=new Label
				tagText.maxWidth=48;
			}
			tagText.text=text;
			tagText.horizontalCenter=0;
			tagText.bottom=2;
		}

		/**
		 * 初始标签图片
		 */
		private function initTagImg(url:Object):void
		{
			if (tagImg == null)
			{
				tagImg=new Image();
			}

			tagImg.horizontalCenter=0;
			tagImg.source=url;
		}
		
	}
}