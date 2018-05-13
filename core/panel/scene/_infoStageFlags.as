

class core.panel.scene._infoStageFlags extends MovieClip
{
	
public var o
public var m
public var dia
public var actra

var panel
var horizon
var yLoc
var hPad

var typeVar
var typeVal



			public function _infoStageFlags(){	
				horizon =-10
				yLoc = -11
				hPad = 95 
				
				panel = this
				makeOverlay()			
			}
			
			function makeOverlay(){
				
				
				typeVar = new TextFormat();
				typeVar.letterSpacing = 1.1
				typeVar.font = o.fonts.l
				typeVar.size = 8.5
				
				typeVal = new TextFormat();
				typeVal.letterSpacing = 1.1
				typeVal.font = o.fonts.m
				typeVal.size = 8.5
				
				var cur
				var yShift = -16		
						
				cur = makePairA("approachAngle", typeVal, hPad, horizon, yLoc)
				cur.htmlText = dia.flags.approachAngle
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA("loc", typeVal, hPad, horizon, yLoc)
				if(!dia.flags.loc){cur.htmlText = "None"}
				else{cur.htmlText = dia.flags.loc}
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA("xfer", typeVal, hPad, horizon, yLoc)
				if(!dia.flags.xfer){cur.htmlText = "None"}
				else{cur.htmlText = dia.flags.xfer}
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				
				OADraw.OLine(this, 0, 0, 0, yLoc-10, "0xFFFFFF", .25)			
			}
			
			
			
			function makePairA(entryName, typeFace, hPadding, xLoc, yLocation){
				var valBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:xLoc-hPadding, _y:yLocation}).val					
				valBox.htmlText = entryName
				valBox.setTextFormat(typeVar);
				valBox.autoSize = "right";
				

				return this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:xLoc, _y:yLocation}).val					
			}
					

			
}