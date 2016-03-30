package me.feng.objectView.configs
{
	import me.feng.utils.ClassUtils;

	/**
	 * 定义特定属性类型默认界面
	 * @author feng 2016-3-25
	 */
	public class AttributeTypeDefinition
	{
		/**
		 * 属性类型
		 */
		public var type:String;
		/**
		 * 界面类
		 */
		public var component:String;

		/**
		 * 组件参数
		 */
		public var componentParam:Object;

		/**
		 * 设置组件
		 */
		public function setComponent(component:Object):AttributeTypeDefinition
		{
			this.component = ClassUtils.getClassName(component);
			return this;
		}

		/**
		 * 设置属性组件
		 */
		public function setComponentParam(param:Object):AttributeTypeDefinition
		{
			this.componentParam = param;
			return this;
		}
	}
}
