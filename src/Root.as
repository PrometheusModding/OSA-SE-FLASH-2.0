/**
 * ...
 * @author Prometheus
 */

import osa.ui.UIObject;
import osa.views.NavMenuView;
import osa.graphic.Rectangle;
 
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
		createClassObject(Rectangle, "10", 1, {_x:0, _y:0, __initialHeight:100, __initialWidth:100})
		createClassObject(NavMenuView, "navMenuView", 1, {__initialHeight:100, __initialWidth:100});
	}
}