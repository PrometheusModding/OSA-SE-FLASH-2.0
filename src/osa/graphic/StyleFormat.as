/**
 * 
 */
dynamic class osa.graphic.StyleFormat
{
	private var __listeners:Array = [];
	
	public var name:String;
	public var background:Number;
	public var face:Number;
	public var border:Number;
	public var highlight:Number;
	public var selected:Number;
	public var shadow:Number;
	public var textFormat:TextFormat;
	public var styleReference:String;	
	
	public function StyleFormat(name:String) 
	{
		init(name);
	}
	
	private function init(nm:String):Void
	{
		name = nm;
		background = 0x454545;
		face = 0x999999;
		border = 0x000000;
		highlight = 0xFFFFFF;
		shadow = 0x666666;
		selected = 0xCCCCCC;
		textFormat = new TextFormat("Arial", 12);
	}
	
	public function addListener(listener:Object):Void
	{
		listener.styleFormat.removeListener(listener);
		listener.styleFormat = this;
		
		for (var i:String in __listeners)
		{
			if (__listeners[i] == listener) return;
		}
		
		__listeners.push(listener);
	}
	
	public function removeListener(listener:Object):Void
	{
		var length:Number = __listeners.length;
		
		for (var i:Number = 0; i < length; i++)
		{
			if (__listeners[i] == listener)
			{
				__listeners.splice(i, 1);
				break;
			}
		}
		
		delete listener.styleFormat;
	}
	
	public function updateStyles():Void
	{
		for (var i:String in __listeners)
		{
			__listeners[i].updateStyles();
		}
	}
}