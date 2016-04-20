package me.feng.objectView.viewInfo
{
	import flash.display.DisplayObject;

	import me.feng.objectView.ObjectViewConfig;
	import me.feng.objectView.iview.IObjectAttributeView;
	import me.feng.objectView.configs.AttributeTypeDefinition;
	import me.feng.utils.AccessType;
	import me.feng.utils.ClassUtils;

	/**
	 * 对象属性信息
	 * @author feng 2016-3-10
	 */
	public class AttributeViewInfo
	{
		/**
		 * 属性名称
		 */
		public var name:String;

		/**
		 * 属性类型
		 */
		public var type:String;

		/**
		 * 访问类型
		 */
		public var access:String;

		/**
		 * 所属块名称
		 */
		public var block:String = "";

		/**
		 * 组件
		 */
		public var component:String = "";

		/**
		 * 组件参数
		 */
		public var componentParam:Object;

		/**
		 * 属性所属对象
		 */
		public var owner:Object;

		/**
		 * 是否可编辑
		 */
		public function isEditable():Boolean
		{
			return access != AccessType.readonly;
		}

		/**
		 * 是否可读
		 */
		public function canRead():Boolean
		{
			return access == AccessType.readonly || access == AccessType.readwrite;
		}

		/**
		 * 初始化组件
		 */
		private function initComponent():void
		{
			if (component != null && component != "")
				return;

			var defaultViewClass:AttributeTypeDefinition = ObjectViewConfig.instance.getAttributeDefaultViewClass(type, false);
			var tempComponent:String = defaultViewClass ? defaultViewClass.component : "";
			if (tempComponent != null && tempComponent != "")
			{
				component = defaultViewClass.component;
				componentParam = defaultViewClass.componentParam;
				return;
			}

			//返回默认对象属性界面类定义
			component = ObjectViewConfig.instance.defaultObjectAttributeViewClass;
			componentParam = null;
		}

		/**
		 * 获取界面
		 */
		public function getView():DisplayObject
		{
			initComponent();

			var view:DisplayObject = ClassUtils.getInstance(component);
			IObjectAttributeView(view).init(this);
			return view;
		}
	}
}
