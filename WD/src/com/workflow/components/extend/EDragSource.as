package com.workflow.components.extend
{
	import mx.core.DragSource;
	
	public class EDragSource extends DragSource
	{
		public function EDragSource(data:Object, format:String)
		{
			super();
			
			this.addData(data, format);
		}
	}
}