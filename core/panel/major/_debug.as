

class core.panel.major._debug extends MovieClip
{
	
public var o
public var actra
public var pandect
public var module

var panel
var horizon


			public function _debug(){	
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
				cur.htmlText = o.log.maj
				cur.setTextFormat(type);
				cur.multiline = true
				cur.autoSize = "right";
				
				cur._y = 0-cur._height
				
				
				OADraw.OLine(this, 0, 0, 0, 0-cur._height, "0xFFFFFF", .25)				
			}
					

			
			
}