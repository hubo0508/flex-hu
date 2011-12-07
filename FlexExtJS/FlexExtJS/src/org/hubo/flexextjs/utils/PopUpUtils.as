package  org.hubo.flexextjs.utils
{
	import flash.display.DisplayObject;
	
	import mx.core.IFlexDisplayObject;
	import mx.managers.PopUpManager;

	/**
	 * 弹出窗体
	 * 
	 * @auth HUBO
	 */
	public class PopUpUtils
	{
		public function PopUpUtils()
		{
		}

		/**
		 * 弹出顶级窗口
		 *
		 * @param window:IFlexDisplayObject — 要弹出的 IFlexDisplayObject。
		 * 
		 * @param center:Boolean(defalut=true) 是否弹出窗口进行居中显示

		 * @param parent:DisplayObject — DisplayObject，用于确定要使用 SystemManager 的哪些层，以及（可选）确定居中新的顶级窗口所用的参考点。它可能并非弹出窗口的实际父项，因为所有弹出窗口都以 SystemManager 为父项。

		 * @param modal:Boolean (default = false) — 如果为 true，则该窗口为模态窗口，也就是说在删除该窗口之前，用户将无法与其它弹出窗口交互。

		 */
		public static function show(window:IFlexDisplayObject, parent:DisplayObject, center:Boolean = true,modal:Boolean=true):void
		{
			PopUpManager.addPopUp(window, parent, modal);
			if(center)
			{
				PopUpManager.centerPopUp(window);
			}			
		}
	}
}