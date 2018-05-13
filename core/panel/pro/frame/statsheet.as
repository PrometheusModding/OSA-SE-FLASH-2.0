

class core.panel.pro.frame.statsheet extends MovieClip
{
public var o
public var actra
public var xml
public var frame
public var prodat

public var profileMode
public var horizon
var panel

var _fonts

var VPin
var VPinCount

var HPoint
var VPinMax
var HPinPush

var varText
var valText
var headerText


var lastHeader
var headerCount 

			function statsheet(){	
				panel = this
				headerCount = false				
			}
			
			public function vsplit(){
			
				VPinCount = 0
				VPin = []

				VPinMax = 8
				HPinPush = 135
				HPoint = horizon
				
				VPin[0] = -200
				VPin[1] = -175
				VPin[2] = -150
				VPin[3] = -125
				VPin[4] = -100
				VPin[5] = -75
				VPin[6] = -50
				VPin[7] = -25
				VPin[8] = 0
				
				makeOverlay()				
			
			}
		
			function getVPin(): Number{
			if(VPinCount > VPinMax){
			VPinCount = 0
			HPoint-=HPinPush}
			
			VPinCount++
			return VPin[VPinCount-1]
			}
			
			
			function makeOverlay(){
			
	
				_fonts = {t:undefined, v:undefined}
				_fonts.t
				_fonts.v
				_fonts.t = new TextFormat();
				_fonts.t.letterSpacing = 1.2
				_fonts.t.font = o.fonts.l
				
				_fonts.v = new TextFormat();
				_fonts.v.letterSpacing = 1.2
				_fonts.v.font = o.fonts.m
	
								
				_fonts.h = new TextFormat();
				_fonts.h.letterSpacing = 1
				_fonts.h.font = o.fonts.l 

				for (var i=0; i < frame.stat.length; i++){
					core.panel.pro.util.profunc.createStatPair(o, panel, frame.stat[i])
									
				}
				
			}

			
			
				
				
			

}