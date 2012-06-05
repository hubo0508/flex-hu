package com.njit
{

	//判断是否线头
	public class LineFlag
	{

		private var line:ElementLine;
		private var flag:Boolean;

		public function LineFlag(l:ElementLine, f:Boolean)
		{
			this.line=l;
			this.flag=f;
		}

		public function setLine(l:ElementLine):void
		{
			this.line=l;
		}

		public function setFlag(f:Boolean):void
		{
			this.flag=f;
		}

		public function getLine():ElementLine
		{
			return this.line;
		}

		public function getFlag():Boolean
		{
			return this.flag;
		}
	}
}