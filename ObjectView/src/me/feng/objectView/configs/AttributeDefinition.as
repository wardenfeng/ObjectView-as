package me.feng.objectView.configs
{
	import me.feng.utils.ClassUtils;

	/**
	 * 定义属性
	 * @author feng 2016-3-23
	 */
	public class AttributeDefinition
	{
		/**
		 * 属性名称
		 */
		public var name:String = "";

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
		 * 设置所在块名称
		 */
		public function setBlock(block:String):AttributeDefinition
		{
			this.block = block;
			return this;
		}

		/**
		 * 设置属性组件
		 */
		public function setComponent(component:Object):AttributeDefinition
		{
			this.component = ClassUtils.getClassName(component);
			return this;
		}

		/**
		 * 设置属性组件
		 */
		public function setComponentParam(param:Object):AttributeDefinition
		{
			this.componentParam = param;
			return this;
		}
	}
}
