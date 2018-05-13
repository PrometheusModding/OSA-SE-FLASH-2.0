

class core.panel.special.inspecting extends MovieClip {

public var o
public var actraName
var eye
var tick
var inspectText
var nameText

	function inspecting(){	
	_x = Stage.width - 75
	_y = Stage.height - 75
	_xscale = 30
	_yscale = 30
	tick = 1
	eye = this.attachMovie("inspectingEye", "inspectingEye", this.getNextHighestDepth(), {_x:0, _y:0, _alpha:0})	
	
	
	var type = new TextFormat();
	type.letterSpacing = 1.5
	type.font = o.fonts.l
	type.size = 26
				
	inspectText = this.attachMovie("genericText", "inspecttext", this.getNextHighestDepth(), {_x:80, _y:60, _alpha:0})
	nameText = this.attachMovie("genericText", "nametext", this.getNextHighestDepth(), {_x:80, _y:95, _alpha:0})
	inspectText.val.htmlText = o.cfg.lang.inspecting.toUpperCase()
	inspectText.val.setTextFormat(type);
	inspectText.val.autoSize = "center";
	nameText.val.htmlText = actraName.toUpperCase()
	type.font = o.fonts.m
	type.size = 29
	nameText.val.setTextFormat(type);
	nameText.val.autoSize = "center";
	}
	
	 
	function onFrame(){
	if(eye._alpha<=60){
	   eye._alpha+=6
	}

	if(eye._xscale<=130){
	eye._xscale+=.2
	eye._yscale+=.2
	}else{
		this.removeMovieClip()
	}
	
	if(inspectText._alpha<=60){
	   inspectText._alpha+=5
	   nameText._alpha+=5
	}
	}

}