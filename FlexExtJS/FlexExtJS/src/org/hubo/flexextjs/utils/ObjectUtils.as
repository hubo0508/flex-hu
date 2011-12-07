package org.hubo.flexextjs.utils
{
	import flash.utils.ByteArray;

	import mx.core.UIComponent;

	public class ObjectUtils
	{
		public function ObjectUtils()
		{
		}

		/**
		 * 深度克隆对象
		 *
		 * @param source:Object 源目标对象
		 *
		 * @return 克隆后对象
		 */
		public static function clone(source:Object):*
		{
			var byteArray:ByteArray=new ByteArray();
			byteArray.writeObject(source);
			byteArray.position=0;
			return (byteArray.readObject());
		}

	}
}