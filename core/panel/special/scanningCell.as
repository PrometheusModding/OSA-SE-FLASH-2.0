

class core.panel.special.scanningCell extends MovieClip {

public var o

var scanner
var ticks
var scanningText

var G1
var G2
var G3
var G4

var G3DIR

	function scanningCell(){	
	_xscale = 30
	_yscale = 30
	
	G3DIR = -1
	ticks = 0
	scanner = this.createEmptyMovieClip("scannermov", this.getNextHighestDepth(), {_xscale:50, _yscale:50})
	G1 = scanner.attachMovie("scanningCell_G1", "scanG1", scanner.getNextHighestDepth(), {_x:0, _y:0, _alpha:0})
	G2 = scanner.attachMovie("scanningCell_G2", "scanG2", scanner.getNextHighestDepth(), {_x:0, _y:0, _alpha:0})
	G3 = scanner.attachMovie("scanningCell_G3", "scanG3", scanner.getNextHighestDepth(), {_x:0, _y:0, _alpha:0, _xscale:150, _yscale:150})
	G4 = scanner.attachMovie("scanningCell_G4", "scanG4", scanner.getNextHighestDepth(), {_x:0, _y:0, _alpha:0})
	
	var type = new TextFormat();
	type.letterSpacing = 1.5
	type.font = o.fonts.m
	type.size = 25
				
	scanningText = this.attachMovie("genericText", "scanningText", this.getNextHighestDepth(), {_x:80, _y:120, _alpha:0})
	scanningText.val.htmlText = o.cfg.lang.scanningForCharacters.toUpperCase()
	scanningText.val.setTextFormat(type);
	scanningText.val.autoSize = "center";
	}
	


	function onFrame(){
	ticks++
	if(ticks<=20){
	   G1._alpha+=2
	   G2._alpha+=2
	   G3._alpha+=2
	   G4._alpha+=2	  
	}
		
		
	  if(G3._xscale <= 50){
	  G3DIR = 1}
	  else if(G3._xscale >= 105){
	  G3DIR = -1	  
	  }
	  
	  G3._xscale+=(3*G3DIR)
	  G3._yscale+=(3*G3DIR)
	
	if(ticks>20&&ticks<=55){
	   G1._alpha+=1
	   G2._alpha+=2
	   G3._alpha-=.25
	   G4._alpha-=.25
	}
	if(scanner._xscale<=130){
	scanner._xscale+=.2
	scanner._yscale+=.2
	G4._yscale+= .2
	G4._xscale+= .2
	
		if(ticks>55){
	   G1._alpha-= 2	
	   G2._alpha-= 5
	   G3._alpha-= .5
	   G4._alpha-= .5
		}
	   if(ticks>100){
		this.removeMovieClip()
	    }
	}
	
	if(scanningText._alpha<=60&&ticks<=55){
	   scanningText._alpha+=5
	}else if(ticks>55){
		scanningText._alpha-=2
	}
	}

}