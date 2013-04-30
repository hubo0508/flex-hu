package com.workflow.components.extend
{
	import spark.components.RadioButton;
	
	public class ERadioButton extends RadioButton
	{
		public function ERadioButton()
		{
			super();
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		}
		
		override protected function set hovered(value:Boolean):void
		{
			super.hovered = value;
		}
		
		public function setHovered(value:Boolean):void
		{
			this.hovered = value ;
		}
	}
}