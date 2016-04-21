package me.feng.objectView.utils
{
	import me.feng.objectView.iview.IObjectViewBase;

	/**
	 * ObjectView监听工具
	 * @author feng 2016-4-20
	 */
	public class ObjectViewListenUtils
	{
		private static var instance:ObjectViewListener = new ObjectViewListener();

		/**
		 * 添加监听对象
		 * @param objectViewBase
		 */
		public static function addListen(objectViewBase:IObjectViewBase):void
		{
			instance.addListen(objectViewBase);
		}

		/**
		 * 移除监听对象
		 * @param objectViewBase
		 */
		public static function removeListen(objectViewBase:IObjectViewBase):void
		{
			instance.removeListen(objectViewBase);
		}
	}
}
import flash.display.DisplayObject;
import flash.display.Stage;
import flash.events.Event;

import me.feng.objectView.iview.IObjectViewBase;

/**
 * ObjectView监听工具
 * @author feng 2016-4-20
 */
class ObjectViewListener
{
	private var _stage:Stage;

	private var listens:Vector.<IObjectViewBase>

	public function ObjectViewListener()
	{
		listens = new Vector.<IObjectViewBase>();
	}

	/**
	 * 舞台
	 */
	private function get stage():Stage
	{
		return _stage;
	}

	private function set stage(value:Stage):void
	{
		_stage = value;
		if (stage != null)
		{
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
	}

	protected function onEnterFrame(event:Event):void
	{
		for (var i:int = 0; i < listens.length; i++)
		{
			if (DisplayObject(listens[i]).stage != null)
			{
				listens[i].updateView();
			}
		}
	}

	/**
	 * 添加监听对象
	 * @param objectViewBase
	 */
	public function addListen(objectViewBase:IObjectViewBase):void
	{
		if (stage == null)
		{
			stage = DisplayObject(objectViewBase).stage;
		}

		if (listens.indexOf(objectViewBase) == -1)
		{
			listens.push(objectViewBase);
		}
	}

	/**
	 * 移除监听对象
	 * @param objectViewBase
	 */
	public function removeListen(objectViewBase:IObjectViewBase):void
	{
		var index:int = listens.indexOf(objectViewBase);
		if (index != -1)
		{
			listens.removeAt(index);
		}
	}
}
