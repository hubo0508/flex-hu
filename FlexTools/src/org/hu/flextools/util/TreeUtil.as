/**
 * @Project FlexExtJS_Web
 * @Title TreeUtil.as
 * @Package com.hu.util
 * @date 2011-6-8 下午12:15:10
 * @version V1.0 
 */
package org.hu.flextools.util
{
	import mx.controls.Tree;

	/**
	 * author： HUBO hubo.0508ⓐgmail.com    /  date：Jan 23, 2011 7:08:40 PM
	 */
	public class TreeUtil
	{
		public function TreeUtil()
		{
		}

		/**
		 * isBranch:是否有子节点
		 */
		public static function treeAddNodes(nodes:String, tree:Tree):void
		{
			var children:XMLList=new XMLList(nodes);

			//更新节点值
			var selectedItem:XML=tree.selectedItem[0];
			selectedItem.setChildren(children);

			//打开节点
			var isOpen:Boolean=tree.isItemOpen(selectedItem);
			tree.expandItem(selectedItem, !isOpen);
		}


		/**
		 * 打开所有节点
		 *
		 * @param tree:Tree(default=null) 菜单树;
		 */
		public static function treeOpenAllNodes(tree:Tree):void
		{
			for each (var item:XML in tree.dataProvider)
			{
				if (!tree.isItemOpen(item))
				{
					tree.expandChildrenOf(item, true);
				}
			}
		}

	}
}