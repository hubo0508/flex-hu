package org.flexgrid.ui
{
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	import org.flexgrid.XmlProcessor;
	import org.flexgrid.ui.Cell;
	
	import spark.components.BorderContainer;
	import spark.components.Group;
	
	/**
	 * <p>
	 *     <b>HUBO 2012-4-25  /  hubo.0508ⓐgmail.com</br>org.flexgrid.ui.HeaderRow.as</b>
	 * </p>
	 */
	public class HeaderRow extends BorderContainer
	{
		public function HeaderRow()
		{
			super();
		}
		
		private var _customHeaderXml:XMLList;
		
		private static const xmlPro:XmlProcessor = new XmlProcessor();
		
		/**
		 * 显示行
		 */
		private var displayLabelField:String = "headerText";
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			if(customHeaderXml)
			{
				this.createCustomHeaderRow(customHeaderXml);
				validateNow();
			}
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			minHeight = 1;
			percentWidth = 100;
			left = 100;
			top = 100;
			
			if(customHeaderXml)
			{
				this.layoutCustomHeaderRow(customHeaderXml);
				//this.measureCustomHeaderRowPoint(customHeaderXml);
				//this.measureCustomHeaderRowWidth(customHeaderXml);
				//this.measureCustomHeaderRowHeight(customHeaderXml);
			}
		}
		
		/**
		 * 重新测量大小自定义标题头坐标
		 */
		private function measureCustomHeaderRowPoint(dataxml:XMLList):void
		{
			for each(var xml:XML in dataxml)
			{
				if(!xml.hasComplexContent())
				{
					var currentCell:Cell = this.getHeaderCell(xml.@[displayLabelField]);
					var children:Array = xmlPro.getXmlText(xml.children(),displayLabelField);
					
					var num:int = children.length;
					for(var i:int=0; i<num; i++)
					{
						var childrenCell:Cell = this.getHeaderCell(children[i]);
					}
					
					//						var childrenPoint:Point = getChildrenCellsPoint(children);
					//						currentCell.width = childrenPoint.x;
				}
			}
		}
		
		/**
		 * 重新测量大小自定义标题头高度
		 */
		private function measureCustomHeaderRowHeight(dataxml:XMLList):void
		{
			for each(var xml:XML in dataxml)
			{
				if(!xml.hasComplexContent())
				{
					var currentCell:Cell = this.getHeaderCell(xml.@[displayLabelField]);
					var children:Array = xmlPro.getXmlText(xml.children(),displayLabelField);
					
					var childrenPoint:Point = getChildrenCellsPoint(children);
					currentCell.width = childrenPoint.x;
				}
			}
		}
		
		/**
		 * 重新测量大小自定义标题头宽度
		 */
		private function measureCustomHeaderRowWidth(dataxml:XMLList):void
		{
			for each(var xml:XML in dataxml)
			{
				if(xml.hasComplexContent())
				{
					var currentCell:Cell = this.getHeaderCell(xml.@[displayLabelField]);
					var children:Array = xmlPro.getXmlText(xml.children(),displayLabelField);
					
					var childrenPoint:Point = getChildrenCellsPoint(children);
					currentCell.width = childrenPoint.x;
				}
			}
		}
		
		/**
		 * 取得指定子标题头总宽
		 */
		private function getChildrenCellsPoint(children:Array):Point
		{
			var point:Point = new Point(0,0);
			var num:int = this.numElements;
			for(var i:int=0; i<num; i++)
			{
				var cell:Cell = getHeadCellByIndex(i);
				if(cell && isTextInChildren(cell.text, children))
				{
					point.x += cell.width;
					//point.y += cell.height;
				}
			}
			
			return point;
		}
		
		/**
		 * 文本是否在属于children:Array
		 */
		private function isTextInChildren(text:String, children:Array):Boolean
		{
			var num:int = children.length;
			for(var i:int=0; i<num; i++)
			{
				if(text == children[i].toString())
				{
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * 根据索引取得单元格
		 */
		private function getHeadCellByIndex(index:int):Cell
		{
			return this.getElementAt(index) as Cell;	
		}
		
		/**
		 * 重新布局
		 */
		private function layoutCustomHeaderRow(dataxml:XMLList):void
		{
			var firstLineWidth:Number = 0;
			for each(var xml:XML in dataxml)
			{
				var cell:Cell = getHeaderCell(xml.@[displayLabelField]);
				if(xml.parent() == undefined )
				{
					var upSibling:XML = xmlPro.getUpSibling(displayLabelField, xml, dataxml);
					var nextSibling:XML = xmlPro.getNextSibling(displayLabelField, xml,dataxml);
					
					if(upSibling == null)
					{
						moveUI(0,0,cell);
						firstLineWidth += cell.width;
					}
					
					if(upSibling != null)
					{
						moveUI(firstLineWidth,0,cell);
						firstLineWidth += cell.width;
					}
				}
				
				if(xml.parent() != undefined)
				{
					var absoluteLabel:Array = xmlPro.getLayerCellAbsoluteLabel(displayLabelField,xml);
					var parentCell:Cell = getHeaderCell(xml.parent().@[displayLabelField]);
					var currentCell:Cell = getHeaderCell(xml.@[displayLabelField]);
					
					var layerCellAbsolutePoint:Point = getLayerCellAbsolutePoint(absoluteLabel);
					if(firstLineWidth == 0)
					{
						firstLineWidth = parentCell.x;
					}
					
					moveUI(firstLineWidth,layerCellAbsolutePoint.y,currentCell);
					
					firstLineWidth += currentCell.width;
				}
				
				if(xml.hasComplexContent())
				{
					layoutCustomHeaderRow(xml.children());
				}
			}
		}
		
		private function moveUI(x:Number,y:Number, ui:UIComponent):void
		{
			if(ui.x != x)
			{
				ui.x = x;
			}
			
			if(ui.y != y)
			{
				ui.y = y;
			}
		}
		
		/**
		 * 取得有层级关系的单元格坐标
		 */
		private function getLayerCellAbsolutePoint(absoluteLabel:Array ):Point
		{
			var point:Point = new Point(0,0);
			
			var num:int = absoluteLabel.length;
			for(var i:int=0; i<num; i++)
			{
				var cell:Cell = this.getHeadCellByIndex(i);
				point.y += cell.height;
			}
			
			return point;
		}
		
		/**
		 * 根据显示文本或类型取得单元格
		 */
		private function getHeaderCell(text:String):Cell
		{
			var targetCell:Cell;
			
			var num:int = this.numElements;
			for(var i:int=0; i<num; i++)
			{
				var cell:Cell = this.getElementAt(i) as Cell;
				if(cell.text == text )
				{
					targetCell = cell;
					break;
				}
			}
			
			return targetCell;
		}
		
		/**
		 * 创建自定义标题
		 */
		private function createCustomHeaderRow(dataxml:XMLList):void
		{
			for each(var xml:XML in dataxml)
			{
				this.addElement(createHeaderRow(xml));
				if(xml.hasComplexContent())
				{
					this.createCustomHeaderRow(xml.children());
				}
			}
		}
		
		/**
		 * 创建元格
		 */
		private function createHeaderRow(xml:XML):Cell
		{
			var cell:Cell = new Cell();
			cell.borderSides="left right top";
			cell.text = xml.@[displayLabelField];
			cell.type = "button";
			cell.data = xml;
			
			return cell;
		}

		/**
		 * 自定义标题行
		 */
		public function get customHeaderXml():XMLList
		{
			return _customHeaderXml;
		}

		/**
		 * @private
		 */
		public function set customHeaderXml(value:XMLList):void
		{
			_customHeaderXml = value;
		}
	}
}