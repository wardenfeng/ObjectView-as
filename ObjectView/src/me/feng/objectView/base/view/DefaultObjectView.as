package me.feng.objectView.base.view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	import me.feng.objectView.base.IObjectView;
	import me.feng.objectView.base.data.AttributeViewInfo;
	import me.feng.objectView.base.data.ObjectViewInfo;

	/**
	 * 默认对象界面
	 * @author feng 2016-3-11
	 */
	public class DefaultObjectView extends Sprite implements IObjectView
	{

		/**
		 * @inheritDoc
		 */
		public function set data(value:ObjectViewInfo):void
		{
			var h:Number = 0;

			var objectAttributeInfos:Vector.<AttributeViewInfo> = value.getObjectAttributeInfos();

			for (var i:int = 0; i < objectAttributeInfos.length; i++)
			{
				if (!objectAttributeInfos[i].canRead())
					continue;
				var displayObject:DisplayObject = objectAttributeInfos[i].getView();
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
