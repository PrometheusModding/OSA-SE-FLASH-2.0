

class core.panel.special.areYouSure extends MovieClip {

public var o
var _font1

var text1
	function areYouSure(){	
		
		_font1 = new TextFormat();
		_font1.letterSpacing = 1.2
		_font1.font = o.fonts.m
		_font1.size = 12

		_font2 = new TextFormat();
		_font2.letterSpacing = 1.0
		_font2.font = o.fonts.m
		_font2.size = 6
		
		_font3 = new TextFormat();
		_font3.letterSpacing = 1.2
		_font3.font = o.fonts.m
		_font3.size = 12

		
	}
	
	function osa1(){
		var brass = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "brass", this.getNextHighestDepth())
		
		text1 = this.attachMovie("fontboxCentra", "text1", this.getNextHighestDepth())
		
		text1.val.htmlText = "FUCK YOU"
		text1.val.setTextFormat(_font1);
		
		
	}

}