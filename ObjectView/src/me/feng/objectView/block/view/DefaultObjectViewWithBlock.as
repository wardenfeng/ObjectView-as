package me.feng.objectView.block.view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	import me.feng.objectView.base.IObjectView;
	import me.feng.objectView.base.data.ObjectViewInfo;
	import me.feng.objectView.block.IObjectAttributeBlockView;
	import me.feng.objectView.block.data.BlockViewInfo;

	/**
	 * 默认使用块的对象界面
	 * @author feng 2016-3-22
	 */
	public class DefaultObjectViewWithBlock extends Sprite implements IObjectView
	{
		private var _space:Object;
		private var isInitView:Boolean;
		private var _objectViewInfo:ObjectViewInfo;
		private var blockViews:Vector.<IObjectAttributeBlockView>;

		/**
		 * 对象界面数据
		 */
		public function set objectViewInfo(value:ObjectViewInfo):void
		{
			_objectViewInfo = value;
			_space = value.owner;
			if (!isInitView)
			{
				initView();
			}
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
		 * 初始化界面
		 */
		private function initView():void
		{
			blockViews = new Vector.<IObjectAttributeBlockView>();

			var h:Number = 0;

			var objectBlockInfos:Vector.<BlockViewInfo> = _objectViewInfo.getObjectBlockInfos();

			for (var i:int = 0; i < objectBlockInfos.length; i++)
			{
				var displayObject:DisplayObject = objectBlockInfos[i].getView();
				displayObject.y = h;
				addChild(displayObject);
				h += displayObject.height + 2;
				blockViews.push(displayObject as IObjectAttributeBlockView);
			}
			graphics.clear();
			graphics.beginFill(0x666666);
			graphics.drawRect(0, 0, 200, h);
			graphics.endFill();

			isInitView = true;
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
