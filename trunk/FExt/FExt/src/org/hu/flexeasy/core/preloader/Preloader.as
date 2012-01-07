package  org.hu.flexeasy.core.preloader
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import mx.controls.Image;
	import mx.events.RSLEvent;
	import mx.preloaders.SparkDownloadProgressBar;
	
	import spark.primitives.BitmapImage;
	
	public class Preloader extends SparkDownloadProgressBar
	{
		
		private var _displayStartCount:uint = 0; 
		private var _initProgressCount:uint = 0;
		private var _downloadComplete:Boolean = false;
		private var _showingDisplay:Boolean = false;
		private var _startTime:int;
		private var preloaderDisplay:PreloaderDisplay;
		private var rslBaseText:String = "loading: ";

		public function Preloader()
		{
			super();
		}
		
		/**
		 *  Event listener for the <code>FlexEvent.INIT_COMPLETE</code> event.
		 *  NOTE: This event can be commented out to stop preloader from completing during testing
		 */
		override protected function initCompleteHandler(event:Event):void
		{
			dispatchEvent(new Event(Event.COMPLETE)); 
		}
		
		/**
		 *  Creates the subcomponents of the display.
		 */
		override protected function createChildren():void
		{    
			if (!preloaderDisplay) {
				preloaderDisplay = new PreloaderDisplay();
				
				var startX:Number = Math.round((stageWidth - preloaderDisplay.width) / 2);
				var startY:Number = Math.round((stageHeight - preloaderDisplay.height) / 2);
				
				preloaderDisplay.x = startX;
				preloaderDisplay.y = startY;
				addChild(preloaderDisplay);
			}
		}
		
		/**
		 * Event listener for the <code>RSLEvent.RSL_PROGRESS</code> event. 
		**/
		override protected function rslProgressHandler(evt:RSLEvent):void {
			if (evt.rslIndex && evt.rslTotal) {
				//create text to track the RSLs being loaded
				rslBaseText = "loading RSL " + evt.rslIndex + " of " + evt.rslTotal + ": ";
			}
		}
		
		/** 
		 *  indicate download progress.
		 */
		override protected function setDownloadProgress(completed:Number, total:Number):void {
			if (preloaderDisplay) {
				preloaderDisplay.setMainProgress(completed/total);
				setPreloaderLoadingText(rslBaseText + Math.round((completed/total)*100).toString() + "%");
			}
		}
		
		/** 
		 *  Updates the inner portion of the download progress bar to
		 *  indicate initialization progress.
		 */
		override protected function setInitProgress(completed:Number, total:Number):void {
			if (preloaderDisplay) {
				//set the initialization progress bar inside PreloaderDisplay
				preloaderDisplay.setInitalizeProgress(completed/total);
				//set loading text
				if (completed > total) {
					setPreloaderLoadingText("almost done");
				} else {
					setPreloaderLoadingText("initializing " + completed + " of " + total);
				}
			}
		} 
		
		
		/**
		 *  Event listener for the <code>FlexEvent.INIT_PROGRESS</code> event. 
		 *  This implementation updates the progress bar
		 *  each time the event is dispatched. 
		 */
		override protected function initProgressHandler(event:Event):void {
			var elapsedTime:int = getTimer() - _startTime;
			_initProgressCount++;
			
			if (!_showingDisplay &&	showDisplayForInit(elapsedTime, _initProgressCount)) {
				_displayStartCount = _initProgressCount;
				show();
				// If we are showing the progress for the first time here, we need to call setDownloadProgress() once to set the progress bar background.
				setDownloadProgress(100, 100);
			}
			
			if (_showingDisplay) {
				// if show() did not actually show because of SWFObject bug then we may need to set the download bar background here
				if (!_downloadComplete) {
					setDownloadProgress(100, 100);
				}
				setInitProgress(_initProgressCount, initProgressTotal);
			}
		}
		
		private function show():void
		{
			// swfobject reports 0 sometimes at startup
			// if we get zero, wait and try on next attempt
			if (stageWidth == 0 && stageHeight == 0)
			{
				try
				{
					stageWidth = stage.stageWidth;
					stageHeight = stage.stageHeight
				}
				catch (e:Error)
				{
					stageWidth = loaderInfo.width;
					stageHeight = loaderInfo.height;
				}
				if (stageWidth == 0 && stageHeight == 0)
					return;
			}
			
			_showingDisplay = true;
			createChildren();
		}
		
		private function setPreloaderLoadingText(value:String):void
		{
			preloaderDisplay.loading_txt.text = value;
		}
		
	}
}