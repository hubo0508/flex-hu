package com.hubo.workflow.core
{
	import com.hubo.workflow.ui.child.ElementLine;

	/**
	 * 线条属性类
	 */
	public class LineProperties
	{

		/**
		 * 元素线条
		 */
		private var _elementLine:ElementLine;

		/**
		 * 箭头标示
		 */
		private var _arrowsMark:Boolean;

		public function LineProperties(elementLine:ElementLine, arrowsMark:Boolean)
		{
			this.elementLine=elementLine;
			this.arrowsMark=arrowsMark;
		}

		/**
		 * 箭头标示
		 */
		public function get arrowsMark():Boolean
		{
			return _arrowsMark;
		}

		/**
		 * @private
		 */
		public function set arrowsMark(value:Boolean):void
		{
			_arrowsMark=value;
		}

		/**
		 * 元素线条
		 */
		public function get elementLine():ElementLine
		{
			return _elementLine;
		}

		/**
		 * @private
		 */
		public function set elementLine(value:ElementLine):void
		{
			_elementLine=value;
		}


	}
}