package com.printingoffice.framework.util
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.geom.Point;
	
	import mx.core.IVisualElement;
	import mx.core.UIComponent;
	
	import spark.components.Application;
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-9  /  hubo.0508ⓐgmail.com</br>com.printingoffice.util.UIUtil.as</b>
	 * </p>
	 */
	public class UIUtil
	{
		
		public static const PUSH:String = "push";
		
		public static const REMOVE:String = "remove";
		
		public static const NEWVALUE:String = "newvalue";
		
		public function UIUtil()
		{
		}

		
		/**
		 * 改变选择行数据存储缓存
		 *
		 * @param rowIndex:int 索引值
		 * @param type:String 类型 【remove、push、newvalue】
		 * @param values:Array 新值
		 */
		private function changeArrayValue(values:Array,rowIndex:int, type:String=PUSH):void
		{
//			switch(type)
//			{
//				case PUSH :
//					values.push(rowIndex);
//					break;
//				
//				case REMOVE :
//					var len:int=this.values.length;
//					for (var i:int=0; i < len; i++)
//					{
//						var oldRowIndex:int=int(this.indexOfSelectedRow[i]);
//						if (oldRowIndex == rowIndex)
//						{
//							this.indexOfSelectedRow.splice(i, 1);
//							break;
//						}
//					}
//					break;
//				
//				case NEWVALUE :
//					if (values)
//					{
//						this.indexOfSelectedRow=values;
//					}
//					else
//					{
//						this.indexOfSelectedRow=[rowIndex];
//					}
//					break;
//				
//				default:
//					break;
//			}
		}
		
		public static function drawBackgroup(color:uint, g:Graphics, w:Number, h:Number,alpha:Number=1):void
		{
			if (color != 0)
			{
				g.beginFill(color, alpha);
				g.drawRect(0, 0, w, h);
				g.endFill();
			}
		}
		
		public static function drawBorder(sides:Array, g:Graphics, w:Number, h:Number):void
		{
			if (sides.left == "left")
			{
				g.moveTo(-1, 0);
				g.lineTo(-1, h+1);
			}
			if (sides.right == "right")
			{
				g.moveTo(w, 0);
				g.lineTo(w, h+1);
			}
			if (sides.top == "top")
			{
				g.moveTo(-1, -1);
				g.lineTo(w+1, -1);
			}
			if (sides.bottom == 'bottom')
			{
				g.moveTo(0, h);
				g.lineTo(w, h);
			}
		}
		
		public static function lineSides(value:String):Array
		{
			value=value == "all" ? "left right bottom top" : value;
			
			var arr:Array=[];
			value=trim(value);
			if (value)
			{
				var sidesArr:Array=value.split(" ");
				
				var i:int=0, len:int=sidesArr.length;
				for (i; i < len; i++)
				{
					var line:String=sidesArr[i];
					if (line == "left")
					{
						arr.left=line;
					}
					if (line == "right")
					{
						arr.right=line;
					}
					if (line == "top")
					{
						arr.top=line;
					}
					if (line == "bottom")
					{
						arr.bottom=line;
					}
				}
			}
			return arr;
		}
		
		public static function trim(str:String):String
		{
			if (str == null)
			{
				return str;
			}
			return str.replace(/^\s*|\s*$/g, "").split(" ").join(" ").replace(new RegExp("\\s{2,}", "g"), " ");
		}
		
		public static function getID(obj:Object):String
		{
			var id:String = "";
			
			try
			{
				id = obj.id.toString();	
			}catch(e:*){
				trace("  :: UIUtil ::  "+e);
			}
			
			return id;
		}

		
		public static function getName(obj:Object):String
		{
			var name:String = "";
			
			try
			{
				name = obj.name.toString();	
			}catch(e:*){
				trace("  :: UIUtil ::  "+e);
			}
			
			return name;
		}

		public static function getApplication(currentUI:UIComponent):DisplayObject
		{
			return currentUI.parentApplication as DisplayObject == null ? currentUI as DisplayObject : currentUI.parentApplication as DisplayObject;
		}
		
		public static function getUiAbsolutePosition(ui:UIComponent):Point
		{
			var point:Point=new Point();
			point.x=ui.x;
			point.y=ui.y;
			var temp:DisplayObject=ui;
			do
			{
				var parent:DisplayObject=temp.parent;
				if(parent == null || parent is Application)
				{
					break;	
				}
				point.x+=parent.x;
				point.y+=parent.y;
				temp=parent;
				
			} while (true)
			
			return point;
		}
		
		public static function setContainerVisible(value:Boolean,scroller:IVisualElement):void
		{
			if(scroller.visible != value)
			{
				scroller.visible = value;
			}
		}
	}
}