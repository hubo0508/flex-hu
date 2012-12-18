/**
 * @Project IWMP_lib
 * @Title LoginSystemEvent.as
 * @Package com.biiway.framework.event
 * @Description TODO
 * @date Apr 22, 2011 4:19:06 PM
 * @version V1.0  
 */
package com.biiway.framework.event
{
	import flash.events.Event;
	
	
	/** 
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 22, 2011
	 */
	public class LoginSystemEvent extends Event
	{
		public function LoginSystemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}