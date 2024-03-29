/**
 * @Project FlexTools
 * @Title StringUtil.as
 * @Package com.hu.util
 * @date 2011-6-8 下午04:08:04
 * @version V1.0  
 */
package org.hu.flextools.util
{
	
	/** 
	 * author： HUBO hubo.0508ⓐgmail.com    /  date：Jan 23, 2011 7:08:40 PM
	 */
	public class StringUtil
	{
		public function StringUtil()
		{
		}
		
		/**
		 * 检查字符串是否为 <code>null</code> 或空字符串 <code>""</code>。
		 *
		 * <pre>
		 *
		 *    StringUtil.isEmpty(null)      = true
		 *    StringUtil.isEmpty(&quot;&quot;)        = true
		 *    StringUtil.isEmpty(&quot; &quot;)       = false
		 *    StringUtil.isEmpty(&quot;bob&quot;)     = false
		 *    StringUtil.isEmpty(&quot;  bob  &quot;) = false
		 *
		 * </pre>
		 *
		 * @param str
		 *            要检查的字符串
		 *
		 * @return 如果为空, 则返回 <code>true</code>
		 */
		public static function isEmpty(str:Object):Boolean
		{
			if (str == null || str == "")
			{
				return true;
			}
			
			return false;
		}
		
		/**
		 * 检查字符串是否不是 <code>null</code> 和空字符串 <code>""</code>。
		 *
		 * @param str
		 *            要检查的字符串
		 *
		 * @return 如果不为空, 则返回 <code>true</code>
		 *
		 * @see com.biiway.util.StringUtils#isEmpty(String)
		 */
		public static function isNotEmpty(str:Object):Boolean
		{
			if (str == null || str == "")
			{
				return false;
			}
			
			return true;
		}
		
		/**
		 * 清除字符串左侧空格
		 */
		public static function LTrim(s:String):String
		{
			var i:Number=0;
			while (s.charCodeAt(i) == 32 || s.charCodeAt(i) == 13 || s.charCodeAt(i) == 10 || s.charCodeAt(i) == 9)
			{
				i++;
			}
			return s.substring(i, s.length);
		}
		
		/**
		 * 清除字符串右侧空格
		 */
		public static function RTrim(s:String):String
		{
			var i:Number=s.length - 1;
			while (s.charCodeAt(i) == 32 || s.charCodeAt(i) == 13 || s.charCodeAt(i) == 10 || s.charCodeAt(i) == 9)
			{
				i--;
			}
			return s.substring(0, i + 1);
		}
		
		/**
		 * 清除字串左右的空格
		 */
		public function trim(s:String):String
		{
			return LTrim(RTrim(s));
		}
		
	}
}