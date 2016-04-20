package me.feng.objectView.events
{
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;


	/**
	 * 对象界面事件
	 * @author feng 2016-4-19
	 */
	public class ObjectViewEvent extends Event
	{
		/**
		 * 属性值变化时间
		 */
		public static const VALUE_CHANGE:String = "valueChange";

		/**
		 * 界面所属对象（空间）
		 */
		public var space:Object;

		/**
		 * 属性名称
		 */
		public var attributeName:String;

		/**
		 * 属性值
		 */
		public var attributeValue:Object;

		/**
		 * 构建
		 */
		public function ObjectViewEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		override public function toString():String
		{
			return "[{0} type=\"{1}\" space=\"{2}\"  attributeName=\"{3}\" attributeValue={4}]" //
				.replace("{0}", getQualifiedClassName(this).split("::").pop()) //
				.replace("{1}", type) //
				.replace("{2}", getQualifiedClassName(this).split("::").pop()) //
				.replace("{3}", attributeName) //
				.replace("{4}", JSON.stringify(attributeValue)) //
				;
		}
	}
}
