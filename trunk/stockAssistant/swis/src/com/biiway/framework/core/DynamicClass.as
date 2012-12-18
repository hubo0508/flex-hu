/**
 * @Project IWMP_lib
 * @Title DynamicClass.as
 * @Package com.biiway.util
 * @Description TODO
 * @date Apr 16, 2011 10:22:42 AM
 * @version V1.0  
 */
package com.biiway.framework.core
{
	import com.biiway.framework.util.StringUtil;
	
	/** 
	 * 
	 * 根据路径(包名)，通过Flex反射动态加载类
	 * 
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 16, 2011
	 */
	public class DynamicClass
	{
		public function DynamicClass()
		{
		}
		
		public static function getInstance(url:String,obj:Object):Object
		{
			if(StringUtil.isNotEmpty(url)){
				var ClassReference:Class=obj.getDefinitionByName(url) as Class;
				return new ClassReference();
			}
			else
			{
				return new Object();
			}		
		}
	}
}