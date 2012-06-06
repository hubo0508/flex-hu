package com.hubo.workflow.util
{
	import spark.filters.GlowFilter;
	
	/**
	 * <p>
	 *     <b>HUBO 2012-6-6  /  hubo.0508ⓐgmail.com</br>com.hubo.workflow.util.Global.as</b>
	 * </p>
	 */
	public class Global
	{
		public function Global()
		{
		}
		
		public static const START:String = "assets/images/start48x48.png";
		
		public static const PERSON:String = "assets/images/person60x60.png";
		
		public static function glowFilter():spark.filters.GlowFilter
		{
			var glow:spark.filters.GlowFilter = new spark.filters.GlowFilter();
			glow.blurX = 5;
			glow.blurY = 5;
			glow.alpha = 1;
			glow.color = 0xC67036;
			glow.knockout = false;
			glow.quality = 	1;
			glow.strength = 1;
			glow.inner = false;
			
			return glow;
		}
	}
}