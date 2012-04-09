package org.flexgrid.ui
{
	import flash.events.Event;
	import flash.events.MouseEvent;

	import mx.controls.Alert;
	import mx.events.DynamicEvent;

	import org.flexgrid.components.CellLabel;
	import org.flexgrid.components.CustomGroup;
	import org.flexgrid.util.ConstantsLibrary;

	import spark.components.CheckBox;
	import spark.components.Group;
	import spark.components.Label;


	/**
	 * <p>
	 *     <b>HUBO 2012-4-8  /  hubo.0508ⓐgmail.com</br>org.flexgrid.ui.Cell.as</b>
	 * </p>
	 */
	public class Cell extends CustomGroup
	{

		/**
		 * 显示文本【私有】
		 */
		private var tagText:CellLabel;

		/**
		 * 显示选择框【私有】
		 */
		private var checkbox:CheckBox;

		/**
		 * 显示文本是否在过长时截断文本，默认为true
		 */
		private var _isTruncated:Boolean=true;

		/**
		 * 显示文本左右便宜量，默认为1
		 */
		private var _offset:int=5;

		/**
		 * 显示文本
		 */
		private var _text:String;

		/**
		 * 内容样式，默认为【text】，可选值为【text、checkbox、custom】
		 */
		private var _type:String="text";

		public function Cell()
		{
			super();
			addEventListener(MouseEvent.CLICK, clickCellHandler, false, 0, true);
		}

		override protected function measure():void
		{
			super.measure();
			this.measuredHeight=ConstantsLibrary.CELL_HEIGHT;
			this.measuredWidth=ConstantsLibrary.CELL_WEIGHT;
		}

		override protected function createChildren():void
		{
			super.createChildren();

			if (!tagText && type == "text")
			{
				tagText=new CellLabel();
				tagText.addEventListener("changeCellLabel", changeCellLabel, false, 0, true);

				this.addElement(tagText);
			}

			if (!checkbox && type == "checkbox")
			{
				checkbox=new CheckBox();

				this.addElement(checkbox);
			}
		}

		override protected function commitProperties():void
		{
			super.commitProperties();

			if (tagText && type == "text")
			{
				tagText.verticalCenter=0;
				tagText.setStyle("paddingLeft", offset);
				tagText.text=text;
				if (isTruncated)
				{
					tagText.maxDisplayedLines=1;
				}
			}

			if (checkbox && type == "checkbox")
			{
				checkbox.verticalCenter=0;
				checkbox.horizontalCenter=0;
			}
		}

		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);

			if (tagText && type == "text" && tagText.maxWidth != w)
			{
				tagText.maxWidth=this.width;
			}
		}

		/**
		 * 点击当前单元格
		 */
		protected function clickCellHandler(event:MouseEvent):void
		{
			if (checkbox && type == "checkbox")
			{
				this.setCheckboxState();
			}
		}

		/**
		 * 当CellLabel组件高度
		 */
		protected function changeCellLabel(event:DynamicEvent):void
		{
			var newHeight:Number=event.value as Number;
			if (this.height < newHeight && this.height != (newHeight + 8))
			{
				this.height=newHeight + 8;
			}
		}

		/**
		 * 设置选择框状态，当type值为checkbox时，调用该函数有效
		 */
		public function setCheckboxState():void
		{
			if (!checkbox || type != "checkbox")
				return;

			checkbox.selected=!checkbox.selected;
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//get and set//
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		/**
		 * 显示文本是否在过长时截断文本，默认为true
		 */
		public function get isTruncated():Boolean
		{
			return _isTruncated;
		}

		/**
		 * @private
		 */
		public function set isTruncated(value:Boolean):void
		{
			_isTruncated=value;
		}

		/**
		 * 显示文本左右便宜量，默认为1
		 */
		public function get offset():int
		{
			return _offset;
		}

		/**
		 * @private
		 */
		public function set offset(value:int):void
		{
			_offset=value;
		}

		/**
		 * 显示文本
		 */
		public function get text():String
		{
			return _text;
		}

		/**
		 * @private
		 */
		public function set text(value:String):void
		{
			_text=value;
		}

		[Inspectable(category="General", enumeration="text,checkbox,custom", defaultValue="text")]

		/**
		 * 内容样式，默认为【text】，可选值为【text、checkbox、custom】
		 */
		public function get type():String
		{
			return _type;
		}

		/**
		 * @private
		 */
		public function set type(value:String):void
		{
			_type=value;
		}


	}
}