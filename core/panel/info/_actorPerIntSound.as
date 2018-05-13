

class core.panel.info._actorPerIntSound extends MovieClip
{
	
public var o
public var m
public var actra
public var proDat
public var profileMode
public var horizon
var horizon2

var yLoc
var hPad

var typeVal
var typeVar
var typeCred
			public function _actorPerIntSound(){	
				
				horizon =-10
			
				yLoc = -11
				hPad = 75 
				horizon2 = horizon-(hPad*2)
				makeOverlay()				
			
			}
		
			
			function makeOverlay(){
			
				
				
				typeVar = new TextFormat();
				typeVar.letterSpacing = 1.1
				typeVar.font = o.fonts.l
				typeVar.size = 11
				
				typeVal = new TextFormat();
				typeVal.letterSpacing = 1.1
				typeVal.font = o.fonts.m
				typeVal.size = 11
				
				typeCred = new TextFormat();
				typeCred.letterSpacing = 1.1
				typeCred.font = o.fonts.l
				typeCred.size = 9
				
				var cur
				
						
				
				
				var yShift = -20
				var yShiftHead = -30
				
				if(actra.body.spank.formSuite.credit){
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val					
				cur.htmlText = actra.body.spank.formSuite.credit
				cur.setTextFormat(typeCred);
				cur.autoSize = "right";				
				
				}
				yLoc-=15
				
				cur = makePairA(o.cfg.lang.spank, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.spank.formSuite.id
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				
				yLoc += yShift
				
				
				
				
				
				
				if(actra.body.ibo.formSuite.credit){
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val					
				cur.htmlText = actra.voice.ibo.formSuite.credit
				cur.setTextFormat(typeCred);
				cur.autoSize = "right";				
				
				}
				yLoc-=15
				
				cur = makePairA(o.cfg.lang.bodySoundIntimate, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.ibo.formSuite.id
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";				
				
				
				yLoc += yShiftHead
				createHeader(o.cfg.lang.body, horizon, yLoc-5)
				yLoc += yShiftHead
				
				
				if(actra.voice.wvo.formSuite.credit){
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val					
				cur.htmlText = actra.voice.wvo.formSuite.credit
				cur.setTextFormat(typeCred);
				cur.autoSize = "right";				
				
				}
				yLoc-=15
				
				
				cur = makePairA(o.cfg.lang.voiceWizard, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.voice.wvo.formSuite.id
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				
				yLoc += yShiftHead
				createHeader(o.cfg.lang.misc, horizon, yLoc-5)
				yLoc += yShiftHead
				
				
				if(actra.voice.ivos.formSuite.credit){
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val					
				cur.htmlText = actra.voice.ivos.formSuite.credit
				cur.setTextFormat(typeCred);
				cur.autoSize = "right";
				
				
				}
				yLoc-=15
				
				cur = makePairA(o.cfg.lang.voicePrimalSuck, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.voice.ivos.formSuite.id
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
						
				
				
				yLoc += yShift
				
				
				if(actra.voice.ivo.formSuite.credit){
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val					
				cur.htmlText = actra.voice.ivo.formSuite.credit
				cur.setTextFormat(typeCred);
				cur.autoSize = "right";
				
				
				}
				yLoc-=15
				
				cur = makePairA(o.cfg.lang.voicePrimal, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.voice.ivo.formSuite.id
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				

				
				
				yLoc += yShift
				
				
				if(actra.voice.vo.formSuite.credit){
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val					
				cur.htmlText = actra.voice.vo.formSuite.credit
				cur.setTextFormat(typeCred);
				cur.autoSize = "right";
				
				
				}
				yLoc-=15
				
				cur = makePairA(o.cfg.lang.voiceSounds, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.voice.vo.formSuite.id
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";				
				
				yLoc += yShiftHead
				createHeader(o.cfg.lang.voice, horizon, yLoc-5)
				
				core.panel.util.func.brass(o, actra, this, yLoc)
				OADraw.OLine(this, 0, 0, 0, yLoc, "0xFFFFFF", .25)	
			}


			function makePairA(entryName, typeFace, hPadding, xLoc, yLocation){
				var valBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:xLoc-hPadding, _y:yLocation}).val					
				valBox.htmlText = entryName
				valBox.setTextFormat(typeVar);
				valBox.autoSize = "right";
				

				return this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:xLoc, _y:yLocation}).val					
			}
				
				
			function createHeader(headerTitle, xLocation, yLocation){
				
				var typeHead = new TextFormat();
				typeHead.letterSpacing = 1.2
				typeHead.font = o.fonts.l
				typeHead.color = 0xcccccc
				typeHead.size = 9.5
				
				var header = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:xLocation, _y:yLocation})	
				
				
				
				header.val.htmlText = headerTitle.toUpperCase() 
				header.val.setTextFormat(typeHead);
				header.val.autoSize = "right";

				header.lineStyle(1, 0xcccccc, 100, true, "none", "round", "miter", 0.25);
				header.moveTo(0, header.val._y+18);
				header.lineTo(0-125, header.val._y+18);
			}
				
			

}