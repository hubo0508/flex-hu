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