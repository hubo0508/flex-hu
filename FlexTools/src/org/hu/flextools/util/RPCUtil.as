/**
 * @Project FlexTools
 * @Title RPCUtil.as
 * @Package com.hu.util
 * @date 2011-6-8 下午04:10:14
 * @version V1.0 
 */
package org.hu.flextools.util
{
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;

	/**
	 * author： HUBO hubo.0508ⓐgmail.com    /  date：Jan 23, 2011 7:08:40 PM
	 */
	public class RPCUtil
	{
		public function RPCUtil()
		{
		}

		public static function faultHandler(event:FaultEvent, title:String="提示"):void
		{
			var asy:AsyncToken=event.token as AsyncToken;
			var message:RemotingMessage=asy.message as RemotingMessage;
			trace(message.body);
			trace(message.operation);
			PopUpUtil.messageBox("连接异常，请与管理员联系", title);
		}

		/**
		 * 为异步令牌token添加Responder
		 *
		 * @param token 异步令牌
		 * @param result 当请求成功完成时调用的函数
		 * @param fualt 当请求失败调用的函数
		 */
		public static function addResponder(tokn:AsyncToken,result:Function, fault:Function=null):void
		{
			tokn.addResponder(new Responder(result, fault));
		}
	}
}