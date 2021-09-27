import osa.ui.UIObject;
import osa.ui.components.DockPanel;
import osa.ui.Template;

/**
 *
 */
class osa.ui.components.ListView extends UIObject
{
	private var __items:Array;
	private var __itemsPanel:DockPanel;
	private var __itemsTemplate:Template;
	private var __selectedItem:Number;
	
	public function ListView() {}
	
	private function init()
	{
		super.init();
		__items = [];
		__itemsPanel = DockPanel(createClassObject(DockPanel, "ItemsPanel", null, {orientation:1}));
		__selectedItem = 0;
	}
	
	public function addItem(item:Object):Void
	{
		if (item == undefined) return;
		__itemsTemplate.init(item, __itemsTemplate);
		__items.push(item);
		var uiObject:UIObject = __itemsPanel.createClassObject(__itemsTemplate.uiObject, (__items.length - 1).toString(), null, __itemsTemplate.initObject);
	}
	
	public function navigate(direction:String):Void
	{
		switch(direction)
		{
			case "forward":
				if (__selectedItem < __items.length - 1) __selectedItem++;
				break;
			case "backwards":
				if (0 < __selectedItem) __selectedItem--;
				break;
		}
		
		dispatchEvent("selectionChanged", {selectedItem:selectedItem});
	}
	
	public function setItems(items:Array, initObject:Object):Void
	{
		__items = new Array();
		
		for (i = 0; i < items.length; i++)
		{
			addItem(items[i], initObject)
		}
	}
	
	public function set itemsTemplate(itemsTemplate:Template):Void
	{
		__itemsTemplate = itemsTemplate;
	}
	
	public function get itemsTemplate():Template
	{
		return __itemsTemplate;
	}
	
	public function get selectedItem():Object
	{
		return __items[__selectedItem];
	}
	
	public function get selectedItemIndex():Number
	{
		return __selectedItem;
	}
}