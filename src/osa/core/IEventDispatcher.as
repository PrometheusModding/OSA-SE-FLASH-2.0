/**
 * ...
 * @author Prometheus
 */

interface osa.core.IEventDispatcher 
{
	public function dispatchEvent(event:String, params:Object):Void;
	
	public function addEventListener(event:String, listener:Object, mappedTo:String):Boolean;
	
	public function removeEventListener(event:String, listener:Object):Boolean;
}