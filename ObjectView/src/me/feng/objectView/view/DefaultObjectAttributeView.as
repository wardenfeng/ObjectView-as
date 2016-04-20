package me.feng.objectView.view
{
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.utils.getDefinitionByName;

	import me.feng.objectView.iview.IObjectAttributeView;
	import me.feng.objectView.viewInfo.AttributeViewInfo;
	import me.feng.objectView.events.ObjectViewEvent;

	/**
	 * 属性值发生变化时触发
	 */
	[Event(name = "valueChange", type = "me.feng.objectView.events.ObjectViewEvent")]

	/**
	 * 默认对象属性界面
	 * @author feng 2016-3-10
	 */
	public class DefaultObjectAttributeView extends Sprite implements IObjectAttributeView
	{
		private var label:TextField;
		private var text:TextField;
		private var textTemp:String;
		private var _space:Object;
		private var _attributeName:String;
		private var _attributeType:String;

		public function init(attributeViewInfo:AttributeViewInfo):void
		{
			_space = attributeViewInfo.owner;
			_attributeName = attributeViewInfo.name;
			_attributeType = attributeViewInfo.type;

			label = new TextField();
			//			label.height = 50;
			label.width = 100;
			label.height = 20;
			addChild(label);

			text = new TextField();
			text.border = true;
			text.x = 100;
			text.height = 20;
			text.width = 100;
			text.type = TextFieldType.INPUT;
			text.addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
			text.addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
			addChild(text);
			graphics.beginFill(0x999999);
			graphics.drawRect(0, 0, 200, 24);

			if (!attributeViewInfo.isEditable())
			{
				text.type = TextFieldType.DYNAMIC;
			}

			updateView();
		}

		public function get space():Object
		{
			return _space;
		}

		public function set space(value:Object):void
		{
			_space = value;
			updateView();
		}

		public function get attributeName():String
		{
			return _attributeName;
		}

		public function get attributeValue():Object
		{
			return _space[_attributeName];
		}

		public function set attributeValue(value:Object):void
		{
			if (_space[_attributeName] != value)
			{
				_space[_attributeName] = value;

				//派发属性值修改事件
				var objectViewEvent:ObjectViewEvent = new ObjectViewEvent(ObjectViewEvent.VALUE_CHANGE, true);
				objectViewEvent.space = _space;
				objectViewEvent.attributeName = _attributeName;
				objectViewEvent.attributeValue = attributeValue;
				dispatchEvent(objectViewEvent);
			}
		}

		protected function onFocusOut(event:FocusEvent):void
		{
			if (textTemp != text.text)
			{
				var cls:Class = getDefinitionByName(_attributeType) as Class;
				attributeValue = cls(text.text);
				if (cls == Boolean && (text.text == "0" || text.text == "false"))
				{
					attributeValue = false;
				}
				updateView();
			}

			textTemp = null;
		}

		protected function onFocusIn(event:FocusEvent):void
		{
			textTemp = text.text;
		}

		/**
		 * 更新界面
		 */
		private function updateView():void
		{
			label.text = _attributeName + ":";
			text.text = String(attributeValue);
		}
	}
}
