package org.hu.flextools.util
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	import mx.core.UIComponent;

	public class FlexUtil
	{
		public function FlexUtil()
		{
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
				if(parent == null)
				{
					break;	
				}
				point.x+=parent.x;
				point.y+=parent.y;
				temp=parent;
				
			} while (parent !== ui.parentApplication)
			
			return point;
		}
	}
}