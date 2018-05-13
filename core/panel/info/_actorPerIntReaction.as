

class core.panel.info._actorPerIntReaction extends MovieClip
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

			public function _actorPerIntReaction(){	
			
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
				typeVar.size = 8.5
				
				typeVal = new TextFormat();
				typeVal.letterSpacing = 1.1
				typeVal.font = o.fonts.m
				typeVal.size = 8.5
				
				var cur
				
						
				
				
				var yShift = -17
				
				
				
				
				cur = makePairA(o.cfg.lang.penMouth, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.pnmo
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				cur = makePairA(o.cfg.lang.mouth, typeVal, hPad, horizon2, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.inmo
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.penAnal, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.pnanal
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				cur = makePairA(o.cfg.lang.anal, typeVal, hPad, horizon2, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.inanal
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.penPussy, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.pnpus
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				cur = makePairA(o.cfg.lang.pussy, typeVal, hPad, horizon2, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.inpus
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				
				
				yLoc += yShift
				
				
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.abuse, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.abuse
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.rough, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.rough
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.physical, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.phys
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				cur = makePairA(o.cfg.lang.hair, typeVal, hPad, horizon2, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.hair
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.gentle, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.gentle
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				cur = makePairA(o.cfg.lang.spank, typeVal, hPad, horizon2, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.spank
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				yLoc += yShift
								
				cur = makePairA(o.cfg.lang.exposure, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.expo
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.clothing, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.clothes
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				
				cur = makePairA(o.cfg.lang.kiss, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.kiss
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.embrace, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.persona.intimate.reaction.emb
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
				
				
			

}