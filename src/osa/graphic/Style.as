/**
 * ...
 * @author Prometheus
 */

import osa.ui.UIObject;
 
class Style extends MovieClip implements osa.graphic.IStyleable
{
	private var _width:Number;
	private var _height:Number;
	private var _state:String;
	private var _component:UIObject;
	
	public function Style() 
	{
		init()
	}
	
	private function init():Void
	{
		_component.addEventListener("restyle", this, "draw");
		setSize(_width, _height);		
	}
	
	function draw():Void {}
	
	public function setSize(w:Number, h:Number):Void
	{
		_width = w;
		_height = h;
		draw();
	}
	
	public function changeState(state:String):Void
	{
		_state = state;
		draw();
	}
	
	public function set width (w:Number):Void { _width = w; }
	public function set height (h:Number):Void { _height = h; }
	public function set state (state:String):Void { _state = state; }
	public function set component (comp:UIObject):Void { _component = comp; }
}