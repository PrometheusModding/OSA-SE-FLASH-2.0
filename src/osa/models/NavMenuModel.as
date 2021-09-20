/**
 * ...
 * @author Prometheus
 */

import osa.core.Observer;
import osa.data.Scene;
 
class osa.models.NavMenuModel extends Observer
{
	
	private var _scene:Scene;
	
	public function NavMenuModel() 
	{
		
	}
	
	public function registerView(view:Object):Void
	{
		super.addSubscriber(view);
	}
	
	public function set scene(scene:Scene)
	{
		_scene = scene;
		super.notifyChanges({operation:"SceneChanged"});
	}
}