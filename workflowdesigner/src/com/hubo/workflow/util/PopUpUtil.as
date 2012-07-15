/**
 * @Title PopUpUtil.as
 * @Package com.biiway.framework.util
 * @Description TODO
 * @date Apr 19, 2011 11:02:57 PM
 * @version V1.0 
 */
package com.hubo.workflow.util
{
	import flash.display.DisplayObject;

	import mx.containers.Panel;
	import mx.controls.Alert;
	import mx.core.IChildList;
	import mx.core.IFlexDisplayObject;
	import mx.core.UIComponent;
	import mx.effects.Fade;
	import mx.events.EffectEvent;
	import mx.managers.ISystemManager;
	import mx.managers.PopUpManager;

	import spark.components.Application;


	/**
	 * @Description TODO
	 * @author： HUBO hubo.0508ⓐgmail.com    /  date：Apr 19, 2011
	 */
	public final class PopUpUtil
	{
		public function PopUpUtil()
		{
		}

		/**
		 * 弹出顶级窗口
		 *
		 * @param window:IFlexDisplayObject — 要弹出的 IFlexDisplayObject。
		 *
		 * @param center:Boolean(defalut=true) 是否弹出窗口进行居中显示
		 *
		 * @param parent:DisplayObject — DisplayObject，用于确定要使用 SystemManager 的哪些层，以及（可选）确定居中新的顶级窗口所用的参考点。它可能并非弹出窗口的实际父项，因为所有弹出窗口都以 SystemManager 为父项
		 *
		 * @param modal:Boolean (default = false) — 如果为 true，则该窗口为模态窗口，也就是说在删除该窗口之前，用户将无法与其它弹出窗口交互。
		 *
		 * @param effect:Boolean(default=true) 执行动作是否需要增加效果 默认为true
		 *
		 */
		public static function messageWindow(window:IFlexDisplayObject, parent:UIComponent, modal:Boolean=true, center:Boolean=true, scale:Number=1, effect:Boolean=true):void
		{
//			if(scale != 1)
//			{
//				window.width = parent.stage.stageWidth*scale;
//				window.height = parent.stage.stageHeight*scale;
//			}else
//			{
//				window.width = parent.stage.stageWidth;
//				window.height = parent.stage.stageHeight;
//
//				//(window as  Object).chageBtnSource(IconUtil.deoxidize);
//			}

			if (effect)
			{
				var disylayObj:DisplayObject=parent.parentApplication as DisplayObject == null ? parent as DisplayObject : parent.parentApplication as DisplayObject;

				PopUpManager.addPopUp(window, disylayObj, modal);

				if (center)
					PopUpManager.centerPopUp(window);

				EffectUtil.popUpEffect(window as UIComponent);
			}
			else
			{
				window.visible=true;
			}
		}

		/**
		 * 删除已有容器
		 *
		 * @param window:IFlexDisplayObject 目标容器
		 * @param effect:Boolean(default=true) 执行动作是否需要增加效果 默认为true
		 */
		public static function removeWindow(window:IFlexDisplayObject, effect:Boolean=true):void
		{
			if (effect)
			{
				EffectUtil.removePopUpEffect(window as UIComponent, function removeAlertPopUp(event:EffectEvent):void
				{
					PopUpManager.removePopUp(window);
				});
			}
			else
			{
				PopUpManager.removePopUp(window);
			}
		}

		/**
		 * 最小化容器
		 *
		 * @param window:IFlexDisplayObject 目标容器
		 * @param effect:Boolean(default=true) 执行动作是否需要增加效果 默认为true
		 */
		public static function minimizeWindow(window:IFlexDisplayObject, effect:Boolean=true):void
		{

			if (effect)
			{
				EffectUtil.removePopUpEffect(window as UIComponent, function removeAlertPopUp(event:EffectEvent):void
				{
					EffectUtil.popUpEffect(window as UIComponent);
				});
			}
			else
			{
				window.visible=false;
			}
		}


		/**
		 * 弹出提示消息
		 *
		 * @param message:String 提示消息
		 * @param title:String(default=null) 提示消息标题
		 * @param delay:Number — 计时器事件间的延迟（以毫秒为单位）。
		 * @param repeatCount:int (default = 2) — 指定重复次数。如果为 0，则计时器重复无限次数。如果不为 0，则将运行计时器，运行次数为指定的次数，然后停止。
		 *
		 * @author HUBO hubo.0508@gmail.com
		 */
		public static function messageBox(message:String, title:String="提示", repeatCount:int=2, delay:int=1000):void
		{
			mx.controls.Alert.show(message, title);
		}

		/**
		 * 删除上一个弹出窗口
		 *
		 * @param SID:String 弹出窗口对象ID
		 * @param UIObj:UICompontent 弹出窗口当前所在页面
		 */
		public static function beforeDeletingTheWindow(SID:String, UIObj:UIComponent):void
		{
			//Save SID
			var SID_Arr:Array=[];

			//Query SID
			var systemManager:ISystemManager=UIObj.systemManager;
			var ichildList:IChildList=systemManager.rawChildren;
			for (var i:int=0; i < ichildList.numChildren; i++)
			{
				var obj:Object=ichildList.getChildAt(i);

				try
				{
					if (obj.id == SID)
					{
						SID_Arr.push(i);
					}
				}
				catch (e:*)
				{
					trace(e)
				}
			}

			if (SID_Arr.length <= 1)
				return;

			//Remove
			SID_Arr.pop();
			for (var j:int=0; j < SID_Arr.length; j++)
			{
				PopUpUtil.removeWindow(ichildList.getChildAt(SID_Arr[j]) as IFlexDisplayObject);
			}
		}

		public static function removeAllWindow(displayObject:UIComponent):void
		{
			var systemManager:ISystemManager=displayObject.systemManager;

			var ichildList:IChildList=systemManager.rawChildren;
			for (var i:int=0; i < ichildList.numChildren; i++)
			{
				var obj:Object=ichildList.getChildAt(i);
				trace(i + " content = " + obj);
				if (obj == "mouseCatcher" || obj == "cursorHolder" || obj is Alert || obj == "modalWindow" || obj is Application)
				{
				}
				else
				{
					PopUpManager.removePopUp(obj as IFlexDisplayObject);
				}
			}
		}
	}
}