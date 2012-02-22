package com.printingoffice.framework.components
{
	import com.printingoffice.framework.components.graphic.Legend;
	import com.printingoffice.framework.core.TweenLite;
	import com.printingoffice.framework.util.Const;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.events.DynamicEvent;
	import mx.events.FlexEvent;
	import mx.managers.CursorManager;
	
	import spark.components.Group;
	import spark.components.Label;
	
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
		
		private var rowHeight:int = 11;
		
		private var rowTop:int = 10;
		
		private var chartLeft:int = 50;
		
		private var chartRight:int = 50;
		
		private var gap:Number = 5;
		
		private var keyField:String = "type";
		
		private var valueField:String = "numbers";
		
		private static const RIGHT_Y_AXIS_TAG:String = "rightYAxisTag";
		
		private static const LEFT_Y_AXIS_TAG:String = "leftYAxisTag";
		
		private var _data:ArrayCollection;		

		private var timer:Timer;
		
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
		
			startTimer();
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
			
			trace("againMeasureSize" + "   " + isStartSizeMark);
			
			var maxNumber:Number = getMaxNumber(_data);
			var singlePixel:Number = getSinglePixel(maxNumber);
			
			var num:int = this.numElements;
			for(var i:int=0; i<num; i++)
			{
				var element:Object = this.getElementAt(i);
				if(element is Legend)
				{
					var legend:Legend = element as Legend;
					element.width = singlePixel * legend.numbers;
					//new TweenLite(legend,0.1,{width:singlePixel * legend.numbers});
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
		
		private function createLegend(index:int):Legend
		{
			var legend:Legend = new Legend();
			legend.top = index == 0 ? rowTop : (rowHeight +rowTop) * index + rowTop;
			legend.left = chartLeft;
			legend.width = 1;
			legend.id = index.toString();
			
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

	}
}