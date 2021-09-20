/**
 * ...
 * @author Prometheus
 */

import osa.models.NavMenuModel;
import osa.ui.UIObject;
import osa.ui.components.DockPanel;
import osa.graphic.Rectangle;

class osa.views.NavMenuView extends UIObject
{
	private var _model:NavMenuModel;
	private var _controller:Object;
	
	public function NavMenuView(model:NavMenuModel, controller:Object) 
	{
		_model = model;
		_model.registerView(this);
		_controller = controller;
	}
	
	private function init():Void
	{
		super.init();
		initLayout();
	}
	
	private function initLayout()
	{
		var tabs:DockPanel = DockPanel(createClassObject(DockPanel, "Tabs", null, {__initialHeight:100, __initialWidth:100, orientation:0}))
		tabs.createClassObject(Rectangle, "1", null, {__initialHeight:100, __initialWidth:100})
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