import osa.models.NavMenuModel;
import osa.ui.Template;
import osa.ui.UIObject;
import osa.ui.UIBase;
import osa.ui.components.ListView;

/**
 * 
 */
class osa.views.NavMenuView extends UIObject
{
	private var __model:NavMenuModel;
	private var __controller:Object;
	private var __tabs:ListView;
	private var __pages:ListView;
	private var __options:ListView;
	
	public function NavMenuView(model:NavMenuModel, controller:Object) 
	{
		__model = model;
		__model.registerView(this);
		__controller = controller;
	}
	
	private function init():Void
	{
		super.init();
		var func:Function = function(item:Tab, template:Template):Void{template.initObject.graphic = item.icon};
		__tabs = ListView(createClassObject(ListView, "Tabs", 0, {itemsTemplate:new Template(UIBase, {initialHeight:100, initialWidth:100, graphics:"mystring"}, "", func)}));
		__tabs.addEventListener("selectionChanged", __controller, "onTabChanged");
		initLayout();
	}
	
	private function initLayout()
	{
		for (int i = 0; i < __model.scene.Tabs; i++)
		{
			
		}
		__tabs.setItems(__model.scene.Tabs, {graphics:});
		__pages.items = __model.activeTab.Pages;
		__options.items = __model.activePages.Options;
	}
	
	public function update(event:Object):Void
	{
		switch(event.operation)
		{
			case "SceneChanged":
				initLayout();
				break;
		}
	}
}