package com.hubo.workflow.util
{
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.utils.Timer;

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

		public static const bwMatrix:Array=[0.2225, 0.7169, 0.0606, 0, 0, 0.2225, 0.7169, 0.0606, 0, 0, 0.2225, 0.7169, 0.0606, 0, 0, 0, 0, 0, 1, 0];

		public static const BG_GRID_WH:int=15;

		[Embed(source="com/hubo/workflow/assets/log.png")]
		public static const LOG:Class;

		[Embed(source="com/hubo/workflow/assets/start.png")]
		public static const START:Class;

		[Embed(source="com/hubo/workflow/assets/end.png")]
		public static const END:Class;

		[Embed(source="com/hubo/workflow/assets/branch.png")]
		public static const BRANCH:Class;

		[Embed(source="com/hubo/workflow/assets/approval.png")]
		public static const APPROVAL:Class;

		[Embed(source="com/hubo/workflow/assets/mouse.png")]
		public static const MOUSE:Class;

		[Embed(source="com/hubo/workflow/assets/application_view_list.png")]
		public static const LIST:Class;

		[Embed(source="com/hubo/workflow/assets/delete.gif")]
		public static const DELETE:Class;

		[Embed(source="com/hubo/workflow/assets/connect.png")]
		public static const CONNECT:Class;

		[Embed(source="com/hubo/workflow/assets/logClose.png")]
		public static const LOG_ERROR:Class;

		[Embed(source="com/hubo/workflow/assets/logUncertain.png")]
		public static const LOG_UNCERTAIN:Class;

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//对齐 start
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		[Embed(source="com/hubo/workflow/assets/layers-alignment-bottom.png")]
		public static const LAYERS_BOTTOM:Class;

		[Embed(source="com/hubo/workflow/assets/layers-alignment-center.png")]
		public static const LAYERS_CENTER:Class;

		[Embed(source="com/hubo/workflow/assets/layers-alignment-left.png")]
		public static const LAYERS_LEFT:Class;

		[Embed(source="com/hubo/workflow/assets/layers-alignment-middle.png")]
		public static const LAYERS_MIDDLE:Class;

		[Embed(source="com/hubo/workflow/assets/layers-alignment-right.png")]
		public static const LAYERS_RIGHT:Class;

		[Embed(source="com/hubo/workflow/assets/layers-alignment.png")]
		public static const LAYERS_TOP:Class;
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//对齐 end
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public static const CLOSE:String="com/hubo/workflow/assets/close.png";

		public static function stopTimer(timer:Timer):void
		{
			(timer && timer.running) ? timer.stop() : null;
			timer ? timer=null : null;
		}

		public static function glowFilter(blurX:int=5, blurY:int=6, color:uint=0xFF7000):spark.filters.GlowFilter
		{
			var glow:spark.filters.GlowFilter=new spark.filters.GlowFilter();
			glow.blurX=blurX;
			glow.blurY=blurY;
			glow.alpha=1;
			glow.color=color;
			glow.knockout=false;
			glow.quality=1;
			glow.strength=1;
			glow.inner=false;

			return glow;
		}

		public static function drawBackgroundGrid(ui:UIComponent, w:Number, h:Number, bgGridWh:int=15):void
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