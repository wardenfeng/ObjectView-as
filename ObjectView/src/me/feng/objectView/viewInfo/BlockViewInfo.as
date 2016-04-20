package me.feng.objectView.viewInfo
{
	import flash.display.DisplayObject;

	import me.feng.objectView.ObjectViewConfig;
	import me.feng.utils.ClassUtils;

	/**
	 * 对象属性块
	 * @author feng 2016-3-22
	 */
	public class BlockViewInfo
	{
		/**
		 * 块名称
		 */
		public var name:String = "";

		/**
		 * 组件
		 */
		public var component:String = "";

		/**
		 * 组件参数
		 */
		public var componentParam:Object;

		/**
		 * 属性信息列表
		 */
		public var itemList:Vector.<AttributeViewInfo>;

		/**
		 * 属性拥有者
		 */
		public var owner:Object;

		/**
		 * 构建一个对象属性块
		 */
		public function BlockViewInfo()
		{
			name = "";
			itemList = new Vector.<AttributeViewInfo>();
		}

		/**
		 * 获取对象属性块界面类定义
		 * @param objectAttributeBlock		对象属性快信息
		 * @return							对象属性块界面类定义
		 */
		private function initComponent():void
		{
			if (component != null && component != "")
				return;

			//返回默认对象属性界面类定义
			component = ObjectViewConfig.instance.defaultObjectAttributeBlockView;
			componentParam = null;
		}

		/**
		 * 获取界面
		 * @param owner		所属对象
		 * @return
		 */
		public function getView():DisplayObject
		{
			initComponent();

			var cls:Class = ClassUtils.getClass(component);
			var view:DisplayObject = new cls(this);
			return view;
		}
	}
}
