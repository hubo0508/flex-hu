package com.biiway.stockassistant.util
{
	public class Const
	{
		public function Const()
		{
		}
		
//		[Embed('assets/image/horizontalSize.gif')]
//		public static const horizontalSize:Class;
//		[Embed('assets/image/leftObliqueSize.gif')]
//		public static const leftObliqueSize:Class;
//		[Embed('assets/image/mouseMove.gif')]
//		public static const mouseMove:Class;
//		[Embed('assets/image/rightObliqueSize.gif')]
//		public static const rightObliqueSize:Class;
//		[Embed('assets/image/verticalSize.gif')]
//		public static const verticalSize:Class;
		
		[Embed(source="assets/swf/loading-1-2.swf")]
		public static const loading:Class;
		
		//右箭头
		[Embed('assets/image/rightArrow.png')]
		public static const rightArrow:Class;
		
		//下箭头
		[Embed('assets/image/bottomArrow.png')]
		public static const bottomArrow:Class;
		
		//下箭头 蓝色
		[Embed('assets/image/bottomArrow_blue.png')]
		public static const bottomArrow_blue:Class;
		
		//上箭头 蓝色
		[Embed('assets/image/topArrow_blue.png')]
		public static const topArrow_blue:Class;
		
		//网上银行
		[Embed(source="assets/image/chongzhi.png")]
		public static const chongzhi:Class;
		
		//刷卡
		[Embed(source="assets/image/shuka.png")]
		public static const shuaka:Class;
		
		//手机
		[Embed(source="assets/image/shouji.png")]
		public static const shouji:Class;
		
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