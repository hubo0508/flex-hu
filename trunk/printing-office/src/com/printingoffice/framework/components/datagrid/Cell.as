package com.printingoffice.framework.components.datagrid
{
	import assets.skin.CheckBoxSkin;
	
	import com.printingoffice.framework.util.UIUtil;
	
	import flash.display.Graphics;
	
	import mx.controls.Label;
	import mx.graphics.SolidColor;
	import mx.managers.CursorManager;
	
	import spark.components.CheckBox;
	import spark.components.Group;
	import spark.primitives.Rect;
	
	/**
	 * <p>
	 *     <b>HUBO 2012-2-18  /  hubo.0508ⓐgmail.com</br>com.printingoffice.framework.components.datagrid.Cell.as</b>
	 * </p>
	 */
	public class Cell extends Group
	{
		public function Cell()
		{
			super();
			
			this.useHandCursor = true;
			this.buttonMode = true;
		}
		
		public var backgroupColor:uint=0xFFFFFF;
		
		public var constColor:uint = 0xFFFFFF;
		
		public var borderColor:uint=0xE7E5E5;
		
		private var _text:String="";
		
		private var _labelOrBox:String = "LABEL";
		
		private var label:Label;
		
		private var box:CheckBox;
		
		public static const LABEL:String = "LABEL";
		
		public static const BOX:String  = "BOX";
		
		override protected function measure():void
		{
			super.measure();
			
			this.measuredWidth=42;
			this.measuredHeight=42;
		}
		
		/**
		 * <p>重写父组件updateDisplayList</p>
		 *
		 * 1、对容器增加填充背景，根据属性bgMark(default=false)来定义。颜色设置根据属性backgroupColor(default=0xF3F3F3)</br>
		 * 2、对容器增加底部边框，根据属性borderColor(default=0xE7E5E5)定义颜色值。
		 */
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);
			
			if(label)
			{
				label.maxWidth = w;
			}

			var g:Graphics=graphics;
			g.clear();
			
			g.beginFill(backgroupColor);
			g.drawRect(0, 0, w, h);
			g.endFill();
			
			g.lineStyle(1, borderColor);
			g.moveTo(0, h);
			g.lineTo(w, h);
			
			//g.moveTo(w, 0);
			//g.lineTo(w, h)
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			if(labelOrBox == "LABEL" && !label) 
			{
				label = new Label();
				label.left = 4;
				label.right = 4;
				label.verticalCenter = 0;
				label.useHandCursor = true;
				label.buttonMode = true;
				
				this.addElement(label);
			}
			
			if(labelOrBox == "BOX" && !box) 
			{
				box = new CheckBox();
				box.verticalCenter = 0;
				box.horizontalCenter = 0;
				box.setStyle("skinClass",Class(CheckBoxSkin));
				box.useHandCursor = true;
				box.buttonMode = true;
				
				this.addElement(box);
			}
			
		}
		
		public function clearSelectedOrValue():void
		{
			if(label)
			{
				label.text = "";
			}
			
			if(box)
			{
				box.selected = false;
			}
		}

		[Inspectable(category="General", enumeration="LABEL,BOX", defaultValue="LABEL")]
		public function get labelOrBox():String
		{
			return _labelOrBox;
		}
		
		public function set labelOrBox(value:String):void
		{
			_labelOrBox = value;
		}
		
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
			
			if(label)
			{
				label.text = value;
			}
		}

	}
}