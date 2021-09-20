/**
 * ...
 * @author Prometheus
 */

import osa.graphic.StyleFormat;

class osa.managers.StyleManager
{
	private var _styles:Object = {};
	private var _listeners:Object = {};	
	
	public function StyleManager(defaultFormat:StyleFormat)
	{
		if (_global.StyleManager) return;
		
		_global.StyleManager = this;
		init(defaultFormat);
	}
	
	private function init(defaultFormat:StyleFormat):Void
	{
		if (defaultFormat == undefined) defaultFormat = new StyleFormat();
		
		addStyle("default", defaultFormat)
	}	
	
	public function addStyle(name:String, style:StyleFormat):Void
	{
		_styles[name] = style;
		style.styleReference = name;
	}
	
	public function removeStyle(name:String):Void
	{
		delete _styles[name];
	}
	
	public function style(object:Object):Void
	{
		getStyle(object).addListener(object);
		object.updateStyles();
	}
	
	public function getStyle(object:Object):StyleFormat
	{
		if (object.styleFormatName != undefined)
		{
			if (_styles[object.styleFormatName] != undefined)
			{
				return _styles[object.styleFormatName];
			}
		}
		
		var classes:Array = object.classes;
		
		for (var i:Number = classes.length-1; i > -1; i--)
		{
			if (_styles[classes[i]] != undefined) return _styles[classes[i]];
		}
		
		return _styles["default"]
	}
}