

class core.panel.help.helpIconAndText extends MovieClip {

public var o


var base
var icon
var textBox


	function helpIconAndText(){

	}	
	
	function basicR(txt, txtSize, txtSpace, txtType, ico, xs){
		icon = this.attachMovie(ico, "ico", this.getNextHighestDepth(), {_xscale:xs, _yscale:xs})
		
		textBox = this.attachMovie("fontbox", "option", this.getNextHighestDepth(), {_x:-icon._width})
	
		var _font = new TextFormat();
		_font.letterSpacing = txtSpace
		_font.font = txtType
		_font.size = txtSize
		
		textBox.val.htmlText = txt
		textBox.val.setTextFormat(_font);
		textBox.val.autoSize = "right";		
	}


}