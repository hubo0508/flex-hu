package org.hubo.flexextjs.validator
{
	import flash.display.DisplayObject;
	
	import mx.containers.Form;
	import mx.controls.Alert;
	import mx.core.Container;
	import mx.core.UIComponent;
	
	import org.hubo.flexextjs.event.RegexpValidatorEvent;
	
	import spark.components.Button;
	import spark.components.SkinnableContainer;
	import spark.components.TextArea;
	import spark.components.TextInput;
	import spark.components.supportClasses.GroupBase;

	
	/**
	 * 
	 * 验证通用工具类
	 * 
	 * <p>
	 * <code>RegexpValidatorArea</code>、<code>RegexpValidatorInput</code>、<code>StringValidatorArea</code>、<code>StringValidatorInput</code>
	 * 以下简称 [验证组件]
	 * </p>
	 * 
	 * <p>
	 * <code>spark.components.supportClasses.GroupBase</code>或<code>mx.core.Container</code>、子容器(承继类)
	 * 以下简称[指定容器]
	 * </p>
	 * 
	 * @author HUBO
	 * 
	 */
	public class ValidatorUtils
	{

		/**
		 * 构造函数
		 */
		public function ValidatorUtils()
		{
		}
		
		/**验证事件标识符*/
		private static const VALIDATOR_EVENT:String="validatorEvent";
		
		/**手动验证标识符*/
		private static const MANUAL_VALIDATOR:String="manualValidator";
		
		/**回调函数*/
		private static var validatorEventCall:Function;
		
		/**************************************************************************************************/
		/**添加监听事件*/
		/**************************************************************************************************/
		
		/**
		 * 在[指定容器]中，对需要要添加验证验事件的文本输入框添加监听回调函数。
		 *
		 *
		 * @param source 父容器
		 * @param validatorFun 回调函数
		 *
		 * author： HUBO hubo.0508ⓐgmail.com
		 */
		public static function addValidatorEvent(source:UIComponent, validatorFun:Function):void
		{
			validatorEventCall=validatorFun;
			
			validateAll(source, null, VALIDATOR_EVENT);
			
			//validatorEventCall = null;
		}
		
		/**************************************************************************************************/
		/**手动验证*/
		/**************************************************************************************************/
		
		/**
		 * 手动验证
		 *
		 * <p>
		 * 手动验证[指定容器]内的[验证组件]，该[验证组件]只能在[指定容器]容器中才能被检测到，请将[验证组件]添加到[指定容器]中。
		 * </p>
		 *
		 * <p>
		 * 只要将[验证组件]添加到[指定容器]中，调用该函数就可手动的进行验证。
		 * </p>
		 *
		 * <p>
		 * 如果[验证组件]未在指定的容器中，调用该方法无效。
		 * </p>
		 *
		 * @param source 父容器([指定容器])
		 *
		 * @see spark.components.supportClasses.GroupBase
		 * @see mx.core.Container
		 * @see RegexpValidatorArea
		 * @see RegexpValidatorInput
		 * @see StringValidatorArea
		 * @see StringValidatorInput
		 *
		 * author： HUBO hubo.0508ⓐgmail.com
		 */
		public static function manualValidateAll(source:UIComponent):void
		{
			validateAll(source, null, MANUAL_VALIDATOR);
		}
		
		/**************************************************************************************************/
		/**取得验证后的验证标识*/
		/**************************************************************************************************/
		
		/**
		 * 判断[指定容器]或数组中的[验证组件]是否验证通过
		 *
		 * @example 在该代码中id为[验证组件]ID字符串、group:指容器的子容器、button：页面保存按钮，当转入button后，验证失败后该button状态为不可编辑。
		 * 可以不传入button，那么请将自己处理button的状态。
		 * <listing version="3.0">
		 * 	var id:String = "stringInput";
		 * 	var group:Group = this.from_group;
		 * 	var button:Button =  this.doSelectedOk;
		 * 	ValidatorUtils.validateAllByID(id,group,button);
		 * </listing>
		 *
		 * @example 在该代码中id为[验证组件]对象、group:指容器的子容器、button：页面保存按钮，当转入button后，验证失败后该button状态为不可编辑。
		 * 可以不传入button，那么请将自己处理button的状态。
		 * <listing version="3.0">
		 * 	var stringInput:StringValidatorInput = stringInput;
		 * 	var group:Group = this.from_group;
		 * 	var button:Button =  this.doSelectedOk;
		 * 	ValidatorUtils.validateAllByID(stringInput,group,button);
		 * </listing>
		 *
		 * @example 在该代码中ids为[验证组件]ID(字符串)以数据组的形式保存、group:指容器的子容器、button：页面保存按钮，当转入button后，验证失败后该button状态为不可编辑。可以不传入button，那么请将自己处理button的状态。
		 * <listing version="3.0">
		 * 	var ids:Array = ["stringInput","stringInput2","stringInput3"];
		 * 	var group:Group = this.from_group;
		 * 	var button:Button =  this.doSelectedOk;
		 * 	ValidatorUtils.validateAllByID(stringInput,group,button);
		 * </listing>
		 *
		 *  @example 在该代码中ids为[验证组件]ID(字符串)以数据组的形式保存、group:指容器的子容器、button：页面保存按钮，当转入button后，验证失败后该button状态为不可编辑。
		 * 可以不传入button，那么请将自己处理button的状态。
		 * <listing version="3.0">
		 * 	var ids:Array = ["stringInput","stringInput2","stringInput3"];
		 * 	var group:Group = this.from_group;
		 * 	var button:Button =  this.doSelectedOk;
		 * 	ValidatorUtils.validateAllByID(stringInput,group,button);
		 * </listing>
		 *
		 * @example 在该代码中ids为[验证组件]ID(字符串)以数据组的形式保存、group:指容器的子容器。
		 * <listing version="3.0">
		 * 	var ids:Array = ["stringInput","stringInput2","stringInput3"];
		 * 	var group:Group = this.from_group;
		 * 	var validatorFlag:Boolean = ValidatorUtils.validateAllByID(stringInput,group);
		 * //根据返回状态手动处理业务
		 * </listing>
		 *
		 *
		 *
		 * @param id id可以是某个[验证组件]的ID(字符串格式)、某个[验证组件]对象、数组形存储的[验证组件]ID(字符串形式，如var ids:Array = ["id1","id2"])。
		 * @param parent 父容器([指定容器])。
		 * @param saveBtn 要进行业务处理的按钮对象，比如页面的保存按钮。
		 * @param type 标识符，工具类内部使用。
		 * @return true：验证无误；false：验证失败。
		 *
		 * author： HUBO hubo.0508ⓐgmail.com
		 */
		public static function validateAllByID(id:Object, parent:Object, saveBtn:Button=null, type:String=""):Boolean
		{
			var allflag:Boolean=true;
			
			if (parent || id)
			{
				if (id is Array)
				{
					var ids:Array=id as Array;
					for (var i:int=0; i < ids.length; i++)
					{
						allflag=handleValidator(parent[ids[i]], type);
						if (!allflag && type != MANUAL_VALIDATOR)
						{
							return allflag;
						}
					}
				}
				else if (id is String)
				{
					allflag=handleValidator(parent[id], type);
					if (!allflag) return allflag;
				}
				else if (id is TextInput)
				{
					try
					{
						if (type == MANUAL_VALIDATOR)
						{
							id.manualValidate();
						}
						else
						{
							allflag=id.validatorFlag;
						}
					}
					catch (error:Error)
					{
					}
					
					if (!allflag)return allflag;
					
				}
			}
			
			if (saveBtn)
			{
				setButtonEnabled(allflag, saveBtn);
			}
			
			return allflag;
		}
		
		/**
		 * 判断[指定容器]或数组中的[验证组件]是否验证通过
		 *
		 * <p>
		 * 将指定窗口做为参数传递到函数中，该函数通过递归来验证指定窗口中的[验证组件]，如果容器中有一个[验证组件]验证不通过，返回false；
		 * 当所有[指定容器]中的所有[验证组件]验证通过后，返回true;
		 * </p>
		 *
		 * @example group:指容器的子容器、button：页面某个保存按钮。当转入button后，验证失败后该button状态为不可编辑。
		 * <listing version="3.0">
		 * 	var group:Group = this.from_group;
		 *  var button:Button =  this.doSelectedOk;
		 * 	ValidatorUtils.validateAll(group,button);
		 * </listing>
		 *
		 * @example group:指容器的子容器。
		 * <listing version="3.0">
		 * 	var group:Group = this.from_group;
		 * 	var validatorFlag:Boolean = ValidatorUtils.validateAll(group);
		 * //根据返回状态手动处理业务
		 * </listing>
		 *
		 * @param parent 父容器([指定容器])。
		 * @param saveBtn 要进行业务处理的按钮对象，比如页面的保存按钮。
		 * @param type 标识符，工具类内部使用。
		 * @return true：验证无误；false：验证失败。
		 *
		 * author： HUBO hubo.0508ⓐgmail.com
		 */
		public static function validateAll(source:UIComponent, saveBtn:Button=null, type:String=""):Boolean
		{
			var allflag:Boolean=true;
			
			if (source is TextInput)
			{
				allflag=handleValidator(source, type);
			}
			else
			{
				if (source is GroupBase || source is Container || source is SkinnableContainer)
				{
					allflag=handlingChild(source, type);
				}
			}
			
			childFlag=true;
			
			if (saveBtn) setButtonEnabled(allflag, saveBtn);
			
			return allflag;
		}
		
		/**
		 * 设置按钮的状态
		 * 
		 * @author HUBO hubo.0508@gmail.com
		 */
		private static function setButtonEnabled(enabled:Boolean, saveBtn:Button):void
		{
			if (enabled && !saveBtn.enabled)
			{
				saveBtn.enabled=enabled;
			}
			else if (!enabled && saveBtn.enabled)
			{
				saveBtn.enabled=enabled;
			}
		}
		
		/**
		 * @author HUBO hubo.0508@gmail.com
		 */
		private static var childFlag:Boolean=true;
		
		private static function handlingChild(source:UIComponent, type:String=""):Boolean
		{
			var numEle:int=source.numChildren;
			for (var i:int=0; i < numEle; i++)
			{
				if (!childFlag)
				{
					break;
				}
				else
				{
					var obj:Object=source.getChildAt(i);
					if (obj is GroupBase || obj is Container || obj is SkinnableContainer)
					{
						handlingChild(obj as UIComponent, type);
					}
					else if (obj is TextInput || obj is TextArea)
					{
						if (type == MANUAL_VALIDATOR || type == VALIDATOR_EVENT)
						{
							handleValidator(obj, type);
						}
						else
						{
							childFlag=handleValidator(obj);
						}
					}
				}
			}
			return childFlag;
		}
		
		/**
		 * @author HUBO hubo.0508@gmail.com
		 */
		private static function handleValidator(source:Object, type:String=""):Boolean
		{
			try 
			{
//				if((source.text+"") == "007"){
//					var x:String = "xx";
//					trace(source.text+"|");
//				}				
				
				if (type == VALIDATOR_EVENT)
				{
					source.addEventListener(RegexpValidatorEvent.REGEXP_EVENT, function(event:RegexpValidatorEvent):void
					{
						validatorEventCall.call();
					});
				}
				
				if (type == MANUAL_VALIDATOR) {
					source.manualValidate();
				}
				
				if (type == "") {
					return source.validatorFlag;
				}
				
			}
			catch (error:Error)
			{
				//validatorEventCall=null;
			}
			
			return true;
		}
		
	}
}