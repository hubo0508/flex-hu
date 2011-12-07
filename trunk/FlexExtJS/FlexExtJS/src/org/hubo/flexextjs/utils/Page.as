package org.hubo.flexextjs.utils
{
	public class Page
	{
		/**
		 * 构造函数
		 * 
		 * @param pageSize:Object(可选参数) 每页显示行数，默认值为10
		 */
		public function Page(...pageSize)
		{
			this.pageSize = pageSize[0] == undefined ? 10 : pageSize[0];
		}
		
		[Bindable]
		/**每页显示行数，默认值为：10*/
		public var pageSize:int = 10;
		
		[Bindable]
		/**总记录数，默认值为：0*/
		public var totalSize:int = 0; 
		
		[Bindable]
		/**当前页，默认值为：1*/
		public var currentPage:int = 1;		

	}
}