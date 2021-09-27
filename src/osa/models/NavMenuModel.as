import osa.core.Observer;
import osa.data.Scene;

/**
 * 
 */
class osa.models.NavMenuModel extends Observer
{
	
	private var __scene:Scene;
	private var __activeTabs
	
	public function NavMenuModel() 
	{
		
	}
	
	public function registerView(view:Object):Void
	{
		super.addSubscriber(view);
	}
	
	public function set scene(scene:Scene)
	{
		__scene = scene;
		super.notifyChanges({operation:"SceneChanged"});
	}
}