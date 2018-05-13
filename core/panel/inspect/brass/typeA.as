

class core.panel.inspect.brass.typeA{

var o
var m
var description
	
	function typeA(core, main, obj, pos, directory){
		o = core
		m = main
		
		var _font = new TextFormat();
		_font.letterSpacing = 1.5
		_font.font = o.fonts.l
		_font.size = 22
		
					
		var val = obj.attachMovie("fontbox", "title", obj.getNextHighestDepth(), {_y:pos.v, _x:pos.h+(pos.btWidth/2)}).val
		val.htmlText = m.actra.name
		val.setTextFormat(_font);
		val.autoSize = "right";		
		
		pos.v += -25
		
		var _font = new TextFormat();
		_font.letterSpacing = 1.1
		_font.font = o.fonts.l
		_font.size = 9		
					
		val = obj.attachMovie("fontbox", "title", obj.getNextHighestDepth(), {_y:pos.v, _x:pos.h+(pos.btWidth/2)}).val
		val.htmlText = directory
		val.setTextFormat(_font);
		val.autoSize = "right";		
		
		pos.v += -20		
		
		
		
					
		description = obj.attachMovie("fontbox", "title", obj.getNextHighestDepth(), {_y:pos.v, _x:pos.h+(pos.btWidth/2)}).val	
	
		pos.v += -50
	}
	
	function setDescription(descriptionText){
		var _font = new TextFormat();
		_font.letterSpacing = 1.2
		_font.font = o.fonts.l
		_font.size = 16
		
		description.htmlText = descriptionText
		description.setTextFormat(_font);
		description.autoSize = "right";	
	}
	
	
}
