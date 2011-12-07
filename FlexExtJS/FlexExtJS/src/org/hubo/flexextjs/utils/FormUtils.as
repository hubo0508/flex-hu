package org.hubo.flexextjs.utils
{
	import mx.containers.Form;
	import mx.containers.FormItem;
	import mx.core.UIComponent;
	
	import spark.components.Button;
	import spark.components.CheckBox;
	import spark.components.ComboBox;
	import spark.components.RadioButton;
	import spark.components.TextArea;
	import spark.components.TextInput;
	import spark.components.supportClasses.ToggleButtonBase;
	
	/** 
	 * 2010-12-13-HUBO
	 */
	public class FormUtils
	{
		public function FormUtils()
		{
		}
		
		public static function singleValueFromRadioButton(ui:Object):String
		{
			var numEle:int=ui.numElements;
			for (var i:int=0; i < numEle; i++)
			{
				var box:Button=ui.getElementAt(i) as Button;
				
				var boxLabel:String;
				if (box is CheckBox && box)
				{				
					boxLabel = (box as CheckBox).selected == true ? (box as CheckBox).label : null;
				}
				else if (box is RadioButton && box)
				{
					boxLabel=(box as RadioButton) == true ? (box as RadioButton).label : null;
				}
				
				if (boxLabel)
				{
					return boxLabel;
					break;
				}
			}
			
			return null;
		}
		
		public static function singleSelectionToRadioButton(ui:Object, item:String):void
		{
			var numEle:int=ui.numElements;
			for (var i:int=0; i < numEle; i++)
			{
				var box:ToggleButtonBase=ui.getElementAt(i) as ToggleButtonBase;
				var boxFlag:Boolean=false;
				if (box is CheckBox && box)
				{
					boxFlag=selectedOrDeselect(box, item);
				}
				else if (box is RadioButton && box)
				{
					boxFlag=selectedOrDeselect(box, item);
				}
				
				if (boxFlag)
				{
					break;
				}
			}
			
		}
		
		/**
		 * 取得指定Form表单中的值
		 */
		public static function formValue(type:String, form:Form, vo:Object=null, arr:Array=null):*
		{
			if (type != "get" && type != "set")
			{
				return null;
			}
			
			var itemValue:Array=[];
			var childNum:int=form.numElements;
			for (var i:int=0; i < childNum; i++)
			{
				var formItem:FormItem=form.getElementAt(i) as FormItem;
				if (formItem)
				{
					var formItemChildNum:int=formItem.numElements;
					for (var j:int=0; j < formItemChildNum; j++)
					{
						var textUI:UIComponent=formItem.getElementAt(j) as UIComponent;
						var textUI_ID:String=textUI.id;
						var value:String=getUIValue(textUI);
						try
						{
							if (textUI_ID && value && type == "get")
							{
								if (vo) vo[textUI_ID]=value;
								else itemValue[textUI_ID]=value;
							}
							else if (type == "set")
							{								
								if (arr) setUIValue(gettingByArray(textUI_ID,arr) as String, textUI); 
								else setUIValue(vo[textUI_ID], textUI); 
							}
						}
						catch (e:*){ trace(e); }
					}
				}
			}
			
			return vo ? vo : itemValue;
		}
		
		/***************************************************************************/
		/***************************************************************************/
		
		
		private static function gettingByArray(textUI_ID:String, arr:Array):Object
		{
			var objValue:Object = arr[0][textUI_ID];
			if(objValue as String)
			{
				return objValue;
			}
			else 
			{
				for(var i:int=0; i<arr.length; i++)
				{
					objValue = arr[i][textUI_ID];
					if(objValue as String)
					{
						return objValue;
					}
				}
			}
			
			return "undefined";
		}
		
		
		private static function selectedOrDeselect(box:ToggleButtonBase, item:String):Boolean
		{
			var ui_label:String=box.label;
			var ui_id:String=box.id;
			if (ui_label == item)
			{
				box.selected=true;
				return true;
			}
			else if (ui_id == item)
			{
				box.selected=true;
				return true;
			}
			
			return false;
		}
		
		private static function setUIValue(text:String, ui:Object):void
		{			
			try
			{
				if(ui is TextInput || ui is TextArea)
				{
					ui.text=text;
				}
				
				if(ui is ComboBox)
				{
					ui.selectedItem=text;
				}
			}catch(e:Error)
			{
			}
		}
		
		
		private static function getUIValue(ui:Object):String
		{
			var value:String;			
			try
			{
				if(ui is TextInput || ui is TextArea)
				{
					value=ui.text;
				}
				
				if(ui is ComboBox)
				{
					value=ui.selectedItem["label"];
				}
			}catch(e:Error)
			{
			}
			return value;
		}
	}
}