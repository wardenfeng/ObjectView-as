package me.feng.objectView.iview
{
	import flash.events.IEventDispatcher;

	/**
	 * 对象界面基础接口
	 * @author feng 2016-4-20
	 */
	public interface IObjectViewBase extends IEventDispatcher
	{
		/**
		 * 界面所属对象（空间）
		 */
		function get space():Object;
		function set space(value:Object):void;

		/**
		 * 更新界面
		 */
		function updateView():void;
	}
}
