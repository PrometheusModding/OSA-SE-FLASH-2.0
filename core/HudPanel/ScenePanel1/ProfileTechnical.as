

class ProfileTechnical extends MovieClip
{
	
public var o
public var dia
public var actra
public var proDat
public var profileMode
public var horizon

var yLoc
var hPad

var typeVal
var typeVar

			public function ProfileTechnical(){	
				
			}
			
			public function buildFull(){
			
				yLoc = -11
				hPad = 75 
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
				
						
				
				
				
				
				
				cur = makePairA(o.cfg.lang.modName, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.modShort
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				var yShift = -17
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.mod, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.mod
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
							
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.hex, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.hex
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.osid, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.osid
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.trueid, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.trueID
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.formid, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.id
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.isPlayer, typeVal, hPad, horizon, yLoc)
				
				if(actra.isPlayer==1){cur.htmlText = o.cfg.lang.yes}
				else{cur.htmlText = o.cfg.lang.no}
				
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.voice, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.voiceType			
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.skyRace, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.race			
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.gender, typeVal, hPad, horizon, yLoc)
				
				if(actra.gender==1){cur.htmlText = o.cfg.lang.female}
				else{cur.htmlText = o.cfg.lang.male}
				
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += -50
				
				
				typeVar = new TextFormat();
				typeVar.letterSpacing = 1.1
				typeVar.font = o.fonts.l
				typeVar.size = 10
				
				typeVal = new TextFormat();
				typeVal.letterSpacing = 1.1
				typeVal.font = o.fonts.m
				typeVal.size = 11
				
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc-15}).val					
				cur.htmlText = o.cfg.lang.personaDirectory
				cur.setTextFormat(typeVar);
				cur.autoSize = "right";
				
				cur = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val
				cur.htmlText = "o.omfixDir+"OSA/Persona/"+actra.folder
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += -40
				
				
				typeVar = new TextFormat();
				typeVar.letterSpacing = 1.1
				typeVar.font = o.fonts.l
				typeVar.size = 10
				
				typeVal = new TextFormat();
				typeVal.letterSpacing = 1.1
				typeVal.font = o.fonts.m
				typeVal.size = 13
				
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc-15}).val					
				cur.htmlText = o.cfg.lang.skyName
				cur.setTextFormat(typeVar);
				cur.autoSize = "right";
				
				cur = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val
				cur.htmlText = actra.skyName
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
			}


			function makePairA(entryName, typeFace, hPadding, xLoc, yLocation){
				var valBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:xLoc-hPadding, _y:yLocation}).val					
				valBox.htmlText = entryName
				valBox.setTextFormat(typeVar);
				valBox.autoSize = "right";
				

				return this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:xLoc, _y:yLocation}).val					
			}
				
				
			

}