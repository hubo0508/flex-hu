package org.hubo.flexextjs.utils
{
	import flash.display.DisplayObject;
	
	import mx.controls.SWFLoader;
	import mx.managers.PopUpManager;

	public class Loading
	{
		public function Loading()
		{
		}
		
		/**
		 *  从后台读数据...
		 * 		var swf:SWFLoader = this.createLoading();
		 *  	PopUpManager.addPopUp(swf,this,true);
		 *  	PopUpManager.centerPopUp(swf);
		 *  当数据记取成功..
		 *      PopUpManager.removePopUp(swf);
		 *  正在查询数据...
		 *	 var timer:Timer = new Timer(1000,5);//5 Seconds
		 *	 timer.addEventListener(TimerEvent.TIMER_COMPLETE, function onTimerComplete(event):void{
		 *		 Alert.show('操作失败!');
		 *	 });
		 *	 timer.start();
		 */
		public function createLoading(swfPath:String='assets/flexextjs/loading_blue.swf'):SWFLoader
		{
			var swf:SWFLoader=new SWFLoader();
			swf.source=swfPath;
			return swf;
		}		
		
		public function alertLoading(parent:DisplayObject,swfPath:String='assets/flexextjs/loading_blue.swf'):SWFLoader
		{
			var swf:SWFLoader = this.createLoading();
			
			PopUpManager.addPopUp(swf,parent,true);
			PopUpManager.centerPopUp(swf);
			
			return swf;
		}
	}
}