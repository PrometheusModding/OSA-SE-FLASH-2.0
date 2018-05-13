

class core.panel.info._actorGraphics extends MovieClip
{
	
public var o
public var m
public var actra
public var proDat
public var profileMode
public var horizon

var yLoc
var yShift
var hPad

var typeValue
var typeProp
var typeFrom

var hasClothing
var hasSkin

var horizonShift

			public function _actorGraphics(){	
					
				horizon =-10
				horizonShift = 180
				yLoc = -11
				yShift = -27
				
				hasClothing = false
				hasSkin = false
				makeOverlay()				
			
			}
		
			
			function makeOverlay(){
				
				var origY = yLoc
				var highestY = -11
				var ohorizon = horizon
				
				typeProp = new TextFormat();
				typeProp.letterSpacing = 1.0
				typeProp.font = o.fonts.l
				typeProp.size = 7
				
				typeValue = new TextFormat();
				typeValue.letterSpacing = 1.2
				typeValue.font = o.fonts.M
				typeValue.size = 9
				
				typeFrom = new TextFormat();
				typeFrom.letterSpacing = 1.0
				typeFrom.font = o.fonts.l
				typeFrom.size = 5
				
				
						
				
				var typeTitle = new TextFormat();
				typeTitle.letterSpacing = 1.1
				typeTitle.font = o.fonts.M
				typeTitle.size = 9
				
					
				if(o.cfg.config.purityMode!="1"){
				makeSwatchEntry(o.cfg.langESG["fgRGB"+actra.gender], actra.gfx.fgRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["mgRGB"+actra.gender], actra.gfx.mgRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["niRGB"+actra.gender], actra.gfx.niRGB, hasSkin)
				}
				makeSwatchEntry(o.cfg.langESG["eyRGB"+actra.gender], actra.gfx.eyRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["skRGB"+actra.gender]+" "+o.cfg.langESG["shadow"+actra.gender], actra.gfx.skdRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["skRGB"+actra.gender]+" "+o.cfg.langESG["highlight"+actra.gender], actra.gfx.sklRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["skRGB"+actra.gender], actra.gfx.skRGB, hasSkin)	
				makeSwatchEntry(o.cfg.langESG["haRGB"+actra.gender]+" "+o.cfg.langESG["shadow"+actra.gender], actra.gfx.hadRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["haRGB"+actra.gender]+" "+o.cfg.langESG["highlight"+actra.gender], actra.gfx.halRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["haRGB"+actra.gender], actra.gfx.haRGB, hasSkin)		
				
				yLoc-=5
				
				var titleBody = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				titleBody.htmlText = o.cfg.langESG["bodyTones"+actra.gender].toUpperCase()
				titleBody.setTextFormat(typeTitle);
				titleBody.autoSize = "right";
				
				
				
				horizon-=horizonShift
				if(highestY > yLoc){
					highestY=yLoc
				}
				yLoc = origY
				
				makeSwatchEntry(o.cfg.langESG["frRGB"+actra.gender], actra.gfx.frRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["npRGB"+actra.gender], actra.gfx.npRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["bsRGB"+actra.gender], actra.gfx.bsRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["elRGB"+actra.gender], actra.gfx.elRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["esRGB"+actra.gender], actra.gfx.esRGB, hasSkin)
				makeSwatchEntry(o.cfg.langESG["liRGB"+actra.gender], actra.gfx.liRGB, hasSkin)
				
				var titleBody = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				titleBody.htmlText = o.cfg.langESG["makeupTones"+actra.gender].toUpperCase()
				titleBody.setTextFormat(typeTitle);
				titleBody.autoSize = "right";
				
				yLoc-=45
				
				if(o.cfg.config.purityMode!="1"){
				makeSwatchEntry(o.cfg.langESG["cmRGB"+actra.gender], actra.gfx.cmRGB, hasSkin)
				}
				makeSwatchEntry(o.cfg.langESG["brRGB"+actra.gender], actra.gfx.brRGB, hasSkin)				
				makeSwatchEntry(o.cfg.langESG["blRGB"+actra.gender], actra.gfx.blRGB, hasSkin)

				
				var titleBody = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				titleBody.htmlText = o.cfg.langESG["bioTones"+actra.gender].toUpperCase()
				titleBody.setTextFormat(typeTitle);
				titleBody.autoSize = "right";
				
				
				
				horizon-=horizonShift
				if(highestY > yLoc){
					highestY=yLoc
				}
				yLoc = origY
				
				
				
				
				
				makeSwatchEntry(o.cfg.langESG["stockings"+actra.genderF], actra.gfx.c_socksRGB, hasClothing)
				makeSwatchEntry(o.cfg.langESG["intlow"+actra.genderF], actra.gfx.c_intlowRGB, hasClothing)
				makeSwatchEntry(o.cfg.langESG["pants"+actra.genderF], actra.gfx.c_pantsRGB, hasClothing)
				makeSwatchEntry(o.cfg.langESG["cuirass"+actra.genderF], actra.gfx.c_shirtRGB, hasClothing)
				
				

				yLoc-=5
				//if(hasClothing){
				var titleBody = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				titleBody.htmlText = o.cfg.langESG["clothingTones"+actra.gender].toUpperCase()
				titleBody.setTextFormat(typeTitle);
				titleBody.autoSize = "right";
				//}
				
				if(highestY > yLoc){
					highestY=yLoc
				}
				
				horizon = ohorizon
				
				
				core.panel.util.func.brass(o, actra, this,highestY)
				OADraw.OLine(this, 0, 0, 0, -310, "0xFFFFFF", .25)	
				
				
				
			}


			function makeSwatchEntry(textProp, gfx, bool){
				if(gfx.rgb){
					bool=true
				var valBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon-84, _y:yLoc+3, swatch:undefined})				
				valBox.val.htmlText = textProp.toUpperCase()
				valBox.val.setTextFormat(typeProp);
				valBox.val.autoSize = "right";
				valBox.val._alpha = 80
				
				var entryBox = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:horizon-25, _y:yLoc})				
				entryBox.val.htmlText = "#"+(gfx.rgb.toString(16).toUpperCase())
				entryBox.val.setTextFormat(typeValue)
				entryBox.val.autoSize = "right";
				
				var fromBox = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:horizon-25, _y:yLoc+15})				
				fromBox.val.htmlText = "from "+gfx.from
				fromBox.val.setTextFormat(typeFrom)
				fromBox.val.autoSize = "right";				
				
				var base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), horizon-10, yLoc+3, 10, 1.5, "0", gfx.rgb)


				yLoc+=yShift
				}
			}
			

				
				
			

}