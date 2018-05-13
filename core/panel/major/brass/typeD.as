

class core.panel.major.brass.typeD {

var description
var subText
var o

	function typeD(core, obj, pos, directory, targO){
		o = core		
		var _font = new TextFormat();
		_font.letterSpacing = 1.2
		_font.font = o.fonts.l
		_font.size = 10	
					
		var val = obj.attachMovie("fontbox", "title", obj.getNextHighestDepth(), {_y:pos.v, _x:pos.h+(pos.btWidth/2)}).val
		val.htmlText = directory.toUpperCase()
		val.setTextFormat(_font);
		val.autoSize = "right";		
		
		pos.v += -20		
		
		subText = obj.attachMovie("fontbox", "title", obj.getNextHighestDepth(), {_y:pos.v, _x:pos.h+(pos.btWidth/2)}).val	
		
		pos.v += -25	
		
		description = obj.attachMovie("fontbox", "title", obj.getNextHighestDepth(), {_y:pos.v, _x:pos.h+(pos.btWidth/2)}).val	
	
		pos.v += -50
	}
	
	function setDescription(descriptionText){
		var _font = new TextFormat();
		_font.letterSpacing = 1.2
		_font.font = o.fonts.l
		_font.size = 19
		
		description.htmlText = descriptionText
		description.setTextFormat(_font);
		description.autoSize = "right";	
	}
	
	function setSubText(_subText){
		var _font = new TextFormat();
		_font.letterSpacing = 1.2
		_font.font = o.fonts.l
		_font.size = 14
		
		subText.htmlText = _subText
		subText.setTextFormat(_font);
		subText.autoSize = "right";	
	}
	
	
}