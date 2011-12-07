package org.hubo.flexextjs.vo
{

	[Bindable]
	[RemoteClass(alias="com.biiway.core.util.paging.FlexPage")] 
	public class JavaPageVo
	{
		
		/**
		 * 构造函数
		 * 
		 * @param pageSize:Object(可选参数) 每页显示行数
		 */
		public function JavaPageVo(...value)
		{
			this.setPageSize(value[0]);
		}
		
		/**
		 *  SELECT * FROM table LIMIT 5,10;  // 检索记录行 6-15
		 *  
		 */
		//public var limit:int = 10;
		public var start:int = 0;
		public function setStart(_start:int):void
		{
			this.start = _start;
		}

		/**
		 * 当前页号
		 */
		public var currentPage:int = 1;
		
		/**
		 * 每页显示的行数 
		 */
		public var pageSize:int;
		
		/**
		 * 总行数
		 */
		private var totalRows:int;
		
		/**
		 * 总页数
		 */
		private var totalPage:int;
		
		/**
		 * 下一页
		 */
		private var nextPage:int;
		
		/**
		 * 上一页
		 */
		private var upPage:int;
		
		/**
		 * 首页
		 */
		private var startPage:int = 0;
		
		/**
		 * 尾页
		 */
		private var endPage:int;
		
		public function setCurrentPage(currentPage:int = 1):void
		{
			this.currentPage = currentPage;
		}
		
		public function getCurrentPage():int
		{
			return currentPage;
		}
		
		public function setPageSize(pageSize:int):void
		{
			this.pageSize = pageSize;
			
			this.start = pageSize*(this.currentPage-1);
		}
		
		public function getPageSize():int
		{
			return pageSize;
		}
		
		public function setTotalRows(totalRows:int):void
		{
			//“求模”算出一共有多少页
			if(totalRows%pageSize > 0) 
			{
				totalPage = totalRows/pageSize+1; 
			} 
			else 
			{ 
				totalPage = totalRows/pageSize; 
			} 
			
			this.totalRows = totalRows;
		}
		
		public function getTotalRows():int
		{
			return totalRows;
		}
		
		public function setNextPage(nextPage:int):void
		{
			this.nextPage = nextPage;
		}
		
		public function getNextPage():int
		{
			return nextPage;
		}
		
		public function setUpPage(upPage:int):void
		{
			this.upPage = upPage;
		}
		
		public function getUpPage():int
		{
			return upPage;
		}
		
		public function setStartPage(startPage:int = 0):void
		{
			this.startPage = startPage;
		}
		
		public function getStartPage():int
		{
			return startPage;
		}
		
		public function setEndPage(endPage:Number):void
		{
			this.endPage = endPage;
		}
		
		public function setTotalPage(totalPage:int):void
		{
			this.totalPage = totalPage;
		}
		
		public function getTotalPage():int
		{
			return totalPage;
		}
		
	}
}