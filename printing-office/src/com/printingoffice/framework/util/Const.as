package com.printingoffice.framework.util
{
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-6  /  hubo.0508ⓐgmail.com</br>com.printingoffice.util.Icon.as</b>
	 * </p>
	 */
	public class Const
	{
		public function Const()
		{
		}
		
		/**
		 * 新接件
		 */
		public static const NEWS_MESSAGE:int = 1;
		
		/**
		 * 发送中
		 */
		public static const SEND_IN:int = 2;
		
		/**
		 * 信息已接收，已经打开
		 */
		public static const OPEN_MENSSGE:int = 3;
		
		/**
		 * 打印中
		 */
		public static const PRINT:int = 4;
		
		/**
		 * 装订中
		 */
		public static const POST_PRODUCTION:int = 5;
		
		/**
		 * 已完成
		 */
		public static const HAVE_BEEN_COMPLETED:int = 6;
		
		/**
		 * 待接送
		 */
		public static const DELIVERY:int = 7;
		
		/**
		 * 已归档
		 */
		public static const ARCHIVED:int = 8;

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
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		[Bindable]
		[Embed('assets/image/hands.png')]
		public static var hands:Class;
		
		[Bindable]
		[Embed('assets/image/warty-final-ubuntu.jpg')]
		public static var appBg:Class;
		
		[Bindable]
		[Embed(source="assets/swf/loading-1-2.swf")]
		public static var loading:Class;
		
		[Bindable]
		[Embed(source="assets/image/nav-bg.jpg")]
		public static var navbg:Class;

	}
}