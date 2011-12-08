package com.biiway.util
{
	import mx.formatters.DateFormatter;
	
	public class DateConverter
	{
		private static var myDateFormatter:DateFormatter=new DateFormatter();
		
		public function DateConverter()
		{
		}
		
		public static function convert(date:Date,formatString:String = "YYYY-MM-DD JJ:NN:SS"):String
		{
			myDateFormatter.formatString=formatString;
			
			return myDateFormatter.format(date);
		}
		
		public static function addOneDay(day:int, mydate:Date):Date
		{
			var returnDate:Date = new Date(mydate.time);
			returnDate['date'] += day;
			return returnDate;    
		}

	}
}