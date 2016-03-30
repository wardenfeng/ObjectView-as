package me.feng.objectView.configs
{
	import me.feng.utils.ClassUtils;

	/**
	 * ObjectView类配置
	 * @author feng 2016-3-23
	 */
	public class ClassDefinition
	{
		/**
		 * 类名
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
		 * 自定义对象属性定义字典（key:属性名,value:属性定义）
		 */
		public var attributeDefinitionVec:Vector.<AttributeDefinition> = new Vector.<AttributeDefinition>();

		/**
		 * 自定义对象属性块界面类定义字典（key:属性块名称,value:自定义对象属性块界面类定义）
		 */
		public var blockDefinitionVec:Vector.<BlockDefinition> = new Vector.<BlockDefinition>();

		/**
		 * 设置自定义对象界面类定义
		 * @param viewClass				自定义对象界面类定义（该类必须是实现IObjectView接口并且是DisplayObject的子类）
		 */
		public function setCustomObjectViewClass(viewClass:Class):void
		{
			component = ClassUtils.getClassName(viewClass);
		}

		/**
		 * 获取自定义对象属性定义
		 * @param attributeName			属性名称
		 * @param autoCreate			是否自动生成
		 * @return
		 */
		public function getAttributeDefinition(attributeName:String, autoCreate:Boolean = true):AttributeDefinition
		{
			var attributeDefinition:AttributeDefinition;
			for each (attributeDefinition in attributeDefinitionVec)
			{
				if (attributeDefinition.name == attributeName)
				{
					return attributeDefinition;
				}
			}
			attributeDefinition = new AttributeDefinition();
			attributeDefinition.name = attributeName;
			if (autoCreate)
			{
				attributeDefinitionVec.push(attributeDefinition);
			}
			return attributeDefinition;
		}

		/**
		 * 获取对象属性块定义
		 * @param blockName		属性名称
		 * @param autoCreate	是否自动生成
		 * @return
		 */
		public function getBlockDefinition(blockName:String, autoCreate:Boolean = true):BlockDefinition
		{
			var blockDefinition:BlockDefinition;
			for each (blockDefinition in blockDefinitionVec)
			{
				if (blockDefinition.name == blockName)
				{
					return blockDefinition;
				}
			}
			blockDefinition = new BlockDefinition();
			blockDefinition.name = blockName;
			if (autoCreate)
			{
				blockDefinitionVec.push(blockDefinition);
			}
			return blockDefinition;
		}

		/**
		 * 设置类配置
		 * @param config
		 */
		public function setConfig(config:Object):void
		{
			//清理数据
			ClassUtils.deepCopy(this, ClassUtils.getInstance(this));
			//设置数据
			ClassUtils.deepCopy(this, config);
		}
	}
}
