package merapi.examples.helloworld.messages  
{  
	
	import merapi.messages.Message;  
	//这句话就是映射  
	[RemoteClass( alias="merapi.examples.helloworld.messages.HelloWorldMessage" )]  
	public class HelloWorldMessage extends Message  
	{  
		public static const HELLO : String = "hello";  
		public function HelloWorldMessage()   
		{  
			super( HELLO );  
		}  
		
		public var helloText : String = null;  
		
		
	}   
}   