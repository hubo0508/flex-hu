package com.hubo.workflow.util
{
	import flash.display.Graphics;
	
	import mx.core.UIComponent;
	
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
		
		public static const BG_GRID_WH:int = 15;
		
		[Embed(source="com/hubo/workflow/ui/assets/log.png")]		
		public static const LOG:Class;
		
		[Embed(source="com/hubo/workflow/ui/assets/start.png")]		
		public static const START:Class;
		
		[Embed(source="com/hubo/workflow/ui/assets/end.png")]		
		public static const END:Class;
		
		[Embed(source="com/hubo/workflow/ui/assets/branch.png")]		
		public static const BRANCH:Class;
		
		[Embed(source="com/hubo/workflow/ui/assets/approval.png")]		
		public static const APPROVAL:Class;
		
		[Embed(source="com/hubo/workflow/ui/assets/mouse.png")]		
		public static const MOUSE:Class;


		public static const STARTSTR:String="assets/images/start48x48.png";

		public static const PERSONSTR:String="assets/images/person60x60.png";

		public static function glowFilter():spark.filters.GlowFilter
		{
			var glow:spark.filters.GlowFilter=new spark.filters.GlowFilter();
			glow.blurX=5;
			glow.blurY=5;
			glow.alpha=1;
			glow.color=0xFF7000;
			glow.knockout=false;
			glow.quality=1;
			glow.strength=1;
			glow.inner=false;

			return glow;
		}

		public static function drawBackgroundGrid(ui:UIComponent, w:Number, h:Number, bgGridWh:int = 15):void
		{
			var g:Graphics=ui.graphics;
			g.lineStyle(1, 0xF3F3F3, 1);

			//Draw horizontal lines
			for (var i:int=bgGridWh; i < h; i+=bgGridWh)
			{
				g.moveTo(0, i);
				g.lineTo(w, i);
			}
			
			//Draw vertical lines
			for (var i:int=bgGridWh; i < w; i+=bgGridWh)
			{
				g.moveTo(i, 0);
				g.lineTo(i, h);
			}

			g.endFill();
		}
	}
}