/**
 * ...
 * @author Prometheus
 */

dynamic class osa.graphic.StyleFormat
{
	public var name:String;
	//Hex
	public var background:Number;
	public var face:Number;
	public var border:Number;
	public var highlight:Number;
	public var selected:Number;
	public var textFormat:TextFormat;
	public var _listeners:Array = [];
	
	public function StyleFormat(name:String) 
	{
		init(name);
	}
	
	private function init(nm:String):Void
	{
		name = nm;
		// Default Hex values...
		textFormat = new TextFormat("Arial", 12);
	}
	
	public function addListener(listener:Object):Void
	{
		listener.styleFormat.removeListener(listener);
		listener.styleFormat = this;
		
		for (var i:String in _listeners)
		{
			if (_listeners[i] == listener) return;
		}
		
		_listeners.push(listener);
	}
	
	public function removeListener(listener:Object):Void
	{
		var length:Number = _listeners.length;
		
		for (var i:Number = 0; i < length; i++)
		{
			if (_listeners[i] == listener)
			{
				_listeners.splice(i, 1);
				break;
			}
		}
		
		delete listener.styleFormat;
	}
	
	public function updateStyles():Void
	{
		for (var i:String in _listeners)
		{
			_listeners[i].updateStyles();
		}
	}
}