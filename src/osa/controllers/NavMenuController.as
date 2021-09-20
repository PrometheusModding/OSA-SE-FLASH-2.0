/**
 * ...
 * @author Prometheus
 */

class osa.controllers.NavMenuController
{
	private var _model:Object;
	
	public function NavMenuController(model:Object) 
	{
		_model = model;
	}
	
	public function changeTab(n:Number)
	{
		_model.changeTab
	}
}