package me.feng.objectView.block
{
	import me.feng.objectView.block.data.BlockViewInfo;

	/**
	 * 对象属性块界面接口
	 * @author feng 2016-3-22
	 */
	public interface IObjectAttributeBlockView
	{
		/**
		 * 设置对象属性块信息
		 * @param value
		 */
		function set blockViewInfo(value:BlockViewInfo):void;

		/**
		 * 界面所属对象（空间）
		 */
		function get space():Object;
		function set space(value:Object):void;
	}
}
