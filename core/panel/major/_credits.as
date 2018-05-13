

class core.panel.major._credits extends MovieClip
{
	
public var o
public var actra
public var pandect
public var module

var panel
var horizon


			public function _credits(){	
				horizon = -10
				panel = this
				makeOverlay()			
				
			}
			
			function makeOverlay(){
				
				var cur
				var type
				var yLoc = -21
				
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.l
				type.size = 10
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Special thanks to the contributors who wish to remain anonymous,"+"\n"+"OSA beta testers and all supporters, vocal and silent, of the OSA project."
				cur.setTextFormat(type);
				cur.multiline = true
				cur.autoSize = "right";
				
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 12
				
				yLoc -= 32
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Shinji72 | Skyrim WATCH"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				yLoc -= 16
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.l
				type.size = 10
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Promotion"
				cur.setTextFormat(type);
				cur.multiline = true
				cur.autoSize = "right";
				
				
				yLoc -= 30
				
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 13
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Scorpion SK"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				yLoc -= 16
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.l
				type.size = 10
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Localization"
				cur.setTextFormat(type);
				cur.multiline = true
				cur.autoSize = "right";
				
				yLoc -= 30
				
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 12
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "LucasHM"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				yLoc -= 17
				
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Mysterious Guy"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				yLoc -= 16
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.l
				type.size = 10
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Public Relations"
				cur.setTextFormat(type);
				cur.multiline = true
				cur.autoSize = "right";
				
				yLoc -= 30
				
				
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 12
				
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Jerok"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				yLoc -= 17
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "FoxFingers"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				yLoc -= 17
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "R-H-Z"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				yLoc -= 17
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Proxy86"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				yLoc -= 17
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Morra"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				
				yLoc -= 16
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.l
				type.size = 10
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Pioneering"
				cur.setTextFormat(type);
				cur.multiline = true
				cur.autoSize = "right";
				
				yLoc -= 30
				
				
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 12
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "SF"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				yLoc -= 17
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Scorpion SK"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				yLoc -= 17
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Pipdude"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				yLoc -= 17
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Migal"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				yLoc -= 17
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "Kinky"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				yLoc -= 34
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.l
				type.size = 10
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "With tremendous support"+"\n"+"from the core OSA team"
				cur.setTextFormat(type);
				cur.multiline = true
				cur.autoSize = "right";
				
				yLoc -= 40
			
				
				
				type = new TextFormat();
				type.letterSpacing = 1.2
				type.font = o.fonts.m
				type.size = 13
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = o.cfg.lang.createdBy+": Ceo" 
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				yLoc -= 45
				
				
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.l
				type.size = 40
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "OSA"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				OADraw.OLine(this, 0, 0, 0, yLoc+20, "0xFFFFFF", .25)			
			}
					

			
			
}