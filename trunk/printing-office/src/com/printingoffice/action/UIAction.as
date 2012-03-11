package com.printingoffice.action
{
	import mx.core.IMXMLObject;
	import mx.core.IVisualElement;


	/**
	 * <p>
	 *     <b>HUBO 2012-3-8  /  hubo.0508ⓐgmail.com</br>com.printingoffice.action.ViewAction.as</b>
	 * </p>
	 */
	public class UIAction implements IMXMLObject
	{
		private var _id:String;
		private var _document:Object;
		
		public var UI:IVisualElement;

		public function UIAction()
		{

		}

		public function initialized(document:Object, id:String):void
		{
			this._id=id;
			this._document=document;
		}

		public function get document():Object
		{
			return _document;
		}

		public function set document(value:Object):void
		{
			_document=value;
		}

		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id=value;
		}
	}
}