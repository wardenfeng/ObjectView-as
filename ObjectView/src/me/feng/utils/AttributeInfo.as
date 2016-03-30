package me.feng.utils
{

	/**
	 * 属性信息
	 * @author feng 2016-3-28
	 */
	public class AttributeInfo
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
		 * 构建
		 */
		public function AttributeInfo(name:String = "", type:String = "", access:String = "")
		{
			this.name = name;
			this.type = type;
			this.access = access;
		}

		/**
		 * 设置数据
		 * @param data
		 */
		public function setData(data:Object):*
		{
			ClassUtils.deepCopy(this, data);
			return this;
		}

		/**
		 * 比较字符串
		 * @param a
		 * @param b
		 * @return
		 */
		public static function compare(a:AttributeInfo, b:AttributeInfo):int
		{
			return SortCompare.stringCompare(a.name, b.name);
		}
	}
}
