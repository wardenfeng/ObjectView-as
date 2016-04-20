package me.feng.objectView.view
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;

	import me.feng.objectView.base.IObjectAttributeView;
	import me.feng.objectView.block.IObjectAttributeBlockView;
	import me.feng.objectView.block.data.BlockViewInfo;

	/**
	 * 自定义块界面
	 * @author feng 2016-3-23
	 */
	public class CustomBlockView extends Sprite implements IObjectAttributeBlockView
	{
		private var _space:Object;
		private var isInitView:Boolean;
		private var _blockViewInfo:BlockViewInfo;
		private var attributeViews:Vector.<IObjectAttributeView>;

		public function set blockViewInfo(value:BlockViewInfo):void
		{
			_blockViewInfo = value;
			_space = value.owner;
			if (!isInitView)
			{
				initView();
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

		private function initView():void
		{
			var label:TextField
			label = new TextField();
			label.text = "自定义块界面_(blockName:" + _blockViewInfo.name + ")";
			label.textColor = 0xff00ff;
			label.width = 100;
			label.wordWrap = true;

			var bitmap:Bitmap = new Bitmap(new BitmapData(100, 50, false, 0));
			bitmap.bitmapData.draw(label);
			addChild(bitmap);

			isInitView = true;
		}

		private function updateView():void
		{

		}
	}
}
