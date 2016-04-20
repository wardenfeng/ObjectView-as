package me.feng.objectView.view
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;

	import me.feng.objectView.events.ObjectViewEvent;
	import me.feng.objectView.iview.IObjectAttributeView;
	import me.feng.objectView.viewInfo.AttributeViewInfo;

	/**
	 * 自定义属性界面
	 * @author feng 2016-3-23
	 */
	public class CustomAttrView extends Sprite implements IObjectAttributeView
	{
		private var _space:Object;
		private var _attributeName:String;
		private var _attributeType:String;

		private var label:TextField;

		public function init(attributeViewInfo:AttributeViewInfo):void
		{
			_space = attributeViewInfo.owner;
			_attributeName = attributeViewInfo.name;
			_attributeType = attributeViewInfo.type;

			var label:TextField
			label = new TextField();
			label.text = "自定义属性界面_" + _attributeName;
			label.textColor = 0xffff00;
			label.width = 100;
			label.wordWrap = true;

			var bitmap:Bitmap = new Bitmap(new BitmapData(100, 50, false, 0));
			bitmap.bitmapData.draw(label);
			addChild(bitmap);

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

		private function updateView():void
		{

		}
	}
}
