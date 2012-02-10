package com.printingoffice.util
{
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-6  /  hubo.0508ⓐgmail.com</br>com.printingoffice.util.Icon.as</b>
	 * </p>
	 */
	public class IconConst
	{
		public function IconConst()
		{
		}
		
		[Bindable]
		[Embed('assets/image/warty-final-ubuntu.jpg')]
		public static var appBg:Class;
		
		[Bindable]
		[Embed(source="assets/swf/loading-1-2.swf")]
		public static var loading:Class;
		
		[Bindable]
		[Embed(source="assets/image/nav-bg.jpg")]
		public static var navbg:Class;
		
//		[Bindable]
//		[Embed(source="assets/image/line.jpg")]
//		public static var line:Class;
		
		//public static final 
	}
}