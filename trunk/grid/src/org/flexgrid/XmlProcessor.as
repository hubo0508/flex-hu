package org.flexgrid
{
	
	/**
	 * <p>
	 *     <b>HUBO 2012-4-24  /  hubo.0508ⓐgmail.com</br>org.flexgrid.BasicXmlProcessor.as</b>
	 * </p>
	 */
	public class XmlProcessor 
	{
		public function XmlProcessor()
		{
		}
		
		/**
		 * 遍历取得XML子级最深的Number
		 */
		public function getDeepNum(dataxml:XMLList, deepNum:int = 1):int
		{
			for each(var xml:XML in dataxml)
			{
				if(xml.hasComplexContent())
				{
					var newnum:int = 0;
					if(xml.parent() == undefined){
						newnum= getRowDeepNum(xml.children(), 2);
					}else{
						newnum= getRowDeepNum(xml.children(), deepNum+1);
					}
					deepNum = deepNum > newnum ? deepNum : newnum;
				}
			}
			return deepNum;
		}
		
		public function getLayerCellAbsoluteLabel(labelField:String, xml:XML):Array
		{
			var absoluteLabel:Array = [];
			while(true)
			{
				absoluteLabel.push(xml.@[labelField]);
				xml = xml.parent();
				
				if(xml.parent() == undefined )
				{
					break;
				}
			}
			
			return absoluteLabel;
		}
		
		/**
		 * 得到上一次兄弟节点
		 */
		public function getUpSibling(labelField:String, cuurentXML:XML, dataxml:XMLList):XML
		{
			var upSbling:XML = null;
			for each(var xml:XML in dataxml)
			{
				if(xml.@[labelField] == cuurentXML.@[labelField])
				{
					return upSbling;
				}
				upSbling = xml;
			}
			
			return null;
		}
		
		/**
		 * 得到下一个兄弟节点
		 */
		public function getNextSibling(labelField:String, cuurentXML:XML, dataxml:XMLList):XML
		{
			var mark:Boolean = true;
			for each(var xml:XML in dataxml)
			{
				if(mark == false){
					return xml;
				}
				if(xml.@[labelField] == cuurentXML.@[labelField])	{
					mark = false;
				}
			}
			
			return null;
		}
		
		/**
		 * 根据当前节点得到下属的所有子节点
		 */
		public function getAllChildren(labelField:String, xml:XML, children:Array):Array
		{
			
			if(children == null || children.length == 0 ){
				children = [];	
			}
			
			if(!xml.hasComplexContent())
			{
				children.push( xml.@[labelField]);
				return children;
			}	
			
			children.push(xml.@[labelField]);
			
			var xmllist:XMLList = xml.children();
			for each(var xmlchildren:XML in xmllist)
			{
				if(xmlchildren.hasComplexContent())
				{
					children.push(xmlchildren.@[labelField]);
					return children;
				}	
				
			}
			
			return children;
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