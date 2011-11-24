package org.hu.validator.event
{
	import flash.events.Event;
	
	/**
	 * author： HUBO hubo.0508ⓐgmail.com
	 */
	public class ValidatorEvent extends Event
	{
		
		public static const REGEXP_EVENT:String = "validatorChange";
		
		/**
		 * 验证标标
		 */
		private var _validatorFlag:Boolean;		
		
		public function ValidatorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
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