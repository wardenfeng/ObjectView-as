package me.feng.objectView.view
{
	import com.bit101.components.CheckBox;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	import me.feng.objectView.events.ObjectViewEvent;
	import me.feng.objectView.iview.IObjectAttributeView;
	import me.feng.objectView.viewInfo.AttributeViewInfo;

	/**
	 * Boolean类型界面
	 * @author feng 2016-3-23
	 */
	public class BooleanAttrView extends Sprite implements IObjectAttributeView
	{
		private var _space:Object;
		private var _attributeName:String;
		private var _attributeType:String;

		private var label:TextField;
		private var checkBox:CheckBox;

		public function BooleanAttrView(attributeViewInfo:AttributeViewInfo)
		{
			_space = attributeViewInfo.owner;
			_attributeName = attributeViewInfo.name;
			_attributeType = attributeViewInfo.type;

			label = new TextField();
			//			label.height = 50;
			label.width = 100;
			label.height = 20;
			addChild(label);

			checkBox = new CheckBox();
			checkBox.x = 100;
			checkBox.y = 5;
			checkBox.addEventListener(Event.CHANGE, onChange);
			addChild(checkBox);

			graphics.beginFill(0x999999);
			graphics.drawRect(0, 0, 200, 24);

			label.text = _attributeName;

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

		private function updateView():void
		{
			checkBox.selected = attributeValue;
		}

		protected function onChange(event:Event):void
		{
			attributeValue = checkBox.selected;
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
	}
}
