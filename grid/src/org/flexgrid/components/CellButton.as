package org.flexgrid.components
{
	import spark.components.Button;
	import spark.components.Label;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-4-10  /  hubo.0508ⓐgmail.com</br>org.flexgrid.components.CellButton.as</b>
	 * </p>
	 */
	public class CellButton extends Button
	{
		public function CellButton()
		{
			super();
		}
		
		private var tagLabel:Label;
		
		private var _text:String;
		
		override protected function createChildren():void
		{
			super.createChildren();
			if(!tagLabel)
			{
				tagLabel = new Label;
				
				this.addChild(tagLabel);
			}
		}

		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if(tagLabel)
			{
				tagLabel.maxDisplayedLines = 1;
				tagLabel.verticalCenter = - 2;
			}
		}
		
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

	}
}