package com.biiway.stockassistant.util
{
	import mx.utils.Base64Encoder;

	public class Encryption
	{
		public function Encryption()
		{
		}
		
		public static function toBase64Encoder(value:String):String{
			
			var b64:Base64Encoder = new Base64Encoder();
			b64.encode(value);
			
			return b64.toString();
		}
	}
}