package me.feng.objectView.base.data
{
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;
	
	import me.feng.objectView.ObjectViewConfig;
	import me.feng.objectView.base.IObjectView;
	import me.feng.objectView.block.data.BlockViewInfo;
	import me.feng.objectView.configs.AttributeDefinition;
	import me.feng.objectView.configs.BlockDefinition;
	import me.feng.objectView.configs.ClassDefinition;
	import me.feng.utils.AttributeInfo;
	import me.feng.utils.ClassUtils;

	/**
	 * 对象信息
	 * @author feng 2016-3-29
	 */
	public class ObjectViewInfo
	{
		/**
		 * 类名
		 */
		public var name:String = "";

		/**
		 * 组件
		 */
		public var component:String = "";
		
		/**
		 * 组件参数
		 */
		public var componentParam:Object;

		/**
		 * 对象属性列表
		 */
		private var objectAttributeInfos:Vector.<AttributeViewInfo>;
		/**
		 * 对象块信息列表
		 */
		private var objectBlockInfos:Vector.<BlockViewInfo>;

		/**
		 * 保存类的一个实例，为了能够获取动态属性信息
		 */
		public var owner:Object;

		/**
		 * 获取对象属性列表
		 */
		public function getObjectAttributeInfos():Vector.<AttributeViewInfo>
		{
			if (objectAttributeInfos == null)
			{
				//获取属性信息列表
				var attributes:Vector.<AttributeInfo> ;
				if(owner != null)
				{
					attributes = ClassUtils.getAttributeInfoList(owner);
				}
				else
				{
					attributes = ClassUtils.getAttributeInfoList(name);
				}
				attributes.sort(AttributeInfo.compare);
				
				//收集对象属性信息
				var dic:Dictionary = new Dictionary();
				var tempInfos:Vector.<AttributeViewInfo> = new Vector.<AttributeViewInfo>();
				var objectAttributeInfo:AttributeViewInfo;
				var i:int;
				for (i = 0; i < attributes.length; i++)
				{
					var attributeInfo:AttributeInfo = attributes[i];
					objectAttributeInfo = new AttributeViewInfo();
					objectAttributeInfo.owner = owner;
					ClassUtils.deepCopy(objectAttributeInfo, attributeInfo);
					dic[objectAttributeInfo.name] = objectAttributeInfo;
					tempInfos.push(objectAttributeInfo);
				}
				
				var classConfig:ClassDefinition = ObjectViewConfig.instance.getClassConfig(name,false);
//				if(classConfig == null)
//				{
//					classConfig = ObjectViewConfig.instance.createDefaultClassConfig(name);
//				}
				
				if(classConfig != null)
				{
					//根据配置中默认顺序生产对象属性信息列表
					objectAttributeInfos = new Vector.<AttributeViewInfo>();
					var attributeDefinitions:Vector.<AttributeDefinition> = classConfig.attributeDefinitionVec;
					for (i = 0; i < attributeDefinitions.length; i++)
					{
						objectAttributeInfo = dic[attributeDefinitions[i].name];
						if (objectAttributeInfo != null)
						{
							ClassUtils.deepCopy(objectAttributeInfo, attributeDefinitions[i]);
							objectAttributeInfos.push(objectAttributeInfo);
						}
					}
				}
				else
				{
					objectAttributeInfos = tempInfos.concat();
				}
			}
			return objectAttributeInfos;
		}
		
		/**
		 * 获取对象块信息列表
		 */
		public function getObjectBlockInfos():Vector.<BlockViewInfo>
		{
			if (objectBlockInfos != null)
				return objectBlockInfos;
			
			var dic:Dictionary = new Dictionary();
			var objectBlockInfo:BlockViewInfo
			
			var objectAttributeInfos:Vector.<AttributeViewInfo>　=　getObjectAttributeInfos();
			
			//收集块信息
			var i:int = 0;
			var tempVec:Vector.<BlockViewInfo> = new Vector.<BlockViewInfo>();
			for (i = 0; i < objectAttributeInfos.length; i++) 
			{
				var blockName:String = objectAttributeInfos[i].block;
				objectBlockInfo = dic[blockName];
				if(objectBlockInfo == null)
				{
					objectBlockInfo = dic[blockName] = new BlockViewInfo();
					objectBlockInfo.name = blockName
					objectBlockInfo.owner = owner;
					tempVec.push(objectBlockInfo);
				}
				objectBlockInfo.itemList.push(objectAttributeInfos[i]);
			}
			
			//按快的默认顺序生成 块信息列表
			var blockDefinition:BlockDefinition;
			objectBlockInfos = new Vector.<BlockViewInfo>();
			var pushDic:Dictionary = new Dictionary();
			var classConfig:ClassDefinition = ObjectViewConfig.instance.getClassConfig(name,false);
			if(classConfig!=null)
			{
				for (i = 0; i < classConfig.blockDefinitionVec.length; i++) 
				{
					blockDefinition = classConfig.blockDefinitionVec[i];
					objectBlockInfo = dic[blockDefinition.name];
					if(objectBlockInfo == null)
					{					
						objectBlockInfo = new BlockViewInfo();
						objectBlockInfo.name = blockDefinition.name;
						objectBlockInfo.owner = owner;
					}
					ClassUtils.deepCopy(objectBlockInfo,blockDefinition);
					objectBlockInfos.push(objectBlockInfo);
					pushDic[objectBlockInfo.name] = true;
				}
			}
			//添加剩余的块信息
			for (i = 0; i < tempVec.length; i++) 
			{
				if(Boolean(pushDic[tempVec[i].name]) == false)
				{
					objectBlockInfos.push(tempVec[i]);
				}
			}
			
			return objectBlockInfos;
		}

		/**
		 * 获取对象界面类定义
		 * @param object		用于生成界面的对象
		 * @return				对象界面类定义
		 */
		private function initComponent():void
		{
			//获取自定义类型界面类定义
			if (component != null && component != "")
				return;

			//返回基础类型界面类定义
			var isBaseType:Boolean = ClassUtils.isBaseType(owner);
			if (isBaseType)
			{
				component = ObjectViewConfig.instance.defaultBaseObjectViewClass;
				return;
			}

			//返回默认类型界面类定义
			component = ObjectViewConfig.instance.defaultObjectViewClass;
		}

		/**
		 * 获取界面
		 */		
		public function getView():DisplayObject
		{
			initComponent();
			
			var view:DisplayObject = ClassUtils.getInstance(component);
			IObjectView(view).data = this;
			return view;
		}
	}
}
