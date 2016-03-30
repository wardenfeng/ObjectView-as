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
		public function DefaultBaseObjectView()
		{
			super();
		}

		public function set data(value:ObjectViewInfo):void
		{
			text = String(value.owner);
		}
	}
}
