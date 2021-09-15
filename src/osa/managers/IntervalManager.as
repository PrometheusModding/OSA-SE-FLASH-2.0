/**
 * ...
 * @author Prometheus
 */

class osa.managers.IntervalManager 
{
	static private var _listeners:Object = {};
	static private var _intervalID:Number = 0;
	
	public function IntervalManager() {};
	
	static public function setInterval(connection:Object, intName:String, path:Object, func:String,	time:Number):Void
	{
		clearInterval(connection, intName);
		
		if (connection instanceof MovieClip)
		{
			if (_listeners[connection] == undefined)
			{
				_listeners[connection] = {};
			}
			
			_listeners[connection][intName] = _global.setInterval(path, func, time)
		} 
		else 
		{
			if (connection.intervalID == undefined)
			{
				connection.intercvalID = "int" + (_intervalID++);
			}
			
			_listeners[connection.intervalID] = {};
			_listeners[connection][intName] = _global.setInterval(path, func, time)
		}
	}
	
	static public function clearInterval(connection:Object, intName:String):Void
	{
		if (connection instanceof MovieClip)
		{
			_global.clearInterval(_listeners[connection][intName]);
		}
		else
		{
			_global.clearInterval(_listeners[connection.intervalID][intName])
		}
	}
}