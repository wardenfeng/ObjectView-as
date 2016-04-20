package me.feng.objectView
{
	import me.feng.objectView.base.view.DefaultBaseObjectView;
	import me.feng.objectView.base.view.DefaultObjectAttributeView;
	import me.feng.objectView.block.view.DefaultObjectBlockView;
	import me.feng.objectView.block.view.DefaultObjectView;
	import me.feng.objectView.configs.AttributeTypeDefinition;
	import me.feng.objectView.configs.ClassDefinition;
	import me.feng.utils.ClassUtils;

	/**
	 * ObjectView总配置数据
	 * @author feng 2016-3-23
	 */
	public class ObjectViewConfig
	{
		/**
		 * 默认基础类型对象界面类定义
		 */
		public var defaultBaseObjectViewClass:String = ClassUtils.getClassName(DefaultBaseObjectView);
		/**
		 * 默认对象界面类定义
		 */
		public var defaultObjectViewClass:String = ClassUtils.getClassName(DefaultObjectView);
		/**
		 * 默认对象属性界面类定义
		 */
		public var defaultObjectAttributeViewClass:String = ClassUtils.getClassName(DefaultObjectAttributeView);
		/**
		 * 属性块默认界面
		 */
		public var defaultObjectAttributeBlockView:String = ClassUtils.getClassName(DefaultObjectBlockView);

		/**
		 * 指定属性类型界面类定义字典（key:属性类名称,value:属性界面类定义）
		 */
		public var attributeDefaultViewClassByTypeVec:Vector.<AttributeTypeDefinition> = new Vector.<AttributeTypeDefinition>();

		/**
		 * ObjectView类配置字典 （key：类名称，value：ObjectView类配置）
		 */
		public var classConfigVec:Vector.<ClassDefinition> = new Vector.<ClassDefinition>();

		private static var _instance:ObjectViewConfig;

		public static function get instance():ObjectViewConfig
		{
			if (_instance == null)
			{
				_instance = new ObjectViewConfig();
			}
			return _instance;
		}

		/**
		 * 获取ObjectView类配置
		 * @param object				对象
		 * @param autoCreate			是否自动创建
		 * @return
		 */
		public function getClassConfig(object:Object, autoCreate:Boolean = true):ClassDefinition
		{
			var className:String = ClassUtils.getClassName(object);

			for each (var classConfig:ClassDefinition in classConfigVec)
			{
				if (classConfig.name == className)
				{
					return classConfig;
				}
			}
			if (autoCreate)
			{
				classConfig = new ClassDefinition();
				classConfig.name = className;
				classConfigVec.push(classConfig);
				return classConfig;
			}
			return null;
		}

		/**
		 * 获取特定类型的默认属性界面定义
		 * @param attributeClass		属性类型
		 * @param autoCreate			是否自动创建
		 * @return
		 */
		public function getAttributeDefaultViewClass(attributeClass:Object, autoCreate:Boolean = true):AttributeTypeDefinition
		{
			var type:String = ClassUtils.getClassName(attributeClass);
			for each (var obj:AttributeTypeDefinition in attributeDefaultViewClassByTypeVec)
			{
				if (obj.type == type)
				{
					return obj;
				}
			}
			if (autoCreate)
			{
				obj = new AttributeTypeDefinition();
				obj.type = type;
				attributeDefaultViewClassByTypeVec.push(obj);
				return obj;
			}
			return null;
		}

		/**
		 * 设置类配置
		 * @param config
		 */
		public function setConfig(config:Object):void
		{
			clearConfig();
			//设置数据
			ClassUtils.deepCopy(this, config);
		}

		/**
		 * 清理数据
		 */
		public function clearConfig():void
		{
			ClassUtils.deepCopy(this, ClassUtils.getInstance(this));
		}
	}
}
