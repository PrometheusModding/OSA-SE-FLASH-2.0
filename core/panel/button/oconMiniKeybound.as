

class core.panel.button.oconMiniKeybound extends MovieClip {

public var o

public var keyBind
public var keyChar

	function oconMiniKeybound(){
		
		var _font = new TextFormat();
		_font.letterSpacing = .8
		_font.font = o.fonts.m
		_font.size = 16
				
		keyChar = this.attachMovie("fontboxCentra", "keyChar", this.getNextHighestDepth())
	
		keyChar.val.htmlText = keyBind
		keyChar.val.setTextFormat(_font);
		keyChar.val.autoSize = "center";
	}	

	

}