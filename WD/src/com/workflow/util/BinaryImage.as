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
		
		[Embed(source="assets/workflow/image/logClose.png")]		
		public static const LOG_ERROR:Class;
		
		[Embed(source="assets/workflow/image/logUncertain.png")]		
		public static const LOG_UNCERTAIN:Class;
	}
}