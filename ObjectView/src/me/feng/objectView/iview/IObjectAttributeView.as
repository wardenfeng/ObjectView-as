package me.feng.objectView.iview
{

	/**
	 * 对象属性界面接口
	 * @author feng 2016-3-10
	 */
	public interface IObjectAttributeView extends IObjectViewBase
	{
		/**
		 * 属性名称
		 */
		function get attributeName():String;

		/**
		 * 属性值
		 */
		function get attributeValue():Object;
		function set attributeValue(value:Object):void;
	}
}
