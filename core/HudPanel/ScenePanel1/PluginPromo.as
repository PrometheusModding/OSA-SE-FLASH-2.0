

class PluginPromo extends MovieClip
{
	
public var o
public var dat
public var dia
public var actra

var panel
var horizon
var horizon2
var horizon3
var pandect
var plug

var typeVal
var typeVar

			public function PluginPromo(){	
				_x = dat.xPos
				_y = dat.yPos
				horizon = -10
				panel = this
				plug = dat.plug
				horizon2 = -70
				horizon3 = -140
				
				makeOverlay()			
				
			}
			
			function makeOverlay(){
				
				var cur
				var type
				var yLoc = -11
				var hPad = 80
				
				typeVal = new TextFormat();
				typeVal.letterSpacing = 1.1
				typeVal.font = o.fonts.m
				typeVal.size = 9
				
				typeVar = new TextFormat();
				typeVar.letterSpacing = 1.1
				typeVar.font = o.fonts.l
				typeVar.size = 9
				
				
				var yShift = -16
				
				cur = makePairA(o.cfg.lang.pluginID, typeVal, hPad, horizon, yLoc)
				cur.htmlText = plug.id
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.status, typeVal, hPad, horizon, yLoc)
				if(plug.phase==2){cur.htmlText = o.cfg.lang.development}
				else if(plug.phase==1){cur.htmlText = o.cfg.lang.alpha}
				else if(plug.phase==0){cur.htmlText = o.cfg.lang.available}
				else{cur.htmlText = "N/A"}
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";			
				
				yLoc += yShift
				
				
				
				cur = makePairA("Poli-Safe", typeVal, hPad, horizon, yLoc)
				if(plug.info[0].polisafe==1){cur.htmlText = o.cfg.lang.yes}
				else{cur.htmlText = o.cfg.lang.no}
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";			
				
				yLoc += yShift
				
				cur = makePairA("S.DG.R.", typeVal, hPad, horizon, yLoc)
				cur.htmlText = plug.info[0].dgrate
				cur.setTextFormat(typeVal);
				cur.autoSize = "right";			
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.hyperTaboo, typeVal, hPad, horizon, yLoc)
				if(plug.info[0].hypertaboo==1){cur.htmlText = o.cfg.lang.yes}
				else{cur.htmlText = o.cfg.lang.no}
				cur.autoSize = "right";			
								
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.violence, typeVal, hPad, horizon, yLoc)
				if(plug.info[0].violence==1){cur.htmlText = o.cfg.lang.yes}
				else{cur.htmlText = o.cfg.lang.no}
				cur.autoSize = "right";			
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.adult, typeVal, hPad, horizon, yLoc)
				if(plug.info[0].adult==1){cur.htmlText = o.cfg.lang.yes}
				else{cur.htmlText = o.cfg.lang.no}
				cur.autoSize = "right";			
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.download, typeVal, hPad, horizon, yLoc)
				cur.htmlText = plug.info[0].dl
				cur.autoSize = "right";			
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.updated, typeVal, hPad, horizon, yLoc)
				cur.htmlText = plug.upd
				cur.autoSize = "right";			
				
				yLoc += yShift
				
				cur = makePairA(o.cfg.lang.installed, typeVal, hPad, horizon, yLoc)
				if(o.scan.hasPlugin(dia.module.id, plug.id)){cur.htmlText = o.cfg.lang.yes}
				else{cur.htmlText = o.cfg.lang.no}
				cur.autoSize = "right";			
				
				
				yLoc -= 40
				

				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.size = 9.5

				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = o.cfg.lang.tags+": "+plug.info[0].tags
				cur.setTextFormat(type);
				cur.autoSize = "right";

	
				yLoc -= 15
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.size = 10
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "genDesign: "+plug.info[0].gendesign
				cur.setTextFormat(type);
				cur.autoSize = "right";

	
				yLoc -= 10
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.size = 10
				type.align = "left"
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = plug.text[0].desc
				cur.setTextFormat(type);
				cur._width = 225
				cur._x = cur._x-64
				cur.wordWrap = true; 
				cur.multiline = true;
				cur.autoSize = "left";
				
				var heightBox = cur._height
				cur._y = cur._y-heightBox
				
				yLoc -= 40
				yLoc -= heightBox
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.size = 11
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = plug.text[0].subtext
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				yLoc -= 30
				
				
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 20
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = plug.name
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				OADraw.OLine(this, 0, 0, 0, yLoc+20, "0xFFFFFF", .25)			
			}
					
			function makePairA(entryName, typeFace, hPadding, xLoc, yLocation){
				var valBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:xLoc-hPadding, _y:yLocation}).val					
				valBox.htmlText = entryName
				valBox.setTextFormat(typeVar);
				valBox.autoSize = "right";
				

				return this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:xLoc, _y:yLocation}).val					
			}
			
}