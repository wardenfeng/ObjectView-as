package me.feng.objectView.view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;

	import me.feng.objectView.iview.IObjectAttributeView;
	import me.feng.objectView.iview.IObjectBlockView;
	import me.feng.objectView.viewInfo.AttributeViewInfo;
	import me.feng.objectView.viewInfo.BlockViewInfo;

	/**
	 * 默认对象属性块界面
	 * @author feng 2016-3-22
	 */
	public class DefaultObjectBlockView extends Sprite implements IObjectBlockView
	{
		private var _space:Object;
		private var _blockName:String;

		private var attributeViews:Vector.<IObjectAttributeView>;
		private var itemList:Vector.<AttributeViewInfo>;
		private var isInitView:Boolean;

		/**
		 * @inheritDoc
		 */
		public function DefaultObjectBlockView(blockViewInfo:BlockViewInfo)
		{
			_space = blockViewInfo.owner;
			_blockName = blockViewInfo.name;
			itemList = blockViewInfo.itemList;

			$updateView();
		}

		private function initView():void
		{
			var h:Number = 0;
			if (_blockName != null && _blockName.length > 0)
			{
				var blockTitle:TextField = new TextField();
				//			label.height = 50;
				blockTitle.width = 100;
				blockTitle.height = 20;
				blockTitle.textColor = 0xff0000;
				blockTitle.text = _blockName;
				addChild(blockTitle);
				h = blockTitle.x + blockTitle.height + 2;
			}

			attributeViews = new Vector.<IObjectAttributeView>();
			var objectAttributeInfos:Vector.<AttributeViewInfo> = itemList;
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
			graphics.lineStyle(null, 0x00ff00);
			graphics.moveTo(0, 0);
			graphics.lineTo(200, 0);
			graphics.lineTo(200, h);
			graphics.lineTo(0, h);
			graphics.lineTo(0, 0);
			graphics.endFill();

			isInitView = true;
		}

		public function get space():Object
		{
			return _space;
		}

		public function set space(value:Object):void
		{
			_space = value;
			for (var i:int = 0; i < attributeViews.length; i++)
			{
				attributeViews[i].space = _space;
			}

			$updateView();
		}

		public function get blockName():String
		{
			return _blockName;
		}

		/**
		 * 更新自身界面
		 */
		private function $updateView():void
		{
			if (!isInitView)
			{
				initView();
			}
		}

		public function updateView():void
		{
			$updateView();
			for (var i:int = 0; i < attributeViews.length; i++)
			{
				attributeViews[i].updateView();
			}
		}

		public function getAttributeView(attributeName:String):IObjectAttributeView
		{
			for (var i:int = 0; i < attributeViews.length; i++)
			{
				if (attributeViews[i].attributeName == attributeName)
				{
					return attributeViews[i];
				}
			}
			return null;
		}
	}
}
