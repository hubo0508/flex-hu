package com.hongguan.util
{
	public class TellAlarmConst
	{
		public function TellAlarmConst()
		{
		}
		
		/**一级告警颜色*/
		public static const ONE_COLOR:uint = 0xFF0000;
		/**二级告警颜色*/
		public static const TWO_COLOR:uint = 0xFF9900;
		/**三级告警颜色*/
		public static const THREE_COLOR:uint = 0xFFFF00;
		/**四级告警颜色*/
		public static const FOUR_COLOR:uint = 0x66CCFF;
		
		/**严重*/
		public static const FEARFUL:uint = 0xFF0000;
		/**紧急*/
		public static const EXIGENCE:uint = 0xFF9C00;
		/**警告*/
		public static const TELL_ALARM:uint = 0xFFFF00;
		/**正常*/
		public static const NATURAL:uint = 0x00FF00;
		
		/**白色*/
		public static const WHITE_COLOR:uint = 0xFFFFFF;
		
		public static const ONE_STR:String = "一级告警";
		public static const TWO_STR:String = "二级告警";
		public static const THREE_STR:String = "三级告警";
		public static const FOUR_STR:String = "四级告警";
		
		public static function getColor(value:String):uint
		{			
			var color:uint;
			
			switch(value)
			{
				case ONE_STR : 
					color = ONE_COLOR;
					break;
				
				case TWO_STR : 
					color = TWO_COLOR;
					break;
				
				case THREE_STR : 
					color = THREE_COLOR;
					break;
				
				case FOUR_STR : 
					color = FOUR_COLOR;
					break;
				
				default:
					break;
			}
			
			return color;
		}
	}
}