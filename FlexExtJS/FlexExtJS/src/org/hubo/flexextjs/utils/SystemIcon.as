/**
 * @Project FlexExtJS_lib
 * @Title SystemIcon.as
 * @Package org.hubo.flexextjs.utils
 * @date Mar 23, 2011 11:41:55 AM
 * @version V1.0  
 */
package org.hubo.flexextjs.utils
{
	
	/** 
	 * author： HUBO hubo.0508ⓐgmail.com    /  date： Mar 23, 2011 11:41:55 AM
	 */
	public class SystemIcon
	{
		public function SystemIcon()
		{
		}
		
		[Bindable]
		[Embed('assets/flexextjs/image/page/page-next.gif')]
		public static var pageNext:Class;
		
		[Bindable]
		[Embed('assets/flexextjs/image/page/page-last.gif')]
		public static var pageLast:Class;
		
		[Bindable]
		[Embed('assets/flexextjs/image/page/refresh.gif')]
		public static var refresh:Class;
			
		[Bindable]
		[Embed('assets/flexextjs/image/page/page-first.gif')]
		public static var pageFirst:Class;
		
		[Bindable]
		[Embed('assets/flexextjs/image/page/page-prev.gif')]
		public static var pagePrev:Class;
	}
}