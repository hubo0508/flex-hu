/**
 * @Project IWMP_lib
 * @Title IconUtil.as
 * @Package com.biiway.framework.util
 * @Description TODO
 * @date Apr 16, 2011 10:50:56 AM
 * @version V1.0  
 */
package com.biiway.framework.util
{
	
	/** 
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 16, 2011
	 */
	public final class IconUtil
	{
		public function IconUtil()
		{
		}
		
		public static const DEFAULT_INPUT_STYLE:String = "[class sample__embed_css__1250226384]";
		public static const VALIDATOR_INPUT_FAULT:String = "[class sample__embed_css__assets_skin_style_iCandy_images_textBox_png_352368194]";

		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/blue.jpg')]
		public static var default_img:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/log.png')]
		public static var logo:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/login.png')]
		public static var login:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/login_gray.png')]
		public static var login_gray:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/logout.png')]
		public static var logout:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/lem_title.png')]
		public static var lemTitle:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/close.png')]
		public static var close:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/minimize.png')]
		public static var minimize:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/three_level_02.png')]
		public static var three_level_02:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/three_level_img.png')]
		public static var three_level_img:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/login_title.png')]
		public static var login_title:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/login_info.png')]
		public static var login_info:Class;		
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/maximize.png')]
		public static var maximize:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/deoxidize.png')]
		public static var deoxidize:Class;
		
		[Bindable]
		[Embed('com/biiway/framework/assets/image/textbox.png')]
		public static var textbox:Class;
		
		
	}
}