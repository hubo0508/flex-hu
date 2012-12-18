/**
 * @Project Flex_GIS
 * @Title FusionChartUtil.as
 * @Package com.hongguan.util
 * @date Mar 14, 2011 2:10:47 PM
 * @version V1.0  
 */
package  com.biiway.framework.util
{
	import com.biiway.framework.components.FusionCharts;

	
	/** 
	 * author： HUBO hubo.0508@gmail.com    /  date：Jan 23, 2011 7:08:40 PM
	 */
	public class FusionChartUtil
	{
		public function FusionChartUtil()
		{
		}
		
		/**
		 * 创建图表
		 * 
		 * @param FCDataXML:String(default=null) 图表数据
		 * @param width:Number(default=0) 图表宽度
		 * @param height:Number(default=0) 图表高度
		 * @param FCChartType:String(default="MSColumn3D")　图表类型，默认为3D柱装图
		 * 
		 * <p>
		 * 	当width与height有一个或两个值为空时，创建图表的width与height采用top=left=right=bottom=0;
		 * </p>
		 * 
		 * @return 实例化FusionCharts
		 */
		public static function createFusionCharts(FCDataXML:String,FCChartType:String = "MSColumn3D",width:Number = 0,height:Number = 0):FusionCharts
		{			
			var fusion:FusionCharts = new FusionCharts();
			if(FCDataXML)
			{
				fusion.FCDataXML = FCDataXML;
			}			
			fusion.FCChartType = FCChartType;
			if(width != 0 && height != 0)
			{
				fusion.width = width;
				fusion.height = height;
			}
			
			return fusion;
		}		
	}
}