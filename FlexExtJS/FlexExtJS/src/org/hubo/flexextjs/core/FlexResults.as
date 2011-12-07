/**
 * 与后台交互返回结果集类
 * 
 * @auth HUBO
 */
package org.hubo.flexextjs.core
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="com.biiway.core.util.paging.ListRange")] 
	public class FlexResults
	{		
		public function FlexResults()
		{
		}
		
		public var entity:Object;
		
		/**
		 * 总记录数
		 */
		public var totalSize:int;
		
		/**
		 * 当前页
		 */
		public var currentPage:int;
		
		/**
		 * XML格式数据源：XML
		 */
		public var xml:String;
		
		/**
		 * 集合格式数据源：ArrayCollection
		 */
		public var list:ArrayCollection;
		
		/**
		 * 其它格式数据源：Object
		 */
		public var obj:Object;

		/**
		 * true，表示此次操作成功;false,表示失败
		 */
		public var success:Boolean;
		
		/**
		 * 返回消息，成功或者失败的详细信息
		 */
		public var message:String;
	}
}