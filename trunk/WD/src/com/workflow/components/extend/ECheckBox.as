package com.workflow.components.extend
{
	import spark.components.CheckBox;
	
	public class ECheckBox extends CheckBox
	{
		public function ECheckBox()
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