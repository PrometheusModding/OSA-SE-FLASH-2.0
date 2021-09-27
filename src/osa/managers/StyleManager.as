import osa.graphic.StyleFormat;
import osa.ui.UIObject;

/**
 *
 */
class osa.managers.StyleManager
{
	private var __styles:Object = {};
	private var __listeners:Object = {};	
	
	public function StyleManager(defaultFormat:StyleFormat)
	{
		if (_global.StyleManager) return;
		
		_global.StyleManager = this;
		init(defaultFormat);
	}
	
	private function init(defaultFormat:StyleFormat):Void
	{
		if (defaultFormat == undefined) defaultFormat = new StyleFormat();
		
		addStyle("default", defaultFormat);
	}	
	
	public function addStyle(name:String, style:StyleFormat):Void
	{
		__styles[name] = style;
		style.styleReference = name;
	}
	
	public function removeStyle(name:String):Void
	{
		delete __styles[name];
	}
	
	public function style(object:UIObject):Void
	{
		getStyle(object).addListener(object);
		object.updateStyles();
	}
	
	public function getStyle(object:UIObject):StyleFormat
	{
		if (object.styleFormatName != undefined && object.styleFormatName != "")
		{
			if (__styles[object.styleFormatName] != undefined)
			{
				return __styles[object.styleFormatName];
			}
		}
		
		var classes:Array = object.classes;
		
		for (var i:Number = classes.length - 1; i > -1; i--)
		{
			if (__styles[classes[i]] != undefined)
			{
				return __styles[classes[i]];
			}
		}
		
		return __styles["default"];
	}
}