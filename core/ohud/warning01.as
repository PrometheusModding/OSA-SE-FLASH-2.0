
class core.ohud.warning01 extends MovieClip{

public var o
public var displayText
public var displayConfig
public var displayExtra

		public function warning01(){
			
			var textSplit:Array = displayText.split("$TX$")
			
			var textWidth = 270	
				
			var type = new TextFormat();
			type.letterSpacing = .9
			type.font = o.fonts.m
			type.size = 17
			type.align = "right"
			
			var warningText = this.attachMovie("genericText", "warningText", this.getNextHighestDepth(), {_y:-40, _x:0})	
				warningText.val._width = textWidth
				warningText.val.autoSize = "right";	
				warningText.val.htmlText = textSplit[0].toUpperCase()
				
				warningText.val.setTextFormat(type);
				
				
			type = new TextFormat();
			type.letterSpacing = .8
			type.font = o.fonts.l
			type.size = 12
			type.align = "left"
			type.indent = 0
			type.leading = 6
			
				var warningText = this.attachMovie("genericText", "warningText", this.getNextHighestDepth())	
				warningText.val.wordWrap = true; 
				warningText.val.multiline = true;
				warningText.val._width = textWidth
				warningText.val.autoSize = "left";	
				warningText.val.htmlText = textSplit[1]		
				warningText.val.setTextFormat(type);
			
			var rec = OADraw.rectangleRoundedOutlineHack(this, 30, textWidth+200, warningText._height+30+35, 0x000000, 60)
			rec._x = rec._x-textWidth+95
			rec._y = rec._y-30-25
			
			rec.swapDepths(warningText)
			
			var warningIcon = this.attachMovie("ci_warning01_bw", warningIcon, this.getNextHighestDepth(), {_x:(-textWidth/2)-35, _y:-60})
			warningIcon._xscale = 100
			warningIcon._yscale = 100
			warningIcon._alpha = 100
			var ballTween = new mx.transitions.Tween(this, "_x", mx.transitions.easing.Regular.easeOut, _x, (_x-textWidth)+110, 1, true);
			
			var time = 16000
			var timer = new Time({fn:outMenu, scope:this}, time)
			timer = new Time({fn:endMenu, scope:this}, time+1000)
		}
		
		function outMenu(){
		var ballTween = new mx.transitions.Tween(this, "_x", mx.transitions.easing.Regular.easeIn, _x, _x+500, 1, true);
		}
		
		function endMenu(){
		o.display.endBasicPush("OHudWarning01")
		}
}