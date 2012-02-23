package com.printingoffice.framework.components
{
	import com.printingoffice.framework.components.graphic.Legend;
	import com.printingoffice.framework.core.TweenLite;
	import com.printingoffice.framework.util.Const;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.events.DynamicEvent;
	import mx.events.FlexEvent;
	import mx.managers.CursorManager;
	
	import spark.components.Group;
	import spark.components.Label;
	import spark.filters.DropShadowFilter;
	import spark.filters.GlowFilter;
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-21  /  hubo.0508ⓐgmail.com</br>com.printingoffice.framework.components.ChartStatistics.as</b>
	 * </p>
	 */
	public class ChartStatistics extends Group
	{
		public function ChartStatistics()
		{
			super();
		}
		
		/**
		 * 行高度
		 */
		private var _rowHeight:int = 11;
		
		/**
		 * 行的上边缘到锚点目标的上边缘的垂直距离（以像素为单位）。 
		 */
		private var _rowTop:int = 10;
		
		/**
		 * 图例的从左边缘到锚点目标的左边缘的水平距离（以像素为单位）。 
		 */
		private var _chartLeft:int = 50;
		
		/**
		 * 图例的从右边缘到锚点目标的右边缘的水平距离（以像素为单位）。 
		 */
		private var _chartRight:int = 50;
		
		/**
		 * 内部组件之间的间隔
		 */
		private var _gap:Number = 5;
		
		/**
		 * 数据提供程序项目中作为数据提示显示的字段名称。【类型】
		 */
		private var _keyField:String = "type";
		
		/**
		 * 数据提供程序项目中作为数据提示显示的字段名称。【数量】
		 */
		private var _valueField:String = "numbers";
		
		/**
		 * Y轴右侧组件标签
		 */
		private static const RIGHT_Y_AXIS_TAG:String = "rightYAxisTag";
		
		/**
		 * Y轴左侧组件标签
		 */
		private static const LEFT_Y_AXIS_TAG:String = "leftYAxisTag";
		
		/**
		 * 内部使用，私有。
		 */
		private var _data:ArrayCollection;		

		/**
		 * 内部使用，私有。
		 */
		private var timer:Timer;
		
		/**
		 * 内部使用，私有。
		 */
		private var isStartSizeMark:Boolean = false;
		
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w,h);
			
			if(isStartSizeMark)
			{
				againMeasureSize(w,h);
			}
		}
		
		public function initChart(data:ArrayCollection):void
		{		
			if(data == null || data.length == 0) return;
			
			this._data = data;

			var maxNumber:Number = getMaxNumber(data);
			var singlePixel:Number = getSinglePixel(maxNumber);
			
			var len:int = data.length;
			for(var i:int=0; i<len; i++)
			{
				var item:Object = data.getItemAt(i);	
				var leftTag:Label = createLeftYAxisTag(item,i);					
				this.addElement(leftTag);
				
				var legend:Legend = createLegend(i);
				this.addElement(legend);
				
				legend.numbers = Number(item[valueField]);
				
				var originalWidth:Number = singlePixel * legend.numbers;
				
				playEffect(legend,originalWidth);
				
				var value:String = item[valueField].toString();
				var rightTag:Label = createRightYAxisTag(i, value, originalWidth, legend.top);
				this.addElement(rightTag);
			}
		
			if(isStartSizeMark == false)
			{
				startTimer();	
			}
		}
		
		private function startTimer():void
		{
			if(timer == null)
			{
				timer=new Timer(1000,1);
			}
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, function timerComplete(event:Event):void
			{
				isStartSizeMark = true;
				timerStop();							
			},false,0,true);								
			timer.start();	
		}
		
		private function timerStop():void
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
		
		protected function againMeasureSize(w:Number, h:Number):void
		{
			if(_data == null || _data.length == 0)return;
			
			var maxNumber:Number = getMaxNumber(_data);
			var singlePixel:Number = getSinglePixel(maxNumber);
			
			var num:int = this.numElements;
			for(var i:int=0; i<num; i++)
			{
				var element:Object = this.getElementAt(i);
				if(element is Legend)
				{
					var legend:Legend = element as Legend;
					legend.width = singlePixel * legend.numbers;					
				}
				
				if(element is Label && element.name == RIGHT_Y_AXIS_TAG)
				{
					var rightTag:Label = element as Label;
					rightTag.left = getLegendWidthByIndex(rightTag.id) + chartLeft + gap;
				}
			}
		}
		
		private function getLegendWidthByIndex(index:String):Number
		{
			var returnValue:Number = 0;
			
			var num:int = this.numElements;
			for(var i:int=0; i<num; i++)
			{
				var legend:Legend = this.getElementAt(i) as Legend;
				if(legend && legend.id.toString() == index)
				{
					returnValue = legend.width;
				}
			}
			
			return returnValue;
		}
		
		private function playEffect(legend:Legend, actualWidth:Number):void
		{
			new TweenLite(legend,1,{width:actualWidth});				
		}
		
		private function getSinglePixel(maxWidth:Number):Number
		{
			var instanceOfWide:Number = this.width - chartLeft - chartRight;
			
			return instanceOfWide / maxWidth;
		}
		
		private function getMaxNumber(dataProvider:ArrayCollection):Number
		{
			var maxNum:Number = 0;
			
			var len:int = dataProvider.length;
			for(var i:int=0; i<len; i++)
			{
				var newNum:Number =  Number(dataProvider.getItemAt(i)[valueField]);
				maxNum = maxNum > newNum ? maxNum : newNum;
			}
			
			return maxNum;
		}
		
		private function getShadowFilter():spark.filters.DropShadowFilter
		{
			var filter:spark.filters.DropShadowFilter = new spark.filters.DropShadowFilter();
			filter.angle = 45;
			filter.blurX = 6;
			filter.blurY = 6;
			filter.distance = 0;
			filter.alpha = 0.4;
			filter.color = 0x000000;
			filter.knockout = false;
			filter.quality = 1;
			filter.strength = 1;
			filter.inner = false;
			filter.hideObject = false;
			
			return filter;
		}
		
		protected function legendRollHandler(event:MouseEvent):void
		{
			var legend:Legend = event.currentTarget as Legend;
			switch(event.type)
			{
				case MouseEvent.ROLL_OUT:
					legend.filters = null;
					break;
				
				case MouseEvent.ROLL_OVER :
					legend.filters = [getShadowFilter()];
					break;
				
				default:
					break;
			}
		}
		
		protected function legendClickHandler(event:MouseEvent):void
		{
			
		}
		
		private function createLegend(index:int):Legend
		{
			var legend:Legend = new Legend();
			legend.top = index == 0 ? rowTop : (rowHeight +rowTop) * index + rowTop;
			legend.left = chartLeft;
			legend.width = 1;
			legend.id = index.toString();
			legend.useHandCursor = true;
			legend.buttonMode = true;
			legend.addEventListener(MouseEvent.ROLL_OUT,legendRollHandler,false,0,true);
			legend.addEventListener(MouseEvent.ROLL_OVER,legendRollHandler,false,0,true);
			legend.addEventListener(MouseEvent.CLICK,legendClickHandler,false,0,true);

			return legend;
		}
		
		private function createLeftYAxisTag(item:Object, index:int):Label
		{
			var lab:Label = new Label();
			lab.id = index.toString();
			lab.name = LEFT_Y_AXIS_TAG;
			lab.text = item[keyField];
			lab.top = index == 0 ? rowTop : (rowHeight +rowTop) * index + rowTop;
			lab.left = gap;
			lab.styleName = "tag";
			
			return lab;
		}
		
		private function createRightYAxisTag(index:int, text:String, legendWidth:Number, top:Object):Label
		{
			var tag:Label = new Label();
			tag.id = index.toString();
			tag.name = RIGHT_Y_AXIS_TAG;
			tag.top = top+1;
			tag.text = text;
			tag.left = chartLeft + legendWidth + gap;
			tag.styleName = "tag";
			
			return tag;
		}

		/**
		 * 行高度
		 */
		public function get rowHeight():int
		{
			return _rowHeight;
		}

		/**
		 * @private
		 */
		public function set rowHeight(value:int):void
		{
			_rowHeight = value;
		}

		/**
		 * 行的上边缘到锚点目标的上边缘的垂直距离（以像素为单位）。 
		 */
		public function get rowTop():int
		{
			return _rowTop;
		}

		/**
		 * @private
		 */
		public function set rowTop(value:int):void
		{
			_rowTop = value;
		}

		/**
		 * 图例的从左边缘到锚点目标的左边缘的水平距离（以像素为单位）。 
		 */
		public function get chartLeft():int
		{
			return _chartLeft;
		}

		/**
		 * @private
		 */
		public function set chartLeft(value:int):void
		{
			_chartLeft = value;
		}

		/**
		 * 图例的从右边缘到锚点目标的右边缘的水平距离（以像素为单位）。 
		 */
		public function get chartRight():int
		{
			return _chartRight;
		}

		/**
		 * @private
		 */
		public function set chartRight(value:int):void
		{
			_chartRight = value;
		}

		/**
		 * 内部组件之间的间隔
		 */
		public function get gap():Number
		{
			return _gap;
		}

		/**
		 * @private
		 */
		public function set gap(value:Number):void
		{
			_gap = value;
		}

		/**
		 * 数据提供程序项目中作为数据提示显示的字段名称。【类型】
		 */
		public function get keyField():String
		{
			return _keyField;
		}

		/**
		 * @private
		 */
		public function set keyField(value:String):void
		{
			_keyField = value;
		}

		/**
		 * 数据提供程序项目中作为数据提示显示的字段名称。【数量】
		 */
		public function get valueField():String
		{
			return _valueField;
		}

		/**
		 * @private
		 */
		public function set valueField(value:String):void
		{
			_valueField = value;
		}
	}
}