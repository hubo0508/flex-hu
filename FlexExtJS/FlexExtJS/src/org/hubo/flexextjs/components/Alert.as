package org.hubo.flexextjs.components
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import mx.controls.Alert;
	import mx.managers.PopUpManager;

	/**
	 * 扩展Alert类,可自动关闭窗口
	 *
	 * 2010-01-23
	 */
	public class Alert extends mx.controls.Alert
	{

		private static var delay:Number=0;

		private static var repeatCount:Number=1000;

		public function Alert()
		{
			super();
		}

		/**
		 * 设置Alert窗口自动关闭时间,不调用该方法则Alert不自动关闭
		 *
		 * @_delay 间隔多少秒后关闭Alert窗口
		 *
		 * @_repeatCount 计时器事件间的延迟(以毫秒为单位),默认为1秒
		 */
		public static function setTimeOut(_repeatCount:Number=2, _delay:Number=1000):void
		{
			repeatCount=_repeatCount;

			delay=_delay;
		}

		/**
		 *  Static method that pops up the Alert control. The Alert control
		 *  closes when you select a button in the control, or press the Escape key.
		 *
		 *  @param text Text string that appears in the Alert control.
		 *  This text is centered in the alert dialog box.
		 *
		 *  @param title Text string that appears in the title bar.
		 *  This text is left justified.
		 *
		 *  @param flags Which buttons to place in the Alert control.
		 *  Valid values are <code>Alert.OK</code>, <code>Alert.CANCEL</code>,
		 *  <code>Alert.YES</code>, and <code>Alert.NO</code>.
		 *  The default value is <code>Alert.OK</code>.
		 *  Use the bitwise OR operator to display more than one button.
		 *  For example, passing <code>(Alert.YES | Alert.NO)</code>
		 *  displays Yes and No buttons.
		 *  Regardless of the order that you specify buttons,
		 *  they always appear in the following order from left to right:
		 *  OK, Yes, No, Cancel.
		 *
		 *  @param parent Object upon which the Alert control centers itself.
		 *
		 *  @param closeHandler Event handler that is called when any button
		 *  on the Alert control is pressed.
		 *  The event object passed to this handler is an instance of CloseEvent;
		 *  the <code>detail</code> property of this object contains the value
		 *  <code>Alert.OK</code>, <code>Alert.CANCEL</code>,
		 *  <code>Alert.YES</code>, or <code>Alert.NO</code>.
		 *
		 *  @param iconClass Class of the icon that is placed to the left
		 *  of the text in the Alert control.
		 *
		 *  @param defaultButtonFlag A bitflag that specifies the default button.
		 *  You can specify one and only one of
		 *  <code>Alert.OK</code>, <code>Alert.CANCEL</code>,
		 *  <code>Alert.YES</code>, or <code>Alert.NO</code>.
		 *  The default value is <code>Alert.OK</code>.
		 *  Pressing the Enter key triggers the default button
		 *  just as if you clicked it. Pressing Escape triggers the Cancel
		 *  or No button just as if you selected it.
		 *
		 *  @return A reference to the Alert control.
		 *
		 *  @see mx.events.CloseEvent
		 */
		public static function show(text:String="", title:String="", flags:uint=0x4 /* Alert.OK */, parent:Sprite=null, closeHandler:Function=null, iconClass:Class=null, defaultButtonFlag:uint=0x4 /* Alert.OK */):mx.controls.Alert
		{
			var alert:mx.controls.Alert=mx.controls.Alert.show(text, title, flags, parent, closeHandler, iconClass, defaultButtonFlag);

			if (delay > 0)
			{
				var timer:Timer=new Timer(delay, repeatCount);

				timer.addEventListener(TimerEvent.TIMER, function onTick(event:Event):void
				{
					trace("tick" + event.target.currentCount);
				});

				timer.addEventListener(TimerEvent.TIMER_COMPLETE, function closeAlert(event:Event):void
				{

					PopUpManager.removePopUp(alert);

				});

				timer.start();
			}

			return alert;

		}

	}

}