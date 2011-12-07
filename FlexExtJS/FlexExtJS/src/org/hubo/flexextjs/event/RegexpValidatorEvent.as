package org.hubo.flexextjs.event
{
	import flash.events.Event;
	
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