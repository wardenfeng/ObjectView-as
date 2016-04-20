package me.feng.objectView.iview
{
	import me.feng.objectView.viewInfo.BlockViewInfo;

	/**
	 * 对象属性块界面接口
	 * @author feng 2016-3-22
	 */
	public interface IObjectBlockView
	{
		/**
		 * 设置对象属性块信息
		 * @param value
		 */
		function init(blockViewInfo:BlockViewInfo):void;

		/**
		 * 界面所属对象（空间）
		 */
		function get space():Object;
		function set space(value:Object):void;

		/**
		 * 块名称
		 */
		function get blockName():String;
	}
}
