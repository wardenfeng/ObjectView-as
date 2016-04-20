package
{
	import com.bit101.components.HBox;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;

	import me.feng.objectView.ObjectView;
	import me.feng.objectView.ObjectViewConfig;
	import me.feng.objectView.data.ObjectA;
	import me.feng.objectView.view.BooleanAttrView;
	import me.feng.objectView.view.CustomAttrView;
	import me.feng.objectView.view.CustomBlockView;
	import me.feng.objectView.view.CustomObjectView;


	/**
	 *
	 * @author feng 2016-3-29
	 */
	[SWF(width = "800", height = "600")]
	public class ObjectViewLoadTest extends Sprite
	{
		public function ObjectViewLoadTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			MyCC.initFlashConsole(this);

			includeView();
			loadConfig();
		}

		private function includeView():void
		{
			BooleanAttrView
			CustomAttrView
			CustomBlockView
			CustomObjectView
		}

		private function loadConfig():void
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.load(new URLRequest("objectView.json"));
		}

		protected function onLoadComplete(event:Event):void
		{
			var loader:URLLoader = event.currentTarget as URLLoader;
			var configStr:String = loader.data;
			var config:Object = JSON.parse(configStr);

			ObjectViewConfig.instance.setConfig(config);

			startTest();
		}

		private function startTest():void
		{
			var box:DisplayObjectContainer = new HBox();
			addChild(box);

			var a:ObjectA = new ObjectA();
			a.boo = true;
			a.da = 2;
			a.db = "```";

			var view:DisplayObject = ObjectView.getObjectView(a);
			box.addChild(view);

			box.addChild(ObjectView.getObjectView({a: 1, b: "ssss", c: Boolean, d: {x: 1, y: 2}}));
			box.addChild(ObjectView.getObjectView({x: 1, y: "ssss", z: Boolean, d: {x: 1, y: 2}}));
		}
	}
}
