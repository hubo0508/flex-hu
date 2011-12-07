package org.hubo.flexextjs.components
{
	import flash.utils.flash_proxy;
	
	import spark.components.ComboBox;
	
	public class ComboBoxIsNotEditable extends ComboBox
	{
		public function ComboBoxIsNotEditable()
		{
			super();
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			super.textInput.editable = false;
		}
	}
}