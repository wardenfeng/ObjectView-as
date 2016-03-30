package me.feng.objectView.block.view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;

	import me.feng.objectView.base.data.AttributeViewInfo;
	import me.feng.objectView.block.IObjectAttributeBlockView;
	import me.feng.objectView.block.data.BlockViewInfo;

	/**
	 * 默认对象属性块界面
	 * @author feng 2016-3-22
	 */
	public class DefaultObjectAttributeBlockView extends Sprite implements IObjectAttributeBlockView
	{

		/**
		 * @inheritDoc
		 */
		public function set objectAttributeBlock(value:BlockViewInfo):void
		{
			var h:Number = 0;
			if (value.name != null && value.name.length > 0)
			{
				var blockTitle:TextField = new TextField();
				//			label.height = 50;
				blockTitle.width = 100;
				blockTitle.height = 20;
				blockTitle.textColor = 0xff0000;
				blockTitle.text = value.name;
				addChild(blockTitle);
				h = blockTitle.x + blockTitle.height + 2;
			}

			var objectAttributeInfos:Vector.<AttributeViewInfo> = value.itemList;
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
			graphics.lineStyle(null, 0x00ff00);
			graphics.moveTo(0, 0);
			graphics.lineTo(200, 0);
			graphics.lineTo(200, h);
			graphics.lineTo(0, h);
			graphics.lineTo(0, 0);
			graphics.endFill();
		}
	}
}
