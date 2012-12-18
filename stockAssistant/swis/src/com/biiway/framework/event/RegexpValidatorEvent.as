////////////////////////////////////////////////////////////////////////////////
//
//  转载或使用该源码请尊重作者的劳动成果
//  Copyright 2010
//
//  QQ:     657261109
//  TEL：        158 280 190 62	
//  E-Mail：hubo.0508@gmail.com
//  MSN：        hubo.0508@msn.cn
//
////////////////////////////////////////////////////////////////////////////////
package com.biiway.framework.event
{
	import flash.events.Event;
	
	/**
	 * author： HUBO hubo.0508ⓐgmail.com
	 */
	public class RegexpValidatorEvent extends Event
	{
		
		public static const REGEXP_EVENT:String = "validatorChange";
		
		/**
		 * 验证标标
		 */
		private var _validatorFlag:Boolean;		
		
		public function RegexpValidatorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public function get validatorFlag():Boolean
		{
			return _validatorFlag;
		}

		public function set validatorFlag(value:Boolean):void
		{
			_validatorFlag = value;
		}

	}
}