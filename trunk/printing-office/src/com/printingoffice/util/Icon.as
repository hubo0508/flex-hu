package com.printingoffice.util
{
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-6  /  hubo.0508ⓐgmail.com</br>com.printingoffice.util.Icon.as</b>
	 * </p>
	 */
	public class Icon
	{
		public function Icon()
		{
		}
		
		[Bindable]
		[Embed('assets/image/warty-final-ubuntu.jpg')]
		public static var appBg:Class;
		
		[Embed(source="assets/swf/loading-1-2.swf")]
		public static var loading:Class;
		
		//public static final 
	}
}