package me.feng.objectView.iview
{


	/**
	 * 对象界面接口
	 * @author feng 2016-3-11
	 */
	public interface IObjectView extends IObjectViewBase
	{
		/**
		 * 获取块界面
		 * @param blockName		块名称
		 */
		function getblockView(blockName:String):IObjectBlockView;

		/**
		 * 获取属性界面
		 * @param attributeName		属性名称
		 */
		function getAttributeView(attributeName:String):IObjectAttributeView;
	}
}
