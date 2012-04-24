package org.flexgrid
{
	
	/**
	 * <p>
	 *     <b>HUBO 2012-4-24  /  hubo.0508ⓐgmail.com</br>org.flexgrid.BasicXmlProcessor.as</b>
	 * </p>
	 */
	public class BasicXmlProcessor implements XmlProcessor
	{
		public function BasicXmlProcessor()
		{
		}
		
		public function childrenXml(xml:XML):XMLList
		{
			return null;
		}
		
		public function childrenXmlText(label:String):Array
		{
			return null;
		}
		
		public function hasComplexContent(xml:XML):Boolean
		{
			return false;
		}
	}
}