package me.feng.utils
{

	/**
	 * 排序比较函数
	 * @author feng 2016-3-29
	 */
	public class SortCompare
	{
		/**
		 * 比较字符串
		 * @param a
		 * @param b
		 * @return
		 */
		public static function stringCompare(a:String, b:String):int
		{
			var index:int = 0;
			var len:int = Math.min(a.length, b.length);
			for (var i:int = 0; i < len; i++)
			{
				if (a.charCodeAt(i) != b.charCodeAt(i))
					return a.charCodeAt(i) - b.charCodeAt(i);
			}
			if (a.length != b.length)
				return a.length - b.length;

			return 0;
		}
	}
}
