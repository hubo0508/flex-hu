package com.biiway.stockassistant.components.loading
{
	import com.biiway.stockassistant.util.Const;
	
	import spark.components.Group;
	
	/**
	 * 继续<code>spark.components.Group</code>组件，增加加载提示功能
	 */
	public class LoadingGroup extends Group
	{
		/**
		 * Loading组件
		 */
		private var loadingData:LodingData = new LodingData();
		
		public function LoadingGroup()
		{
			super();
		}
		
		/**
		 * 显示加载信息
		 * 
		 * @param text:String 提示文字
		 * @param color:uint(default=0xFF0000) 提示文字颜色，默认红色
		 * @param backgroundAlpha:Number(default=0.4) 提示容器背景透明度，默认0.4
		 */
		public function showLading(text:String, color:uint = 0xFF0000, backgroundAlpha:Number = 0.4):void
		{
			loadingData.text  != text  ? loadingData.text  = text  : null;
			loadingData.color != color ? loadingData.color = color : null;
			loadingData.bgAlpha != backgroundAlpha ?  loadingData.bgAlpha = backgroundAlpha : null;
			
			var newWidth:Number = this.width - Const.GAP_SHADOW * 2;
			var newHeight:Number = this.height - Const.GAP_SHADOW * 2;
			
			loadingData.width  != newWidth  ? loadingData.width  = newWidth  : null;
			loadingData.height != newHeight ? loadingData.height = newHeight : null;
			
			loadingData.x != Const.GAP_SHADOW ? loadingData.x = Const.GAP_SHADOW : null;
			loadingData.y != Const.GAP_SHADOW ? loadingData.y = Const.GAP_SHADOW : null;
			
			this.addElement(loadingData);
		}
		
		/**
		 * 隐藏加载信息
		 */
		public function hideLoading():void
		{
			this.removeElement(loadingData);
		}
		
	}
}