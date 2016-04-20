package me.feng.objectView
{
	import flash.display.DisplayObject;

	import me.feng.objectView.base.data.ObjectViewInfo;
	import me.feng.objectView.configs.ClassDefinition;
	import me.feng.utils.ClassUtils;

	/**
	 * 对象界面
	 * @author feng 2016-3-10
	 */
	public class ObjectView
	{
		/**
		 * 获取对象界面
		 * @param object	用于生成界面的对象
		 */
		public static function getObjectView(object:Object):DisplayObject
		{
			var classConfig:ObjectViewInfo = getObjectInfo(object);
			var view:DisplayObject = classConfig.getView();
			return view;
		}

		/**
		 * 获取对象信息
		 * @param object
		 * @return
		 */
		private static function getObjectInfo(object:Object):ObjectViewInfo
		{
			var className:String = ClassUtils.getClassName(object);
			var objectInfo:ObjectViewInfo = new ObjectViewInfo();

			var classConfig:ClassDefinition = ObjectViewConfig.instance.getClassConfig(object, false);
			ClassUtils.deepCopy(objectInfo, classConfig);

			objectInfo.name = className;
			objectInfo.owner = object;
			return objectInfo;
		}
	}
}
