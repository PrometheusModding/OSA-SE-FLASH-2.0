import osa.graphic.skins.ISkinnable;
import osa.ui.UIObject;

/**
 * 
 */
class osa.ui.UIBase extends UIObject
{
	private static var className:String = "UIBase";
	
	private var __graphicMC:ISkinnable;
	private var __baseGraphic:String;
	private var __state:String;
	
	static public var defaultGraphic:String = "Default Graphic";
	
	public function UIBase() {}
	
	private function init():Void
	{
		super.init();
		__classes.push(UIBase.className);
		_global.StyleManager.style(this);
		attachGraphics();
	}
	
	private function attachGraphics():Void 
	{
		var initObject:Object = {width:__width, height:__height, state:__state, component:this};
		var graphic:String = getGraphic("__baseGraphic");
		createObject(graphic, "__graphicMC", 0, initObject);
	}
	
	private function resolveGraphic(graphic:String):String
	{
		return UIBase.defaultGraphic;
	}
	
	public function setSize(w:Number, h:Number):Void
	{
		super.setSize(w, h);
		__graphicMC.setSize(__width, __height);
	}
	
	public function get graphic():String
	{
		return __baseGraphic;
	}
	
	public function set graphic(graphic:String):Void
	{
		__baseGraphic = graphic;
		attachGraphics();
	}
	
	public function get state():String
	{
		return __state;
	}
	
	public function set state(state:String):Void
	{
		__state = state;
		__graphicMC.changeState(__state);
	}
}