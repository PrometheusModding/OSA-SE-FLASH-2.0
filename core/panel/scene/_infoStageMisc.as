

class core.panel.scene._infoStageMisc extends MovieClip
{
	
public var o
public var m
public var dia
public var actra

var panel
var horizon
var yLoc
var hPad
var hPadB

var typeVar
var typeVal

var typeVarB
var typeValB


			public function _infoStageMisc(){	
				horizon =-10
				yLoc = -11
				hPad = 95 
				hPadB = 20
				
				panel = this
				makeOverlay()			
			}
			
			function makeOverlay(){
				
				var typeSpecial
				
				typeVar = new TextFormat();
				typeVar.letterSpacing = 1.1
				typeVar.font = o.fonts.l
				typeVar.size = 8.5
				
				typeVal = new TextFormat();
				typeVal.letterSpacing = 1.1
				typeVal.font = o.fonts.m
				typeVal.size = 8.5
				
				typeVarB = new TextFormat();
				typeVarB.letterSpacing = 1.1
				typeVarB.font = o.fonts.l
				typeVarB.size = 10
				
				typeValB = new TextFormat();
				typeValB.letterSpacing = 1.1
				typeValB.font = o.fonts.m
				typeValB.size = 10
				
				var cur
				var yShift = -16		
				
				
				for (var i=0; i < dia.actra.length; i++) {
					cur = makePairA("Actra "+i+": ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.actra[i].name +" | "+dia.actra[i].id
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
				
					yLoc += yShift
				
				
				}
				
				
				yLoc += -6
				
				cur = makePairA("Actra Length: ", typeValB, hPadB, horizon, yLoc)
					cur.htmlText = dia.actra.length
					cur.setTextFormat(typeVarB);
					cur.autoSize = "right";
								
				
				yLoc += yShift				
				yLoc += -12
				
				typeSpecial = new TextFormat();
				typeSpecial.letterSpacing = 1.2
				typeSpecial.font = o.fonts.m
				typeSpecial.size = 16
				
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Actra Array"
				cur.setTextFormat(typeSpecial);
				cur.autoSize = "right";
				

				yLoc += -15
						
				yLoc += yShift				
					cur = makePairA("PlayerIs: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.playerIs
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("PlayerActor: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.playerActor
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("PlayerEye: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.playerEye
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("ActraReady: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.actraReady
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("ActraReady: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.stageReady
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				//QUE MODULES
				
				yLoc += yShift				
					cur = makePairA("lastScene: ", typeVal, hPad+100, horizon, yLoc)
					cur.htmlText = "Ex. ID: "+dia.lastScene.id
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";

				yLoc += yShift				
					cur = makePairA("transitionLock: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.transitionLock
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("navReady: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.navReady
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("arrangeLock: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.arrangeLock
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("preSync: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.preSync
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("isStageSet: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.isStageSet
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("isNavApplicable: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.isNavApplicable
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("isSceneApplicable: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.isSceneApplicable
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("observed: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.observed
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("CMD: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.CMD
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("waiting: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.waiting
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("waitTime: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.waitTime
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("stageAlive: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.stageAlive
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
				yLoc += yShift				
					cur = makePairA("ID: ", typeVal, hPad, horizon, yLoc)
					cur.htmlText = dia.id
					cur.setTextFormat(typeVal);
					cur.autoSize = "right";
					
					var id

				
				
				yLoc += yShift
				
				
				OADraw.OLine(this, 0, 0, 0, yLoc-10, "0xFFFFFF", .25)			
			}
			
			
			
			function makePairA(entryName, typeFace, hPadding, xLoc, yLocation){
				var valBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:xLoc-hPadding, _y:yLocation}).val					
				valBox.htmlText = entryName
				valBox.setTextFormat(typeFace);
				valBox.autoSize = "right";
				

				return this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:xLoc, _y:yLocation}).val					
			}
					

			
}