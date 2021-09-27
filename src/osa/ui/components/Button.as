import osa.graphic.StyleFormat;
import osa.ui.UIBase;
import osa.ui.UIObject;
import osa.ui.components.Button;

/**
 * 
 */
class osa.ui.components.Button extends UIObject
{
	static public var className:String = "Button";
	
	private var __baseGraphic:String;
	private var __graphicBase:UIBase;	
	
	static public var defaultGraphic:String;
	
	public function Button() {}
	
	private function init()
	{
		super.init();
		__classes.push(Button.className);
		_global.StyleManager.style(this);
		attachGraphics();
	}
	
	private function attachGraphics():Void
	{
		createClassObject(UIBase, "__graphicBase", 0, 
		{
			initialWidth:__width, initialHeight:__height, graphic: getGraphic("__baseGraphic"), styleFormatName:styleFormat.styleReference
		});
	}
	
	private function resolveGraphic(graphic:String)
	{
		return Button.defaultGraphic;
	}
	
	private function click()
	{		
		dispatchEvent("click");
	}
	
	public function set graphic(graphic:String):Void
	{
		__baseGraphic = graphic;
		__graphicBase.graphic = graphic;
	}
	
	public function get graphic():String
	{
		return __baseGraphic;
	}
	
	public function updateStyles(style:StyleFormat):Void
	{
		super.updateStyles(style);
		__baseGraphic.updateStyles(styleFormat);
	}
	
}