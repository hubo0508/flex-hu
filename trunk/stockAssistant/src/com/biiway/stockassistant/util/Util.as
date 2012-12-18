package com.biiway.stockassistant.util
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.core.FlexSprite;
	import mx.core.IChildList;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IUIComponent;
	import mx.core.IVisualElement;
	import mx.core.UIComponent;
	import mx.core.Window;
	import mx.events.Request;
	import mx.managers.ISystemManager;
	import mx.managers.PopUpManager;
	import mx.managers.SystemManagerGlobals;
	
	import spark.components.Application;
	import spark.components.BorderContainer;
	import spark.components.SkinnableContainer;
	import spark.filters.DropShadowFilter;
	
	/**
	 * @auth HUBO
	 */
	public class Util extends EventDispatcher
	{
		
		public function Util()
		{
		}
		
		/**
		 * 删除目标弹出窗口
		 * 
		 * @see SID:String 显示对象的ID值
		 * @See parent:DisplayObject 父窗口
		 */
		public static function deleteTargetPopUpWindow(SID:String,parent:DisplayObject):void
		{				
			var SID_Arr:Array = [];
			
			var systemManager:ISystemManager=(parent as UIComponent).systemManager;
			var ichildList:IChildList = systemManager.rawChildren;
			const num:int=ichildList.numChildren;
			for (var i:int=0; i<num; i++)
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
			
			if(SID_Arr.length <= 1) return;
			
			SID_Arr.pop();
			const num2:int = SID_Arr.length;
			for(var j:int=0; j < num2; j++)
			{
				PopUpManager.removePopUp(ichildList.getChildAt(SID_Arr[j]) as IFlexDisplayObject);
			}
		}
		
		/**
		 * 删除此组件的所有弹出窗口
		 * 
		 * @See parent:DisplayObject 父窗口
		 */
		public static function removeAllWindow(parent:DisplayObject):void
		{
			var systemManager:ISystemManager=(parent as UIComponent).systemManager;
			
			var ichildList:IChildList=systemManager.rawChildren;
			const num:int = ichildList.numChildren;
			for (var i:int=0; i < num; i++)
			{
				var obj:Object=ichildList.getChildAt(i);
				trace(i+" content = " + obj);
				if (obj == "mouseCatcher" || obj == "cursorHolder" || obj is Alert || obj == "modalWindow" || obj is Application)
				{
				}
				else
				{	
					PopUpManager.removePopUp(obj as IFlexDisplayObject);
				}
			}
		}
		
		/**
		 * 取得相同ID的目标显示对象
		 * 
		 * @see SID:String 显示对象的ID值
		 * @See parent:DisplayObject 父窗口
		 */
		public static function getTargetDisplayObject(SID:String, parent:DisplayObject):DisplayObject
		{
			var systemManager:ISystemManager=(parent as UIComponent).systemManager;
			var ichildList:IChildList = systemManager.rawChildren;
			
			const num:int = ichildList.numChildren;
			for (var i:int=0; i<num; i++)
			{
				var obj:DisplayObject = ichildList.getChildAt(i);			
				if(getID(obj) == SID)
				{
					return obj;
				}
			}
			
			return null;
		}
		
		/**
		 * 扩展mx.managers.PopUpManager.addPopUp，使用方法不变。
		 * 
		 * @see mx.managers.PopUpManager.addPopUp()
		 */
		public static function addPopUp(window:IFlexDisplayObject,
										parent:DisplayObject,
										modal:Boolean = false,
										childList:String = null,
										moduleFactory:IFlexModuleFactory = null):void
		{
			
			PopUpManager.addPopUp(window, parent, false, childList, moduleFactory);
			
			if(!modal)return;
			
			var sm:ISystemManager = getTopLevelSystemManager(parent);
			var children:IChildList;
			
			if (!sm)
			{
				// check if parent is our sandbox root
				sm = ISystemManager(SystemManagerGlobals.topLevelSystemManagers[0]);
				if (sm.getSandboxRoot() != parent)
				{
					//trace("error: popup root was not SystemManager");
					return; // and maybe a nice error message
				}
			}
			children = sm;
			var smp:ISystemManager = sm;
			
			if (modal)
			{
				createModalWindow(parent, window, children, smp, smp.getSandboxRoot());
			}
		}
		
		
		private static function getTopLevelSystemManager(parent:DisplayObject):ISystemManager
		{
			var localRoot:DisplayObjectContainer;
			var sm:ISystemManager;
			
			//			if (hasEventListener("topLevelSystemManager"))
			//			{
			//				var request:Request = new Request("topLevelSystemManager", false, true);
			//				request.value = parent;
			//				if (!dispatchEvent(request))
			//					localRoot = request.value as DisplayObjectContainer;
			//			}
			if (!localRoot)
				localRoot = DisplayObjectContainer(parent.root);
			
			// If the parent isn't rooted yet,
			// Or the root is the stage (which is the case in a second AIR window)
			// use the global system manager instance.
			if ((!localRoot || localRoot is Stage) && parent is IUIComponent)
				localRoot = DisplayObjectContainer(IUIComponent(parent).systemManager);
			if (localRoot is ISystemManager)
			{
				sm = ISystemManager(localRoot);
				if (!sm.isTopLevel())
					sm = sm.topLevelSystemManager;
			}
			
			return sm;
		}
		
		private static function createModalWindow(parentReference:DisplayObject,
								   window:IFlexDisplayObject,	  
								   childrenList:IChildList,
								   sm:ISystemManager,
								   sbRoot:DisplayObject):void
		{
			
			var modalWindow:Sprite = new FlexSprite();
			modalWindow.name = "modalWindow";
			
			childrenList.addChildAt(modalWindow,childrenList.getChildIndex(DisplayObject(window)));
				
			modalWindow.alpha = 0.15;
			modalWindow.tabEnabled = false;
			
			const screen:Rectangle = sm.screen;
			const g:Graphics = modalWindow.graphics;
			
			var c:Number = 0x000000;
			var gap:Number = Const.GAP_SHADOW * 2;
			
			g.clear();
			g.beginFill(c, 0.15);
			g.drawRect(screen.x + Const.GAP_SHADOW, screen.y + Const.GAP_SHADOW, screen.width - gap, screen.height - gap);
			g.endFill();
			
			window.addEventListener(Event.REMOVED_FROM_STAGE,windownRemovedHandler,false,0,true);
		}
		
		protected static function windownRemovedHandler(event:Event):void
		{
			var window:DisplayObject = event.currentTarget as DisplayObject;
			var sm:ISystemManager = getTopLevelSystemManager(window);
			
			if (!sm)
			{
				// check if parent is our sandbox root
				sm = ISystemManager(SystemManagerGlobals.topLevelSystemManagers[0]);
				if (sm.getSandboxRoot() != window)
				{
					//trace("error: popup root was not SystemManager");
					return; 
				}
			}
			
			window.removeEventListener(Event.REMOVED_FROM_STAGE,windownRemovedHandler);
			
			sm.removeChildAt(sm.getChildIndex(window)-1);
		}
		
		/**
		 * 
		 */
		public static function setContainerVisible(value:Boolean,scroller:IVisualElement):void
		{
			if(scroller.visible != value)
			{
				scroller.visible = value;
			}
		}
		
		/**
		 * 取得次组件的绝对坐标
		 * 
		 * @param ui:UIComponent 此组件
		 */
		public static function getUiAbsolutePosition(ui:UIComponent):Point
		{
			var point:Point=new Point();
			point.x=ui.x;
			point.y=ui.y;
			var temp:DisplayObject=ui;
			do
			{
				var parent:DisplayObject=temp.parent;
				if(parent == null || parent is Application)
				{
					break;	
				}
				point.x+=parent.x;
				point.y+=parent.y;
				temp=parent;
				
			} while (true)
			
			return point;
		}

		/**
		 * 画背景
		 */
		public static function drawBackgroup(color:uint, g:Graphics, w:Number, h:Number,alpha:Number=1):void
		{
			if (color != 0)
			{
				g.beginFill(color, alpha);
				g.drawRect(0, 0, w, h);
				g.endFill();
			}
		}
		
		
		
		/**
		 * 检查字符串是否为 <code>null</code> 或空字符串 <code>""</code>。
		 *
		 * <pre>
		 *
		 *    StringUtil.isEmpty(null)      = true
		 *    StringUtil.isEmpty(&quot;&quot;)        = true
		 *    StringUtil.isEmpty(&quot; &quot;)       = false
		 *    StringUtil.isEmpty(&quot;bob&quot;)     = false
		 *    StringUtil.isEmpty(&quot;  bob  &quot;) = false
		 *
		 * </pre>
		 *
		 * @param str
		 *            要检查的字符串
		 *
		 * @return 如果为空, 则返回 <code>true</code>
		 */
		public static function isEmpty(str:Object):Boolean
		{
			if (str == null || str == "")
			{
				return true;
			}
			
			return false;
		}
		
		/**
		 * 检查字符串是否不是 <code>null</code> 和空字符串 <code>""</code>。
		 *
		 * @param str
		 *            要检查的字符串
		 *
		 * @return 如果不为空, 则返回 <code>true</code>
		 *
		 * @see com.biiway.util.StringUtils#isEmpty(String)
		 */
		public static function isNotEmpty(str:Object):Boolean
		{
			if (str == null || str == "")
			{
				return false;
			}
			
			return true;
		}
		
		/**
		 * 清除字符串左侧空格
		 */
		public static function LTrim(s:String):String
		{
			var i:Number=0;
			while (s.charCodeAt(i) == 32 || s.charCodeAt(i) == 13 || s.charCodeAt(i) == 10 || s.charCodeAt(i) == 9)
			{
				i++;
			}
			return s.substring(i, s.length);
		}
		
		/**
		 * 清除字符串右侧空格
		 */
		public static function RTrim(s:String):String
		{
			var i:Number=s.length - 1;
			while (s.charCodeAt(i) == 32 || s.charCodeAt(i) == 13 || s.charCodeAt(i) == 10 || s.charCodeAt(i) == 9)
			{
				i--;
			}
			return s.substring(0, i + 1);
		}
		
		/**
		 * 清除字串左右的空格
		 */
		public static function trim(s:String):String
		{
			return LTrim(RTrim(s));
		}
		
		
		public static function getID(obj:Object):String
		{
			var id:String = "";
			
			try
			{
				id = obj.id.toString();	
			}catch(e:*){
				trace("  :: UIUtil ::  "+e);
			}
			
			return id;
		}

		
		public static function getName(obj:Object):String
		{
			var name:String = "";
			
			try
			{
				name = obj.name.toString();	
			}catch(e:*){
				trace("  :: UIUtil ::  "+e);
			}
			
			return name;
		}

		public static function getApplication(currentUI:UIComponent):DisplayObject
		{
			return currentUI.parentApplication as DisplayObject == null ? currentUI as DisplayObject : currentUI.parentApplication as DisplayObject;
		}
		
		
		
	}
}