package
{
	import com.bit101.components.HBox;

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.utils.getTimer;

	import me.feng.objectView.ObjectView;
	import me.feng.objectView.ObjectViewConfig;
	import me.feng.objectView.configs.ClassDefinition;
	import me.feng.objectView.data.ObjectA;
	import me.feng.objectView.view.BooleanAttrView;
	import me.feng.objectView.view.CustomAttrView;
	import me.feng.objectView.view.CustomBlockView;
	import me.feng.objectView.view.CustomObjectView;

	//
	//
	// @author feng 2016-3-23
	//
	[SWF(width = "800", height = "600")]
	public class ObjectViewTest extends Sprite
	{

		public function ObjectViewTest()
		{
			init();
		}

		public function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			MyCC.initFlashConsole(this);

			//			initBlockConfig()

			var box:DisplayObjectContainer = new HBox();
			addChild(box);

			var spriteConfig:ClassDefinition = ObjectViewConfig.instance.getClassConfig(Sprite);
			spriteConfig.getAttributeDefinition("accessibilityImplementation").setBlock("坐标");
			spriteConfig.getAttributeDefinition("x").setBlock("坐标");
			spriteConfig.getAttributeDefinition("y").setBlock("坐标");
			spriteConfig.getAttributeDefinition("z").setBlock("坐标");
			box.addChild(ObjectView.getObjectView(new Sprite()));

			spriteConfig.setCustomObjectViewClass(CustomObjectView);
			box.addChild(ObjectView.getObjectView(new Sprite()));

			var a:ObjectA = new ObjectA();
			a.boo = true;
			a.da = 2;
			a.db = "```";

			var t:int = getTimer();

			initBlockConfig()
			box.addChild(ObjectView.getObjectView(a));

			trace(getTimer() - t);
			t = getTimer();

			var fullConfig:Object = ObjectViewConfig.instance;
			var fullConfigStr:String = JSON.stringify(fullConfig);
			trace(fullConfigStr);
			var fullConfig1:Object = JSON.parse(fullConfigStr);

			ObjectViewConfig.instance.clearConfig();

			box.addChild(ObjectView.getObjectView(a));
			trace(getTimer() - t);
			t = getTimer();

			ObjectViewConfig.instance.setConfig(fullConfig1);

			box.addChild(ObjectView.getObjectView(a));
			trace(getTimer() - t);
			t = getTimer();
		}

		private function initBlockConfig():void
		{
			var objectAConfig:ClassDefinition = ObjectViewConfig.instance.getClassConfig(ObjectA);

			objectAConfig.getAttributeDefinition("x").setBlock("坐标");

			objectAConfig.getAttributeDefinition("x").setBlock("坐标");
			objectAConfig.getAttributeDefinition("y").setBlock("坐标");
			objectAConfig.getAttributeDefinition("z").setBlock("坐标");
			//
			objectAConfig.getAttributeDefinition("rx").setBlock("旋转");
			objectAConfig.getAttributeDefinition("ry").setBlock("旋转");
			objectAConfig.getAttributeDefinition("rz").setBlock("旋转");
			//
			objectAConfig.getAttributeDefinition("sx").setBlock("缩放");
			objectAConfig.getAttributeDefinition("sy").setBlock("缩放");
			objectAConfig.getAttributeDefinition("sz").setBlock("缩放");
			objectAConfig.getAttributeDefinition("custom").setBlock("缩放");
//
			objectAConfig.getAttributeDefinition("a").setBlock("自定义块");
			objectAConfig.getAttributeDefinition("b").setBlock("自定义块");

			objectAConfig.getAttributeDefinition("custom").setComponent(CustomAttrView);

			objectAConfig.getBlockDefinition("自定义块").setComponent(CustomBlockView);

			ObjectViewConfig.instance.getAttributeDefaultViewClass(Boolean).setComponent(BooleanAttrView);
		}

	}

}



