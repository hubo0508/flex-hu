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
	import flash.utils.ByteArray;
	
	import mx.validators.ValidationResult;
	import mx.validators.Validator;

	/**
	 * 扩展<code>mx.validators.Validator</code>验证基类，重写doValidation函数。
	 *
	 * <p>doValidation内部实现采用正则表达式的方式来验证。</p>
	 *
	 * author： HUBO hubo.0508ⓐgmail.com
	 */
	public class RegexpValidator extends mx.validators.Validator
	{
		public function RegexpValidator()
		{
			super();
		}

		private var results:Array;

		/**
		 * 重写父类验证规则，采用正则表达式来验证
		 *
		 * @param value 文本框输入值
		 * @return
		 *
		 */
		override protected function doValidation(value:Object):Array
		{
			results=[];
			results=super.doValidation(value);

			if (!value)
			{
				return results;
			}

			var textinput:RegexpValidatorInput=super.source as RegexpValidatorInput;
			var regexp:RegExp=this.getRegexp(textinput);		

			//validator
			var validatorFlag:Boolean=true;
			if (!value || !regexp)
			{
				validatorFlag=false;
			}

			//正则表达式验证
			if (!regexp.test(value + ""))
			{
				validatorFlag=false;
			}

			if (!validatorFlag)
			{
				results.push(new ValidationResult(true, "text", "StringTooLong", textinput.errorMessage));
			}

			return results;
		}

		/**
		 * @author HUBO hubo.0508@gmail.com
		 */
		private function getCharLength(txt:String):int
		{
			var byte:ByteArray=new ByteArray();
			byte.writeMultiByte(txt, "gb2312");
			byte.position=0;
			return byte.bytesAvailable;

		}

		private function getRegexp(textinput:RegexpValidatorInput):RegExp
		{
			var regexpObj:Object=textinput.regexp;
			
			var regexp:RegExp=regexpObj as RegExp;
			if (!regexp)
			{
				regexp=new RegExp(regexpObj);
			}
			
			return regexp;
		}
	}
}