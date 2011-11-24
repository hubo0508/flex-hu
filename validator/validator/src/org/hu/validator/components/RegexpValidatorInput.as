////////////////////////////////////////////////////////////////////////////////
//
//  转载或使用该源码请尊重作者的劳动成果
//  Copyright 2010
//
//  QQ:     657261109
//  TEL：        158 280 190 62	
//  E-Mail：hubo.0508@gmail.com
//  MSN：        hubo.0508@msn.cn
//
////////////////////////////////////////////////////////////////////////////////
package org.hu.validator.components
{
	
	import flash.events.Event;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.events.ValidationResultEvent;
	 
	import org.hu.validator.event.ValidatorEvent;
	
	import spark.components.TextInput;
	
	[Event(name="validatorChange",type="com.hubo.event.ValidatorEvent")]

	/**
	 * 根据正则表则式对文本输入框进行验证
	 * 
	 * <p>
	 * 	扩展<code>spark.components.TextInput</code>类
	 * </p>
	 * 
	 * author： HUBO hubo.0508ⓐgmail.com
	 */
	public class RegexpValidatorInput extends TextInput
	{
		private var validator:RegexpValidator=new RegexpValidator();
		private var validatorResult:ValidationResultEvent;

		/**正则表达式*/
		private var _regexp:Object;

		/**验证标识*/
		private var _validatorFlag:Boolean=false;

		/**错误提示信息*/
		private var _errorMessage:String="";
		
		/**验证事件*/
		private var _validatorEvent:Boolean = true;

		/**返回数字的字符串表示形式（采用定点表示法）*/
		private var _toFixed:int  = 2;
		
		/**是否起用字符串表示形式（采用定点表示法）计算方法，默认值为false，不起动*/
		private var _isToFixed:Boolean = false;			
		
		/**
		 * 构造函数　
		 */
		public function RegexpValidatorInput()
		{
			super();
			this.addEventListener("change", this.validateHandler,false,0,true);
			this.validator.source=this;
			this.validator.property="text";
			this.validator.required=true;
		}
		
		/**
		 * 重定父类的text函数
		 * 
		 * <p>
		 * 当isToFixed=false时，该函数不进行任何处理
		 * </p> 
		 * 
		 * <p>
		 * 当isToFixed=true时，是否为Number类型或int类型，是则采用定点表示法来计算该值，该值的小数长度参照<code>toFixed</code>属性
		 * </p>
		 * 
		 * 
		 * @param value 用户输入值
		 * 
		 * @author： HUBO hubo.0508ⓐgmail.com
		 */	
		override public function set text(value:String):void
		{
			if(value && isToFixed)
			{				
				var objValue:Number = Number(value);
				
				if(objValue.toString() == 'NaN')
				{
					super.text = value;
				}
				else
				{
					super.text = objValue.toFixed(toFixed);
				}
			}
			else
			{
				super.text = value;
			}
		}
		
		override public function initialize():void
		{
			super.initialize();
			this.validateHandler();
		}
		
		/**
		 * 手动验证
		 * @author HUBO hubo.0508@gmail.com
		 */
		public function manualValidate():void
		{
			this.validateHandler();
		}

		/**
		 * @Title: validate
		 * @date 2011-1-15 PM12:41:52
		 * @author HUBO hubo.0508@gmail.com
		 * @Description: TODO void
		 * @throws
		 * 
		 * @author： HUBO hubo.0508ⓐgmail.com
		 */
		private function validateHandler(event:Event = null):void
		{
			validatorResult=validator.validate();
			if (validatorResult.type == ValidationResultEvent.VALID)
			{
				this.errorString="";
				this.validatorFlag=true;
			}
			else
			//if(validatorResult.type == ValidationResultEvent.VALID)
			{
				if (super.text)
				{
					this.errorString=validatorResult.message;
				}
				this.validatorFlag=false;
			}
			
			if(validatorEvent)
			{
				this.createAndDispatchEvent();
			}			
		}
		
		/**
		 * 派发验证标识事件
		 * 
		 * @author： HUBO hubo.0508ⓐgmail.com
		 */
		private function createAndDispatchEvent():void
		{
			var regexpEvent:ValidatorEvent = new ValidatorEvent(ValidatorEvent.REGEXP_EVENT);
			regexpEvent.validatorFlag = this.validatorFlag;
			
			this.dispatchEvent(regexpEvent);
		}

		/**验证标识*/
		public function get validatorFlag():Boolean
		{
			return _validatorFlag;
		}
		
		/**
		 * @private
		 */
		public function set validatorFlag(value:Boolean):void
		{
			_validatorFlag = value;
		}	
		
		/**
		 * 返回数字的字符串表示形式（采用定点表示法）。
		 * 定点表示法是指字符串的小数点后面包含特定的位数（在 fractionDigits 参数中指定）。
		 * fractionDigits 参数的有效范围为 0 到 20。如果指定的值在此范围外，则会引发异常。 
		 * 
		 * <p>
		 * 默认值为2
		 * </p>
		 * 
		 * @author： HUBO hubo.0508ⓐgmail.com
		 */
		public function get toFixed():int
		{
			return _toFixed;
		}
		
		/**
		 * @private
		 */
		public function set toFixed(value:int):void
		{
			_toFixed = value;
		}	
		
		
		/**是否起用字符串表示形式（采用定点表示法）计算方法，默认值为false，不起动*/
		public function get isToFixed():Boolean
		{
			return _isToFixed;
		}
		
		/**
		 * @private
		 */
		public function set isToFixed(value:Boolean):void
		{
			_isToFixed = value;
		}
		
		/**验证后是否派发事件，默认值为true*/
		public function get validatorEvent():Boolean
		{
			return _validatorEvent;
		}
		
		/**
		 * @private
		 */
		public function set validatorEvent(value:Boolean):void
		{
			_validatorEvent = value;
		}
		
		/**验证失败提示信息*/
		public function get errorMessage():String
		{
			return _errorMessage;
		}
		
		/**
		 * @private
		 */
		public function set errorMessage(value:String):void
		{
			_errorMessage = value;
		}

		/**正则表达式*/
		public function get regexp():Object
		{
			return _regexp;
		}

		/**
		 * @private
		 */
		public function set regexp(value:Object):void
		{
			_regexp=value;
		}


	}
}