package com.printingoffice.util
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-9  /  hubo.0508ⓐgmail.com</br>com.printingoffice.util.UIUtil.as</b>
	 * </p>
	 */
	public class UIUtil
	{
		public function UIUtil()
		{
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