/**
 * @Project IWMP_lib
 * @Title UIComponentUtil.as
 * @Package com.biiway.framework.util
 * @Description TODO
 * @date Apr 16, 2011 10:47:37 AM
 * @version V1.0 
 */
package com.biiway.framework.util
{
	import flash.display.DisplayObject;
	import flash.geom.Point;

	import mx.core.UIComponent;

	import spark.components.Application;

	/**
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 16, 2011
	 */
	public final class UIComponentUtil
	{
		public function UIComponentUtil()
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