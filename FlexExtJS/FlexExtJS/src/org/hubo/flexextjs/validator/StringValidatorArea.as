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
package org.hubo.flexextjs.validator
{
	
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	import mx.events.ValidationResultEvent;
	import mx.validators.StringValidator;
	
	import org.hubo.flexextjs.event.RegexpValidatorEvent;
	
	import spark.components.TextArea;
	
	[Event(name="validatorChange",type="org.hubo.flexextjs.event.RegexpValidatorEvent")]
	
	/**
	 * 扩展<code>spark.components.TextArea</code>类，加入验证规则。
	 *  
	 * author： HUBO hubo.0508ⓐgmail.com
	 * 
	 */	
	public class StringValidatorArea extends TextArea
	{		
		private var validator:StringValidator=new StringValidator();
		private var validatorResult:ValidationResultEvent;
		
		private var _maxLength:int;
		
		private var _minLength:int;
		
		private var _tooLongError:String;
		  
		private var _tooShortError:String;
		
		private var _errorMessage:String= "";
		
		private var _validatorEvent:Boolean = true;
		
		private var _validatorFlag:Boolean=false;
		
		/**返回数字的字符串表示形式（采用定点表示法）*/
		private var _toFixed:int  = 2;
		
		/**是否起用字符串表示形式（采用定点表示法）计算方法，默认值为false，不起动*/
		private var _isToFixed:Boolean = false;		
		
		/**
		 * 构造函数 
		 */	
		public function StringValidatorArea()
		{
			super();
			
			this.addEventListener("change", this.validateHandler,false,0,true);
			this.validator.source=this;
			this.validator.property="text";
			this.validator.required=true;
			this.validator.requiredFieldError = "字段不能为空！";			

			this.addEventListener(FlexEvent.CREATION_COMPLETE, creationComplete, false, 0, true);
			
			this.validator.validate();
		}
		
		public function creationComplete(event:Event):void
		{
			this.validator.maxLength=this.maxLength;
			this.validator.minLength=this.minLength;
			this.validator.tooLongError = this.errorMessage;
			this.validator.tooShortError = this.errorMessage;
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
		 * @author HUBO hubo.0508@gmail.com
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
			{
				if (super.text) this.errorString=validatorResult.message; 
				
				this.validatorFlag=false;
			}
			
			if(validatorEvent) this.createAndDispatchEvent();
		}
		
		/**
		 * 派发验证标识事件
		 * @author HUBO hubo.0508@gmail.com
		 */
		private function createAndDispatchEvent():void
		{
			var regexpEvent:RegexpValidatorEvent = new RegexpValidatorEvent(RegexpValidatorEvent.REGEXP_EVENT);
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
		
		
		/**字符串的长度长于 maxLength 属性时的错误消息。*/
		public function get tooLongError():String
		{
			return _tooLongError;
		}
		
		/**字符串的长度长于 maxLength 属性时的错误消息。*/
		public function set tooLongError(value:String):void
		{
			_tooLongError = value;
			
			this.validator.tooLongError = _tooLongError;
		}
		
		/**字符串的长度短于 minLength 属性时的错误消息。*/
		public function get tooShortError():String
		{
			return _tooShortError;
		}
		
		/**字符串的长度短于 minLength 属性时的错误消息。*/
		public function set tooShortError(value:String):void
		{
			_tooShortError = value;
			
			this.validator.tooShortError = _tooShortError;
		}
		
		/**
		 * 返回数字的字符串表示形式（采用定点表示法）。
		 * 定点表示法是指字符串的小数点后面包含特定的位数（在 fractionDigits 参数中指定）。
		 * fractionDigits 参数的有效范围为 0 到 20。如果指定的值在此范围外，则会引发异常。 
		 * 
		 * <p>
		 * 默认值为2
		 * </p>
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
		
		
		/**最小输入字符输入长度(中文算一个字符)*/
		public function get minLength():int
		{
			return _minLength;
		}
		
		/**
		 * @private
		 */
		public function set minLength(value:int):void
		{
			_minLength = value;
		}
		/**最大输入字符输入长度(中文算一个字符)*/
		public function get maxLength():int
		{
			return _maxLength;
		}
		
		/**
		 * @private
		 */
		public function set maxLength(value:int):void
		{
			_maxLength = value;
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

	}
}