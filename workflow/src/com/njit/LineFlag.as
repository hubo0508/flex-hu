package com.njit
{
	//判断是否线头
	public class LineFlag{
		
		private var line:LinkLine;
		private var flag:Boolean;
		
		public function LineFlag(l:LinkLine,f:Boolean){
			this.line=l;
			this.flag=f;
		}
		
		public function setLine(l:LinkLine):void{
			this.line=l;
		}
		public function setFlag(f:Boolean):void{
			this.flag=f;
		}
		
		public function getLine():LinkLine{
			return this.line;
		}
		public function getFlag():Boolean{
			return this.flag;
		}
	}
}