package com.biiway.util
{
	import com.biiway.components.Panel;
	import com.biiway.event.PanelEvent;
	
	import mx.modules.ModuleLoader;
	
	import spark.components.Group;

	public class FlexUtil
	{
		public function FlexUtil()
		{
		}
		
		/**
		 * 卸载模块
		 */
		public static function unloadModule(module:ModuleLoader):void
		{
			if(!module) return;
			
			module.unloadModule()
			
		}
		
		/**
		 * 加载模块
		 */
		public static function loadModule(url:String,module:ModuleLoader):void
		{
			if(!module) return;
				
			module.loadModule(url);
		}
		
		public static function defaultLeafIcon():Class
		{
			return null;
		}
		
		public static function panelEventHandler(event:PanelEvent):void
		{
			var panel:Panel = event.currentTarget as Panel;
			
			switch(event.clickType)
			{
				case Panel.CLOSE_BTN :
					break;
				
				case Panel.MAXIMIZE_BTN :
					panel.showContent();
					break;
				
				case Panel.MINIMIZE_BTN :
					panel.hideContent();
					break;
				
				default:
					break;
			}
		}
	
	}
}