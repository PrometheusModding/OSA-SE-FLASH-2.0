import osa.ui.UIObject;
import osa.graphic.skins.ISkinnable;

/**
 * 
 */ 
class osa.graphic.skins.Skin extends MovieClip implements ISkinnable
{
	private var __width:Number;
	private var __height:Number;
	private var __state:String;
	private var __component:UIObject;
	
	public function Skin() 
	{
		init()
	}
	
	private function init():Void
	{
		__component.addEventListener("restyle", this, "draw");
		setSize(__width, __height);		
	}
	
	function draw():Void {}
	
	public function setSize(w:Number, h:Number):Void
	{
		__width = w;
		__height = h;
		draw();
	}
	
	public function changeState(state:String):Void
	{
		__state = state;
		draw();
	}
	
	public function set width (w:Number):Void { __width = w; }
	public function set height (h:Number):Void { __height = h; }
	public function set state (state:String):Void { __state = state; }
	public function set component (comp:UIObject):Void { __component = comp; }
}