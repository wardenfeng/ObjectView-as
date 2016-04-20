package me.feng.objectView.base.view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	import me.feng.objectView.base.IObjectAttributeView;
	import me.feng.objectView.base.IObjectView;
	import me.feng.objectView.base.data.AttributeViewInfo;
	import me.feng.objectView.base.data.ObjectViewInfo;

	/**
	 * 默认对象界面
	 * @author feng 2016-3-11
	 */
	public class DefaultObjectView extends Sprite implements IObjectView
	{
		private var _space:Object;
		private var isInitView:Boolean;
		private var _objectViewInfo:ObjectViewInfo;
		private var attributeViews:Vector.<IObjectAttributeView>;

		/**
		 * @inheritDoc
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
			attributeViews = new Vector.<IObjectAttributeView>();
			var h:Number = 0;

			var objectAttributeInfos:Vector.<AttributeViewInfo> = _objectViewInfo.getObjectAttributeInfos();

			for (var i:int = 0; i < objectAttributeInfos.length; i++)
			{
				if (!objectAttributeInfos[i].canRead())
					continue;
				var displayObject:DisplayObject = objectAttributeInfos[i].getView();
				displayObject.y = h;
				addChild(displayObject);
				h += displayObject.height + 2;
				attributeViews.push(displayObject as IObjectAttributeView);
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
			for (var i:int = 0; i < attributeViews.length; i++)
			{
				attributeViews[i].space = _space;
			}
		}
	}
}
