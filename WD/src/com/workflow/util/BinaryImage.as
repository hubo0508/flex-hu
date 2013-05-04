//*********************************************
// C:2013.04.25
// HUBO
// hubo.0508@gmail.com
//*********************************************
package com.workflow.util
{
	
	/**
	 * 存储二进制图片
	 */
	public final class BinaryImage
	{
		public function BinaryImage()
		{
		}
		
		[Embed(source="assets/workflow/image/log.png")]		
		public static const log:Class;
		
		//日志 start
		[Embed(source="assets/workflow/image/logClose.png")]		
		public static const LOG_ERROR:Class;
		
		[Embed(source="assets/workflow/image/logUncertain.png")]		
		public static const LOG_UNCERTAIN:Class;
		//日志 end
		
		//对齐 start
//		[Embed(source="assets/workflow/image/layers-alignment-bottom.png")]		
//		public static const LAYERS_BOTTOM:Class;
//		
//		[Embed(source="assets/workflow/image/layers-alignment-center.png")]		
//		public static const LAYERS_CENTER:Class;
//		
//		[Embed(source="assets/workflow/image/layers-alignment-left.png")]		
//		public static const LAYERS_LEFT:Class;
//		
//		[Embed(source="assets/workflow/image/layers-alignment-middle.png")]		
//		public static const LAYERS_MIDDLE:Class;
//		
//		[Embed(source="assets/workflow/image/layers-alignment-right.png")]		
//		public static const LAYERS_RIGHT:Class;
//		
//		[Embed(source="assets/workflow/image/layers-alignment.png")]		
//		public static const LAYERS_TOP:Class;		
		//对齐 end
	}
}