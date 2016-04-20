package me.feng.objectView.base
{
	import me.feng.objectView.base.data.ObjectViewInfo;

	/**
	 * 对象界面接口
	 * @author feng 2016-3-11
	 */
	public interface IObjectView
	{
		/**
		 * 初始化
		 */
		function init(objectViewInfo:ObjectViewInfo):void;

		/**
		 * 界面所属对象（空间）
		 */
		function get space():Object;
		function set space(value:Object):void;
	}
}
