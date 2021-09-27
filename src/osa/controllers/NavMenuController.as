/**
 * 
 */
class osa.controllers.NavMenuController
{
	private var __model:Object;
	
	public function NavMenuController(model:Object) 
	{
		__model = model;
	}
	
	private function onTabChanged(infoObject:Object):Void
	{		
		__model.activeTab = infoObject.parameters.selectedItem;
	}
}