package me.feng.objectView.iview
{


	/**
	 * 对象属性块界面接口
	 * @author feng 2016-3-22
	 */
	public interface IObjectBlockView
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

		/**
		 * 块名称
		 */
		function get blockName():String;

		/**
		 * 获取属性界面
		 * @param attributeName		属性名称
		 */
		function getAttributeView(attributeName:String):IObjectAttributeView;
	}
}
