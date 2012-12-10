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
		
		//更多条件
		[Embed('assets/image/moreConditions.png')]
		public static const moreConditions:Class;
		
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
		
		/**
		 * 
		 * 一、密码长度:	5 分: 小于等于 4 个字符。10 分: 5 到 7 字符。	25 分: 大于等于 8 个字符 
		 * 二、字母: 0 分: 没有字母 。10 分: 全都是小（大）写字母 。20 分: 大小写混合字母 
		 * 三、数字: 0 分: 没有数字 。10 分: 1 个数字 。20 分: 大于等于 3 个数字 
		 * 四、符号: 0 分: 没有符号 。10 分: 1 个符号 。25 分: 大于 1 个符号
		 * 五、奖励: 2 分: 字母和数字。3 分: 字母、数字和符号。5 分: 大小写字母、数字和符号 
		 * 最后的评分标准:			
			>= 90: 非常安全 
			>= 80: 安全（Secure） 
			>= 70: 非常强 
			>= 60: 强（Strong） 
			>= 50: 一般（Average） 
			>= 25: 弱（Weak） 
			>= 0: 非常弱 
			 * */
		public static function passwordSecurityCheck(pass:String):String
		{ 
			if(!pass)return "";
			
			var count:int = 0;
			
			//一、密码长度:	5 分: 小于等于 4 个字符。10 分: 5 到 7 字符。	25 分: 大于等于 8 个字符 
			count += pass.length<=4 ? 5 : (pass.length>=5 && pass.length <=7 ? 10 : 25);
			
			//二、字母: 0 分: 没有字母 。10 分: 全都是小（大）写字母 。20 分: 大小写混合字母 
			count += !pass.match(/[a-z]/i) ? 0 : (pass.match(/[a-z]/) && pass.match(/[A-Z]/) ? 20 : (pass.match(/[a-z]/) || pass.match(/[A-Z]/) ? 10 : 0)); 
			
			//三、数字: 0 分: 没有数字 。10 分: 1 个数字 。20 分: 大于等于 3 个数字 
			count += !pass.match(/[0-9]/g) ? 0 : (pass.match(/[0-9]/g).length>=3 ? 20 : (pass.match(/[0-9]/g).length==1) ? 10 : 0); 
			
			//四、符号: 0 分: 没有符号 。10 分: 1 个符号 。25 分: 大于 1 个符号
			count += !pass.match(/\W/)     ? 0 : (pass.match(/\W/g).length>1 ? 25 : 10); 
			
			//五、奖励: 2 分: 字母和数字。3 分: 字母、数字和符号。5 分: 大小写字母、数字和符号 
			count += (!pass.match(/[0-9]/) || !pass.match(/[a-z]/i)) ? 0 : (!pass.match(/\W/) ? 2 : (!pass.match(/[a-z]/) || !pass.match(/[A-Z]/) ? 3 : 5)); 
			
			if(count >= 90){return "非常安全";}
			if(count >= 80){return "安全";}
			if(count >= 70){return "非常强";}
			if(count >= 60){return "强";}
			if(count >= 50){return "一般";}
			if(count >= 25){return "弱";}
			if(count >= 0){return "非常弱";}
				
			return "";
		}
		
	}
}