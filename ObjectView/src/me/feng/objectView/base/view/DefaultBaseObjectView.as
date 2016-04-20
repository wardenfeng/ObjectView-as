package me.feng.objectView.base.view
{
	import flash.text.TextField;

	import me.feng.objectView.base.IObjectView;
	import me.feng.objectView.base.data.ObjectViewInfo;

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

		public function set objectViewInfo(value:ObjectViewInfo):void
		{
			_space = value.owner;

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
