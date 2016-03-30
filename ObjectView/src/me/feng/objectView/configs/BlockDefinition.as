package me.feng.objectView.configs
{
	import me.feng.utils.ClassUtils;

	/**
	 * 块定义
	 * @author feng 2016-3-23
	 */
	public class BlockDefinition
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
		 * 设置显示组件
		 * @param component					组件
		 */
		public function setComponent(component:Object):BlockDefinition
		{
			this.component = ClassUtils.getClassName(component);
			return this;
		}

		/**
		 * 设置属性组件
		 */
		public function setComponentParam(param:Object):BlockDefinition
		{
			this.componentParam = param;
			return this;
		}
	}
}
