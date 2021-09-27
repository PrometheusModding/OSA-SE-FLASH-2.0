import osa.core.IEventDispatcher;

/**
 *  
 */
class osa.core.Broadcaster implements IEventDispatcher
{
	private var __listeners:Array;

	public function Broadcaster()
	{
		init();
	}

	private function init():Void
	{
		__listeners = [];
	}

	public function addEventListener(event:String, listener:Object, mappedTo:String):Boolean
	{
		for (var i:String in __listeners)
		{
			if (__listeners[i].event == event &&
			__listeners[i].listener == listener) return false;
		}
		
		__listeners.push({event:event, listener:listener, mappedTo:mappedTo});
		
		return true;
	}
	
	public function removeEventListener(event:String, listener:Object):Boolean
	{
		for (var i = 0; i < __listeners.length; i++)
		{
			if (__listeners[i].event == event &&
			__listeners[i].listener == listener)
			{
				__listeners.splice(i, 1);
				
				return true;
			}
		}
		
		return false;
	}
	
	public function dispatchEvent(event:String, params:Object):Void
	{
		var eventObject = {type:event, parameters:params};
		
		for (var i:String in __listeners)
		{
			if (__listeners[i].event == event)
			{
				__listeners[i].listener[event](eventObject);
				__listeners[i].listener[__listeners[i].mappedTo](eventObject);
			}
		}
		
		this[event + "Handler"](eventObject);
	}
}