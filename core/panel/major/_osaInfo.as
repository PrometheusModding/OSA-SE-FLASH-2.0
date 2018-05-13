

class core.panel.major._osaInfo extends MovieClip
{
	
public var o
public var actra
public var pandect
public var module

var panel
var horizon


			public function _osaInfo(){	
				horizon = -10
				panel = this
				makeOverlay()			
				
			}
			
			function makeOverlay(){
				
				var cur
				var type
				var yLoc = -21
				
				
				yLoc -= 17
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = o.ver
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				yLoc -= 17
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.l
				type.size = 10
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = o.cfg.lang.version
				cur.setTextFormat(type);
				cur.multiline = true
				cur.autoSize = "right";
	
			
				
				yLoc -= 60
				
				
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.size = 40
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				cur.htmlText = "OSA"
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				OADraw.OLine(this, 0, 0, 0, yLoc+20, "0xFFFFFF", .25)			
			}
					

			
			
}