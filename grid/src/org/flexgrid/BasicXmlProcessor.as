package org.flexgrid
{
	
	/**
	 * <p>
	 *     <b>HUBO 2012-4-24  /  hubo.0508ⓐgmail.com</br>org.flexgrid.BasicXmlProcessor.as</b>
	 * </p>
	 */
	public class BasicXmlProcessor 
	{
		public function BasicXmlProcessor()
		{
		}
		
		
		/**
		 * 根据key取得xml文本
		 */
		public function getXmlText(xmlList:XMLList, labelField:String):Array
		{
			var result:Array = [];
			for each (var xmlChildren:XML in xmlList)   
			{ 
				result.push(xmlChildren.@[labelField]);
			}
			return result;
		}
		
		/**
		 * 根据key取得xml文本
		 */
		public function getXmlTexts(xmlList:XMLList, labelField:Array):Array
		{
			var result:Array = [];
			for each (var xmlChildren:XML in xmlList)   
			{ 
				var resultObj:Object = new Object();
				for each(var field:String in labelField)
				{
					resultObj[field] = xmlChildren.@[field];
				}
				result.push(resultObj);
			}
			return result;
		}
		
		/**
		 * 判断当前xml是否有子节点
		 */
		public function hasComplexContent(xml:XML):Boolean
		{
			if (xml.hasComplexContent())   
			{   
				return true;
			}
			return false;
		}
	}
}