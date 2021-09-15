/**
 * ...
 * @author Prometheus
 */

import osa.core.IEventDispatcher;

class osa.core.Broadcaster implements IEventDispatcher
{
	private var _listeners:Array;

	public function Broadcaster()
	{
		init();
	}

	private function init():Void
	{
		_listeners = [];
	}

	public function addEventListener(event:String, listener:Object, mappedTo:String):Boolean
	{
		for (var i in _listeners)
		{
			if (_listeners[i].event == event &&
			_listeners[i].listener == listener) return false;
		}
		
		_listeners.push({event:event, listener:listener, mappedTo:mappedTo});
		
		return true;
	}
	
	public function removeEventListener(event:String, listener:Object):Boolean
	{
		for (var i = 0; i < _listeners.length; i++)
		{
			if (_listeners[i].event == event &&
			_listeners[i].listener == listener)
			{
				_listeners.splice(i, 1);
				
				return true;
			}
		}
		
		return false;
	}
	
	public function dispatchEvent(event:String, params:Object):Void
	{
		var eventObject = {type:event, parameteres:params};
		
		for (var i:String in _listeners)
		{
			if (_listeners[i].event == event)
			{
				_listeners[i].listener[event](eventObject);
				_listeners[i].listener[_listeners[i].mappedTo](eventObject);
			}
		}
		
		this[event + "Handler"](eventObject);
	}
}