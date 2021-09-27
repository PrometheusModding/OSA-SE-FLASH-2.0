import osa.ui.UIObject;
import osa.ui.UIBase;
import osa.views.NavMenuView;

/**
 * 
 */
class Root extends UIObject
{
	public function Root() {}
	
	private function init():Void
	{
		super.init();		
		initLayout();
	}
	
	private function initLayout():Void
	{
		createClassObject(NavMenuView, "navMenuView", null, {});
	}
}