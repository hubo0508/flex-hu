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
		
		public static const CONTENT_MEASURE:Array = [1000,700];
		
		public static const BCOLOR_WHILT:uint = 0xFFFFFF;
		public static const BCOLOR_GRAY:uint  = 0xB6BABF;
		public static const COLOR_RED:uint = 0xFF0000;
		public static const COLOR_BLACK:uint = 0x000000;
		
		/**
		 * 红色
		 */
		public static const RED_COLOR:uint = 0xDD4B39;
		
		/**
		 * 默认颜色
		 */
		public static const DEFAULT_COLOR:uint = 0x222222;
		
		/**
		 * 默认黑色
		 */
		public static const BLACK_COLOR:uint = 0x000000;
		
		/**
		 * 绿色
		 */
		public static const GREEN_COLOR:uint = 0x46A9EE;
		
		public static function getStatePath(state:int):Array
		{
			var iconInfo:Array  = [];
			
//			switch(state)
//			{
//				case NEWS_MESSAGE :
//					iconInfo["path"] = "assets/image/grid/newsMessage.png";
//					iconInfo["tootip"] = "最新接收稿件";
//					break;
//				
//				case SEND_IN :
//					iconInfo["path"] = "assets/image/grid/sendIn.png";
//					iconInfo["tootip"] = "发送中";
//					break;
//				
//				case OPEN_MENSSGE :
//					iconInfo["path"] = "assets/image/grid/openMessage.png";
//					iconInfo["tootip"] = "印刷人员已接收稿件";
//					break;
//				
//				case PRINT:
//					iconInfo["path"] = "assets/image/grid/print.png";
//					iconInfo["tootip"] = "稿件打印中";
//					break;
//				
//				case POST_PRODUCTION:
//					iconInfo["path"] = "assets/image/grid/postProduction.png";
//					iconInfo["tootip"] = "装定中";
//					break;
//				
//				case HAVE_BEEN_COMPLETED:
//					iconInfo["path"] = "assets/image/grid/haveBeenCompleted.png";
//					iconInfo["tootip"] = "已完成";
//					break;
//				
//				case DELIVERY:
//					iconInfo["path"] = "assets/image/grid/delivery.png";
//					iconInfo["tootip"] = "待送件";
//					break;
//				
//				case ARCHIVED:
//					iconInfo["path"] = "assets/image/grid/archived.png";
//					iconInfo["tootip"] = "已归档";
//					break;
//				
//				default:
//					break;
//			}
			
			return iconInfo;
		}
	}
}