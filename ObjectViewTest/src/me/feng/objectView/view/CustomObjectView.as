package me.feng.objectView.view
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.utils.getQualifiedClassName;

	import me.feng.objectView.iview.IObjectAttributeView;
	import me.feng.objectView.iview.IObjectBlockView;
	import me.feng.objectView.iview.IObjectView;
	import me.feng.objectView.viewInfo.ObjectViewInfo;

	/**
	 *
	 * @author feng 2016-3-23
	 */
	public class CustomObjectView extends Sprite implements IObjectView
	{
		private var _space:Object;

		public function CustomObjectView(objectViewInfo:ObjectViewInfo)
		{
			_space = objectViewInfo.owner;

			var label:TextField
			label = new TextField();
			label.text = "自定义对象界面_" + getQualifiedClassName(_space);
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

		/**
		 * 更新界面
		 */
		public function updateView():void
		{

		}

		public function getAttributeView(attributeName:String):IObjectAttributeView
		{
			return null;
		}

		public function getblockView(blockName:String):IObjectBlockView
		{
			return null;
		}
	}
}
