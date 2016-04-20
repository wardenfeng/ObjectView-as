package me.feng.objectView.view
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;

	import me.feng.objectView.base.IObjectAttributeView;
	import me.feng.objectView.block.IObjectBlockView;
	import me.feng.objectView.block.data.BlockViewInfo;

	/**
	 * 自定义块界面
	 * @author feng 2016-3-23
	 */
	public class CustomBlockView extends Sprite implements IObjectBlockView
	{
		private var _space:Object;
		private var _blockName:String;

		private var attributeViews:Vector.<IObjectAttributeView>;

		public function init(blockViewInfo:BlockViewInfo):void
		{
			_blockName = blockViewInfo.name;
			_space = blockViewInfo.owner;

			var label:TextField
			label = new TextField();
			label.text = "自定义块界面_(blockName:" + _blockName + ")";
			label.textColor = 0xff00ff;
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

		public function get blockName():String
		{
			return _blockName;
		}

		private function updateView():void
		{

		}
	}
}
