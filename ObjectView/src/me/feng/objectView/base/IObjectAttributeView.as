package me.feng.objectView.base
{
	import me.feng.objectView.base.data.AttributeViewInfo;

	/**
	 * 对象属性界面接口
	 * @author feng 2016-3-10
	 */
	public interface IObjectAttributeView
	{
		/**
		 * 初始化属性界面
		 * @param value
		 */
		function init(attributeViewInfo:AttributeViewInfo):void;

		/**
		 * 界面所属对象（空间）
		 */
		function get space():Object;
		function set space(value:Object):void;

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
