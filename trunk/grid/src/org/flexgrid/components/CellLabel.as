package org.flexgrid.components
{
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.events.DynamicEvent;
	
	import org.flexgrid.util.ConstantsLibrary;
	
	import spark.components.Label;
	
	
	/**
	 * <p>
	 *     <b>HUBO 2012-4-9  /  hubo.0508ⓐgmail.com</br>org.flexgrid.components.CellLabel.as</b>
	 * </p>
	 */
	public class CellLabel extends Label
	{
		public function CellLabel()
		{
			super();
		}
		
		override public function get height():Number
		{
			if(super.height > ConstantsLibrary.CELL_HEIGHT){
				var dye:DynamicEvent = new DynamicEvent("changeCellLabel");
				dye.value = super.height;
				this.dispatchEvent(dye);
			}
			
			return super.height;
		}
		
		override public function set height(value:Number):void
		{
		
			super.height = value;			
		}
		
		override public function set text(value:String):void
		{
			super.text = value;
		}
		
		
	}
}