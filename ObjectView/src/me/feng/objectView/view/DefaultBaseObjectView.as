package me.feng.objectView.view
{
	import flash.text.TextField;

	import me.feng.objectView.iview.IObjectAttributeView;
	import me.feng.objectView.iview.IObjectBlockView;
	import me.feng.objectView.iview.IObjectView;
	import me.feng.objectView.viewInfo.ObjectViewInfo;

	/**
	 * 默认基础对象界面
	 * @author feng 2016-3-11
	 */
	public class DefaultBaseObjectView extends TextField implements IObjectView
	{
		private var _space:Object;

		public function DefaultBaseObjectView(objectViewInfo:ObjectViewInfo)
		{
			super();
			_space = objectViewInfo.owner;

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

		public function getAttributeView(attributeName:String):IObjectAttributeView
		{
			return null;
		}

		public function getblockView(blockName:String):IObjectBlockView
		{
			return null;
		}

		/**
		 * 更新界面
		 */
		private function updateView():void
		{
			text = String(_space);
		}
	}
}
