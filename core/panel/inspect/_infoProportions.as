

class core.panel.inspect._infoProportions extends MovieClip
{
	
public var o
public var dia
public var actra
public var proDat
public var profileMode
public var horizon
public var purityMode
public var cmd
var yLoc
var hPad

var typeVal
var typeVar



			public function _infoProportions(){	
				
			}
			
			public function buildFull(){
			
				yLoc = -11
				hPad = 95 
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
						
				
				
				if(o.cfg.config.purityMode == 0){
				
				cur = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:horizon-hPad, _y:yLoc+yShift+yShift}).val
				cur.htmlText = actra.body.scale.cockGen2[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				cur = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:horizon-hPad, _y:yLoc+yShift}).val
				cur.htmlText = actra.body.scale.cockGen3[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				cur = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:horizon-hPad, _y:yLoc}).val
				cur.htmlText = actra.body.scale.cockGen4[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				cur = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:horizon, _y:yLoc+yShift-7}).val
				cur.htmlText = actra.body.scale.cockGen5[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				cur = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:horizon, _y:yLoc-7}).val
				cur.htmlText = actra.body.scale.cockGen6[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				yLoc += yShift
				yLoc += yShift
				yLoc += yShift
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon-hPad-15, _y:yLoc}).val					
				cur.htmlText = o.cfg.lang.microShaft
				cur.setTextFormat(typeVar);
				cur.autoSize = "right";
				

				yLoc += yShift
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.base, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.cockBase[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.scrotum, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.cockScrotum[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.shaft, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.cockShaft[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				
				yLoc += yShift
				yLoc += yShift
				
				}
				
				cur = makePairA(o.cfg.lang.bodyScale, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.body[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.belly, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.belly[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.rearAss+" "+o.cfg.lang.rightAbb, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.rearR[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.rearAss+" "+o.cfg.lang.leftAbb, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.rearL[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				
				if(actra.gender==1){
				
				cur = makePairA(o.cfg.lang.breast+" "+o.cfg.lang.rightAbb, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.chestR[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.breast+" "+o.cfg.lang.leftAbb, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.chestL[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				
				}else{
				
				cur = makePairA(o.cfg.lang.chest+" "+o.cfg.lang.rightAbb, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.chestR[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.chest+" "+o.cfg.lang.leftAbb, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.scale.chestL[cmd]
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				}
				
				
				
				yLoc += yShift
				yLoc += yShift
				
				
				if(cmd=="orig"){
				
				
				cur = makePairA(o.cfg.lang.bodyScale, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.bodyScale
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.metric, typeVal, hPad, horizon, yLoc)
				cur.htmlText = core.util.units.heightSkyToMetric(actra.body.bodyScale, Number(o.cfg.units.height[actra.gender].ratioVirtualToEarth), true)
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.height, typeVal, hPad, horizon, yLoc)
				cur.htmlText = core.util.units.heightSkyToUSA(actra.body.bodyScale, Number(o.cfg.units.height[actra.gender].ratioVirtualToEarth), true)
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.skyWeight, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.weightSky
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.metric, typeVal, hPad, horizon, yLoc)
				cur.htmlText = Math.floor(core.util.units.weightUSAtoMetric(actra.body.weightEarthOrig))+" kg"
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.weight, typeVal, hPad, horizon, yLoc)
				cur.htmlText = Math.floor(actra.body.weightEarthOrig)+" Pounds"
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				}
				else{
					
				cur = makePairA(o.cfg.lang.heightO, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.bodyScaleModified
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.metric, typeVal, hPad, horizon, yLoc)
				cur.htmlText = core.util.units.heightSkyToMetric(actra.body.bodyScaleModified, Number(o.cfg.units.height[actra.gender].ratioVirtualToEarth), true)
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.height, typeVal, hPad, horizon, yLoc)
				cur.htmlText = core.util.units.heightSkyToUSA(actra.body.bodyScaleModified,Number(o.cfg.units.height[actra.gender].ratioVirtualToEarth), true)
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.skyWeight, typeVal, hPad, horizon, yLoc)
				cur.htmlText = actra.body.weightSky
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.metric, typeVal, hPad, horizon, yLoc)
				cur.htmlText = Math.floor(core.util.units.weightUSAtoMetric(actra.body.weightEarthCurrent))+" kg"
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.weight, typeVal, hPad, horizon, yLoc)
				cur.htmlText = Math.floor(actra.body.weightEarthCurrent)+" Pounds"
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
					
				}
				
				
				yLoc += yShift
				
				
				
				
			}


			function makePairA(entryName, typeFace, hPadding, xLoc, yLocation){
				var valBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:xLoc-hPadding, _y:yLocation}).val					
				valBox.htmlText = entryName
				valBox.setTextFormat(typeVar);
				valBox.autoSize = "right";
				

				return this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:xLoc, _y:yLocation}).val					
			}
				
				
			

}