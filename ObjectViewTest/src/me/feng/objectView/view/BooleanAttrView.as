package me.feng.objectView.view
{
	import com.bit101.components.CheckBox;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	import me.feng.objectView.base.IObjectAttributeView;
	import me.feng.objectView.base.data.AttributeViewInfo;

	/**
	 * Boolean类型界面
	 * @author feng 2016-3-23
	 */
	public class BooleanAttrView extends Sprite implements IObjectAttributeView
	{
		private var data:AttributeViewInfo;
		private var label:TextField;
		private var checkBox:CheckBox;
		private var _owner:Object;

		public function BooleanAttrView()
		{
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
		}

		protected function onChange(event:Event):void
		{
			_owner[data.name] = checkBox.selected;
		}

		public function set objectAttributeInfo(value:AttributeViewInfo):void
		{
			data = value;
			_owner = data.owner;

			label.text = data.name;
			checkBox.selected = _owner[data.name];
		}

	}
}
