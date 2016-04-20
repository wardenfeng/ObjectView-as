package me.feng.objectView.block.view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	import me.feng.objectView.base.IObjectView;
	import me.feng.objectView.base.data.ObjectViewInfo;
	import me.feng.objectView.block.IObjectBlockView;
	import me.feng.objectView.block.data.BlockViewInfo;

	/**
	 * 默认使用块的对象界面
	 * @author feng 2016-3-22
	 */
	public class DefaultObjectView extends Sprite implements IObjectView
	{
		private var _space:Object;
		private var _objectViewInfo:ObjectViewInfo;
		private var blockViews:Vector.<IObjectBlockView>;

		/**
		 * 对象界面数据
		 */
		public function init(objectViewInfo:ObjectViewInfo):void
		{
			_objectViewInfo = objectViewInfo;
			_space = objectViewInfo.owner;

			blockViews = new Vector.<IObjectBlockView>();
			var h:Number = 0;
			var objectBlockInfos:Vector.<BlockViewInfo> = _objectViewInfo.getObjectBlockInfos();
			for (var i:int = 0; i < objectBlockInfos.length; i++)
			{
				var displayObject:DisplayObject = objectBlockInfos[i].getView();
				displayObject.y = h;
				addChild(displayObject);
				h += displayObject.height + 2;
				blockViews.push(displayObject as IObjectBlockView);
			}
			graphics.clear();
			graphics.beginFill(0x666666);
			graphics.drawRect(0, 0, 200, h);
			graphics.endFill();

			updateView();
		}

		public function get space():Object
		{
			return _space;
		}

		public function set space(value:Object):void
		{
			_space = value;
			updateView();
		}

		/**
		 * 更新界面
		 */
		private function updateView():void
		{
			for (var i:int = 0; i < blockViews.length; i++)
			{
				blockViews[i].space = _space;
			}
		}

	}
}
