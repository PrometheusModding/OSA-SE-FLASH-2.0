

class core.panel.info._actorPerIntClass extends MovieClip
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

			public function _actorPerIntClass(){	
				
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
				
				var cur
				
						
				
				
				var yShift = -22
				var yShiftHead = -32
				
				
				cur = makePairA(o.cfg.lang.voice, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.emo.voice
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.expression, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.emo.expression
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";				
				
				
				yLoc += yShiftHead
				createHeader(o.cfg.lang.emotion+" (Emo)", horizon, yLoc-5)
				yLoc += yShiftHead
				
				
				cur = makePairA(o.cfg.lang.voice, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.mien.voice
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.expression, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.mien.expression
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";	
				
				
				yLoc += yShiftHead
				createHeader(o.cfg.lang.demeanor+" (Mien)", horizon, yLoc)
				yLoc += yShiftHead

				
				
				
				cur = makePairA(o.cfg.lang.motif, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.motif
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.lipSync, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.voice.lipShape.id
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.voiceSuite, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.voice.voiceSuite.name
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
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