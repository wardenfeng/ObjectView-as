package me.feng.objectView.view
{
	import flash.text.TextField;

	import me.feng.objectView.iview.IObjectView;
	import me.feng.objectView.viewInfo.ObjectViewInfo;

	/**
	 * 默认基础对象界面
	 * @author feng 2016-3-11
	 */
	public class DefaultBaseObjectView extends TextField implements IObjectView
	{
		private var _space:Object;

		public function DefaultBaseObjectView()
		{
			super();
		}

		public function init(objectViewInfo:ObjectViewInfo):void
		{
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

		/**
		 * 更新界面
		 */
		private function updateView():void
		{
			text = String(_space);
		}
	}
}