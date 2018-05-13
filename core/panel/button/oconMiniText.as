

class core.panel.button.oconMiniText extends MovieClip {

public var o
public var m
public var dataO
public var posO
public var btGlobal

var base
var sele
var title

var textWidth
var textHeight

	function oconMiniText(){
		base = this.attachMovie("fontbox", "option", this.getNextHighestDepth())	
		base.val.htmlText = dataO.tx.desc
		base.val.setTextFormat(btGlobal._font);
		base.val.autoSize = "right";		
		textWidth = base.val._width
		textHeight = base.val._height
	}	
	
	function light(){
		sele = underline(this.createEmptyMovieClip("sele", this.getNextHighestDepth()), textWidth, textHeight, 5, btGlobal.lineThickness, btGlobal.lineColor)		
	}
	
	function underline(obj, w, h, p, lineThick, lineColor){
		obj.lineStyle(lineThick, lineColor, 100, true, "none", "round", "miter", 1);
			obj.moveTo(0, p);
			obj.lineTo(-w, p);			
			return obj
	}
	
	function dim(){
		sele.removeMovieClip()
	}	

}