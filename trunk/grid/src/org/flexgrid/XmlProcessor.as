package org.flexgrid
{
	public interface XmlProcessor
	{
		
		/**
		 * 取得子级节点 
		 */
		public function childrenXml(xml:XML):XMLList;
		
		/**
		 * 取得子级节点文本
		 */
		public function childrenXmlText(label:String):Array;
		
		/**
		 * 判断是否有子节点
		 */
		public function hasComplexContent(xml:XML):Boolean;
		
	}
}