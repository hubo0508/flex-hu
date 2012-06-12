package com.hubo.workflow.ui.child
{
	import com.hubo.workflow.IWorkFlow;
	import com.hubo.workflow.components.NodeImage;
	import com.hubo.workflow.core.LineProperties;
	import com.hubo.workflow.event.CreateElementLineEvent;
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
	import mx.core.UIComponent;
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
	public class ElementNode extends  Group
	{
		/**
		 * 是否选中
		 */
		public var selected:Boolean = false;
		
		/**
		 * 元素节点名字
		 */
		private var text:String;

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
		private var tagImg:NodeImage;

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
		
		private var enHeight:Number = 67;
		
		private var enWidth:Number = 50;
		
		/**
		 * @param location:Point 元素节点最新X,Y坐标
		 * @param text:String 元素节点名字
		 * @param url:String 标签图片路径
		 */
		public function ElementNode(location:Point, text:String, url:Object)
		{
			this.setLocation(location);
			this.setSize(enWidth, enHeight);
			this.text=text;
			this.init(url);
		}
		
		/**
		 * 初始化
		 *
		 * @param url:String 标签图片路径
		 */
		private function init(url:Object):void
		{
			this.addEventListener(MouseEvent.CLICK,mouseHandler,false,0,true);
			this.addEventListener(MouseEvent.ROLL_OUT, mouseHandler, false, 0, true);
			this.addEventListener(MouseEvent.ROLL_OVER, mouseHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_DOWN, tagMouseHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_UP, tagMouseHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_MOVE, tagMouseHandler, false, 0, true);
			this.addEventListener(FlexEvent.CREATION_COMPLETE,createionCompleteHandler,false,0,true);

			this.initTagtext(text);
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
			point.x+=this.enWidth * 0.5;
			point.y+=this.enWidth * 0.5;
			return point;
		}
		
		public function point():Point
		{
			return UIUtil.getUiAbsolutePosition(this);
		}

		protected function mouseHandler(event:Event):void
		{
			if (tagImg == null)
				return;

			switch (event.type)
			{
				case MouseEvent.ROLL_OUT:
					this.selected ? null : tagImg.filters=[];
					this.removeConfigTools();
					break;

				case MouseEvent.ROLL_OVER:
					this.selected ? null : tagImg.filters=[Global.glowFilter()];
					this.showConfigTools();
					break;
				
				case MouseEvent.CLICK:
					this.selected = true;
					tagImg.filters=[Global.glowFilter(7,7,0x141CB9)];
					break;

				default:
					break;
			}
		}
		
		public function selectedState(selected:Boolean):void
		{
			this.selected = selected;
			selected ? tagImg.filters=[Global.glowFilter(7,7,0x141CB9)] : tagImg.filters = [];
		}
		
		protected function configToolsClickHandler(event:DynamicEvent):void
		{
			switch (event.name)
			{
				case ConfigTools.NODE_ATTRIBUTES:
					var configWindown:ConfigWindown = new ConfigWindown();
					configWindown.title = this.text+" " +event.label;
					PopUpUtil.messageWindow(configWindown, this, false);
					break;

				case ConfigTools.NODE_DELETE:
					this.hideConfigTools();
					this.removeQuoteLines();
					this.clear();
					(parent as Object).removeElement(this);
					break;

				case ConfigTools.NODE_CONNECT:
					this.hideConfigTools();

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
		
		/**
		 * 删除当前节点有关的线条。ElementNode 与 ElementLine 的相互引用都将清除，以避免内存泄露
		 */
		private function removeQuoteLines():void
		{
			for(var i:int=0, num:int=linesCollection.length; i<num; i++)
			{
				var linepro:LineProperties = linesCollection[i];
				linepro.elementLine.removeQuote();
				Object(parent).removeElement(linepro.elementLine);
			}
		}

		/**
		 * 配置工具栏鼠标事件
		 */
		protected function configToolsMouseHandler(event:MouseEvent):void
		{
			switch (event.type)
			{
				case MouseEvent.ROLL_OUT:
					hideConfigTools();
					break;

				case MouseEvent.ROLL_OVER:
					Global.stopTimer(this.removeConfigToolsTimer);
					break;

				default:
					break;
			}
		}
		
		/**
		 * 从顶级容器中删除配置工具栏
		 */
		private function hideConfigTools():void
		{
			if(!configTools)return;
			
			PopUpManager.removePopUp(configTools);
			configTools.markPopUp = false;
		}
		
		/**
		 * 显示配置工具栏
		 */
		private function showConfigTools():void
		{
			var thisUI:UIComponent = this;
			showConfigToolsTimer == null ? showConfigToolsTimer=new Timer(400, 1) : null;
			showConfigToolsTimer.addEventListener(TimerEvent.TIMER_COMPLETE, function closeAlert(event:Event):void
			{
				var point:Point=UIUtil.getUiAbsolutePosition(thisUI);
				configTools.x=point.x + width + 5;
				configTools.y=point.y + height * 0.5 - 10;
				
				PopUpManager.addPopUp(configTools, UIUtil.getApplication(thisUI), false);
				configTools.markPopUp = true;
				
				Global.stopTimer(showConfigToolsTimer);
			}, false, 0, true);
			
			showConfigToolsTimer.start();
		}
		
		/**
		 * 删除配置工具栏
		 */
		private function removeConfigTools():void
		{
			removeConfigToolsTimer == null ? removeConfigToolsTimer=new Timer(80, 1) : null;
			removeConfigToolsTimer.addEventListener(TimerEvent.TIMER_COMPLETE, function closeAlert(event:Event):void
			{
				hideConfigTools();
				Global.stopTimer(removeConfigToolsTimer);
				Global.stopTimer(showConfigToolsTimer);
			}, false, 0, true);
			
			removeConfigToolsTimer.start();
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
				var linepro:LineProperties=data[i];
				var line:ElementLine=linepro.elementLine;
				//flase：结束线条,有箭头
				if (line && linepro.arrowsMark == false)
				{
					line.setEndPoint(arrowPoint(line));
					line.draw();
				}
			}
		}
		
		/**
		 * 取得箭头坐标
		 */
		private function arrowPoint(line:ElementLine):Point
		{
			//ody = odist/dist*dy  \  odx = odist/dist*dx
			var dx:Number = line.getStartPoint().x - line.getEndPoint().x;
			var dy:Number = line.getStartPoint().y - line.getEndPoint().y;
			var dist:Number=Math.sqrt(dx * dx + dy * dy);
			var ody:Number = this.width*0.5/dist*dy;
			var odx:Number = this.width*0.5/dist*dx;
			
			var point:Point = this.centerPoint();
			point.x += odx;
			point.y += ody;
			
			return point;
		}

		/**
		 * 重新加载线条
		 */
		public function refreshLine():void
		{
			for (var i:int=0, len:int=linesCollection.length; i < len; i++)
			{
				var linepro:LineProperties=linesCollection[i];
				var line:ElementLine=linepro.elementLine;
				if(line)
				{
					linepro.arrowsMark ? line.setStartPoint(centerPoint()) : null;
					
					var nodesCollection:Array = line.getAssociatedElementNode();
					for (var k:int=0, len2:int=nodesCollection.length; k < len2; k++)
					{
						line.setEndPoint(Global.arrowPointWidth(line.getStartPoint(),nodesCollection[k]));
						line.draw();
					}
					
					(nodesCollection == null || nodesCollection.length ==0) ? line.draw() : null;
				}
			}
		}

		/**
		 * 添加与当前元素节点关联的线条
		 */
		public function addAssociatedLines(elementLine:ElementLine, arrowsMark:Boolean):void
		{
			linesCollection ? null: linesCollection = [] ;
			linesCollection.push(new LineProperties(elementLine, arrowsMark));
		}

		/**
		 * 设置元素节点最新X,Y坐标
		 */
		public function setLocation(point:Point):void
		{
			if (point == null)return;
			
			x != point.x ? x=point.x : null;
			y != point.y ? y=point.y : null;
		}

		/**
		 * 设置元素节点最新大小
		 */
		public function setSize(w:Number, h:Number):void
		{
			width != w ? width=w : null;
			height != h ? height=h : null;
		}

		/**
		 * 初始标签文本
		 */
		private function initTagtext(text:String):void
		{
			if (tagText == null)
			{
				tagText=new Label
				tagText.maxWidth = this.enWidth;
			}
			tagText.text=text;
			tagText.horizontalCenter=0;
			tagText.bottom=0;
		}

		/**
		 * 初始标签图片
		 */
		private function initTagImg(url:Object):void
		{
			if (tagImg == null)
			{
				tagImg=new NodeImage();
			}

			tagImg.horizontalCenter=0;
			tagImg.source=url;
		}
		
		/**
		 * 清除内存
		 */
		public function clear():void
		{
			this.removeQuote();			
			this.configTools = null;
			this.showConfigToolsTimer = null;	
			this.removeConfigToolsTimer = null;
			this.tagText = null;
			this.tagImg = null;
		}
		
		/**
		 * 引用关系删除
		 */
		public function removeQuote(elementLine:ElementLine = null):Boolean
		{
			if(elementLine == null)
			{
				this.linesCollection = null;
			}
			else
			{
				for(var i:int=0, num:int=linesCollection.length; i<num; i++)
				{
					var linepro:LineProperties = linesCollection[i];
					if(linepro.elementLine == elementLine)
					{
						linesCollection.splice(i, 1);
						return true;
					}
				}
			}
			
			return false;
		}

		
	}
}