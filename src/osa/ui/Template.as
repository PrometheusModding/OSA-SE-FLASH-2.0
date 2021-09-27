/**
 * 
 */
class osa.ui.Template
{
	private var __uiObject:Function;
	private var __initObject:Object;
	private var __style:String;
	private var __init:Function;
	
	public function Template(uiObject:Function, dataObject:Object, style:String, init:Function) 
	{
		__uiObject = uiObject;
		__initObject = initObject;
		__style = style;
		__init = init;
	}
	
	public function set uiObject(uiObject:Function):Void
	{
		__uiObject = uiObject;
	}
	
	public function get uiObject():Function
	{
		return __uiObject;
	}
	
	public function set initObject(initObject:Object):Void
	{
		__initObject = initObject;
	}
	
	public function get initObject():Object
	{
		return __initObject;
	}
	
	public function set style(style:String):Void
	{
		__style = style;
	}	
	
	public function get style():String
	{
		return __style;
	}
	
	public function set init(init:Function):Void
	{
		__init = init;
	}
	
	public function get init():Function
	{
		return __init;
	}
}