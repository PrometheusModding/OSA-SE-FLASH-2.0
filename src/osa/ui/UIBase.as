/**
 * ...
 * @author Prometheus
 */

import osa.ui.UIObject;
 
class osa.ui.UIBase extends UIObject
{
	private var className = "UIBase"
	private var _graphicMC:MovieClip;
	private var _baseGraphic:String;
	private var _state:String;
	
	static public var defaultGraphic:String = "Default Graphic"
	
	public function UIBase() {}
	
	private function init():Void
	{
		super.init();
		attachGraphics();
	}
	
	private function attachGraphics():Void 
	{
		var initObject:Object = {width:_width, height:_height, state:_state, component:this};
		var graphic:String = getGraphic("_baseGraphic")
		
		createObject(_baseGraphic, "_graphicMC", 0, initObject);
	}
	
	private function resolveGraphic(graphic:String):String
	{
		return UIBase.defaultGraphic;
	}
	
	public function setSize(w:Number, h:Number):Void
	{
		super.setSize(w, h);
		_graphicMC.setSize(_width, _height)
	}
	
	public function get graphic():String
	{
		return _baseGraphic;
	}
	
	public function set graphic(graphic:String):Void
	{
		_baseGraphic = graphic;
		attachGraphics();
	}
	
	public function get state():String
	{
		return _state;
	}
	
	public function set state(state:String):Void
	{
		_state = state;
		_graphicMC.changeState(_state);
	}
	
	// needs to be implemented on graphic elements
	/*private function changeState(s:String):Void
	{		
		state = s;
		drawRectangle();		
	}
	
	function drawRectangle() {}
	*/
}