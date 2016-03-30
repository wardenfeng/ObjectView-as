package me.feng.objectView.block.view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	import me.feng.objectView.base.IObjectView;
	import me.feng.objectView.base.data.ObjectViewInfo;
	import me.feng.objectView.block.data.BlockViewInfo;

	/**
	 * 默认使用块的对象界面
	 * @author feng 2016-3-22
	 */
	public class DefaultObjectViewWithBlock extends Sprite implements IObjectView
	{
		/**
		 * 对象界面数据
		 */
		public function set data(value:ObjectViewInfo):void
		{
			var h:Number = 0;

			var objectBlockInfos:Vector.<BlockViewInfo> = value.getObjectBlockInfos();

			for (var i:int = 0; i < objectBlockInfos.length; i++)
			{
				var displayObject:DisplayObject = objectBlockInfos[i].getView();
				displayObject.y = h;
				addChild(displayObject);
				h += displayObject.height + 2;
			}
			graphics.clear();
			graphics.beginFill(0x666666);
			graphics.drawRect(0, 0, 200, h);
			graphics.endFill();
		}
	}
}
