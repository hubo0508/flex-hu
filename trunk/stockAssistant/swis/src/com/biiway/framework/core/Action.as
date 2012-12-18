package com.biiway.framework.core
{
	import mx.core.IMXMLObject;
	
	public class Action implements IMXMLObject
	{
		public function Action()
		{
		}
		
		private var _id:String;
		private var _document:Object;
		
		public var eventType:String;
		
		public function initialized(document:Object, id:String):void
		{
			this._id = id;
			this._document = document;
		}
		
		public function get document():Object
		{
			return _document;
		}

		public function set document(value:Object):void
		{
			_document = value;
		}

		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
		}

		
	}
}