package com.biiway.stockassistant.util
{
	public class Const
	{
		public function Const()
		{
		}
		
		[Embed(source="assets/image/max.png")]
		public static const MAX:Class;
		
		[Embed(source="assets/image/min.png")]
		public static const MIN:Class;
		
		[Embed(source="assets/image/close.png")]
		public static const CLOSE:Class;
		
		[Embed(source="assets/image/revert.png")]
		public static const REVERT:Class;
		
		public static const GAP_SHADOW:Number = 7.5;
		
		public static const LOGIN_MEASURE:Array = [395,295];
		
		public static const CONTENT_MEASURE:Array = [1138,700];
		
		public static const BCOLOR_WHILT:uint = 0xFFFFFF;
		public static const BCOLOR_GRAY:uint  = 0xB6BABF;
		public static const COLOR_RED:uint = 0xFF0000;
		public static const COLOR_BLACK:uint = 0x000000;
	}
}