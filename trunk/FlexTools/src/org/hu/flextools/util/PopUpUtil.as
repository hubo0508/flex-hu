/**
 * @Project FlexTools
 * @Title PopUpUtil.as
 * @Package com.hu.util
 * @date 2011-6-8 下午04:08:58
 * @version V1.0  
 */
package org.hu.flextools.util
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
	 * author： HUBO hubo.0508ⓐgmail.com    /  date：Jan 23, 2011 7:08:40 PM
	 */
	public class PopUpUtil
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
		public static function messageWindow(window:IFlexDisplayObject, parent:UIComponent,modal:Boolean=true,center:Boolean = true,scale:Number = 1,effect:Boolean=true):void
		{
			if(scale != 1)
			{
				window.width = parent.stage.stageWidth*scale;
				window.height = parent.stage.stageHeight*scale;
			}
			
			if(effect)
			{
				var disylayObj:DisplayObject = 
					parent.parentApplication as DisplayObject == null 
					? 
					parent as DisplayObject : parent.parentApplication as DisplayObject;
				
				PopUpManager.addPopUp(window, disylayObj, modal);
				
				if(center)PopUpManager.centerPopUp(window);
				
				EffectUtil.popUpEffect(window as UIComponent);
			}
			else
			{
				window.visible = true;
			}
		}
		
		/**
		 * 删除已有容器
		 * 
		 * @param window:IFlexDisplayObject 目标容器
		 * @param effect:Boolean(default=true) 执行动作是否需要增加效果 默认为true
		 */
		public static function removeWindow(window:IFlexDisplayObject,effect:Boolean=true):void
		{		
			if(effect)
			{
				EffectUtil.removePopUpEffect(window as UIComponent,function removeAlertPopUp(event:EffectEvent):void
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
		public static function minimizeWindow(window:IFlexDisplayObject,effect:Boolean=true):void
		{
			
			if(effect)
			{
				EffectUtil.removePopUpEffect(window as UIComponent,function removeAlertPopUp(event:EffectEvent):void
				{
					EffectUtil.popUpEffect(window as UIComponent);
				});
			}
			else
			{
				window.visible = false;
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
		public static function messageBox(message:String, title:String = "提示", repeatCount:int = 2, delay:int = 1000):void
		{
			mx.controls.Alert.show(message,title);
		}
		
		/**
		 * 删除上一个弹出窗口
		 * 
		 * @param SID:String 弹出窗口对象ID
		 * @param UIObj:UICompontent 弹出窗口当前所在页面
		 */
		public static function beforeDeletingTheWindow(SID:String,UIObj:UIComponent):void
		{	
			_deletingTheWindow(SID,UIObj,true);
		}
		
		/**
		 * 删除指定弹出窗口
		 * 
		 * @param SID:String 弹出窗口对象ID
		 * @param UIObj:UICompontent 弹出窗口当前所在页面
		 */
		public static function deletingTheWindow(SID:String,UIObj:UIComponent):void
		{	
			_deletingTheWindow(SID,UIObj,false);
		}
		
		
		private static function _deletingTheWindow(SID:String,UIObj:UIComponent,falg:Boolean):void
		{
			//Save SID
			var SID_Arr:Array = [];
			
			//Query SID
			var systemManager:ISystemManager=UIObj.systemManager;
			var ichildList:IChildList = systemManager.rawChildren;
			for (var i:int=0; i < ichildList.numChildren; i++)
			{
				var obj:Object = ichildList.getChildAt(i);			
				
				try
				{
					if(obj.id == SID)
					{
						SID_Arr.push(i); 
					}
				}
				catch(e:*){trace(e)}					
			}
			
			if(falg)
			{
				if(SID_Arr.length <= 1) return;
				
				//Remove
				SID_Arr.pop();
			}
			else
			{
				if(SID_Arr.length <= 0) return;
			}
			
			for(var j:int=0; j < SID_Arr.length; j++)
			{
				PopUpUtil.removeWindow(ichildList.getChildAt(SID_Arr[j]) as IFlexDisplayObject);
			}
		}
		
	}
}