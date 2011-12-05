package  org.hu.fextjs.components.dataGrid
{
	
	public class DataGridUtils
	{
		public function DataGridUtils()
		{
		}
		
		/**
		 * 清空所有内存值选择值
		 * 
		 *  @param column:CheckBoxColumn
		 */
		public static function clearAllValue(selectItems:Array, column:DGColumn):void
		{
			
			if (column.saveSelectedItem != null)
			{
				column.saveSelectedItem.splice(0, column.saveSelectedItem.length);
			}
			
			if (column.selectItemsData != null)
			{
				column.selectItemsData.splice(0, column.selectItemsData.length);
			}
			
			if (selectItems != null)
			{
				selectItems.splice(0, (selectItems.length - 1) == 1 ? 0 : (selectItems.length - 1));
			}			
		}
		
		/**
		 * 清除上一次选择的值
		 * 
		 * @param column:CheckBoxColumn
		 */
		public static function clearPreviouslySelectedOfValue(selectItems:Array,column:DGColumn):void
		{
			
			if (column.saveSelectedItem != null)
			{
				column.saveSelectedItem[0].selected=false;
				column.saveSelectedItem.splice(0, (column.saveSelectedItem.length - 1));
			}
			
			if (column.selectItemsData != null)
			{
				column.selectItemsData.splice(0, (column.selectItemsData.length - 1));
			}
			
			if (selectItems != null)
			{
				selectItems.splice(0, (selectItems.length - 1) == 1 ? 0 : (selectItems.length - 1));
			}
			
		}
	}
}