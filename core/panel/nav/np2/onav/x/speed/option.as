

class core.panel.nav.np2.onav.x.speed.option extends MovieClip {

public var o
public var m
public var f
public var x
var ico

var outV

var desc
var output

	function option(){
			output = {amount:undefined, role:x.actor, ix:x.ix} 
	}	
	
	function plus(){
		ico = this.attachMovie(x.plus, "plusico", this.getNextHighestDepth())
		output.amount = +1
		
		desc = ""
		if(x.plustext.charAt(0)=="^"){desc = core.panel.nav.np2.util.func.translateDesc(o, m.dia, x.plustext.substr(1), x)}
		else{desc = x.plustext}
	}
	
	function minus(){
		ico = this.attachMovie(x.minus, "plusico", this.getNextHighestDepth())
		output.amount = -1
		
		desc = ""
		if(x.minustext.charAt(0)=="^"){desc = core.panel.nav.np2.util.func.translateDesc(o, m.dia, x.minustext.substr(1), x)}
		else{desc = x.minustext}
	}
	
				function dim(){
				dimFX()
				//ico.Y._visible = false 
				//ico.N._visible = true 
				}
				
				function light(){
				//ico.Y._visible = true 
				//ico.N._visible = false
				lightFX()
				f.updateDesc(desc)
				}
				
var xsTw
var ysTw

			function clickFX(){
				xsTw.stop()
				ysTw.stop()
				xsTw = new mx.transitions.Tween(ico.Y, "_xscale", mx.transitions.easing.Regular.easeOut, 130, 100, .3, true);
				ysTw = new mx.transitions.Tween(ico.Y, "_yscale", mx.transitions.easing.Regular.easeOut, 130, 100, .3, true);	
			}
			
			function lightFX(){
				//var alphaYTw = new mx.transitions.Tween(ico.Y, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .20, true);	
				//var alpaNTw = new mx.transitions.Tween(ico.N, "_alpha", mx.transitions.easing.None.easeNone, 100, 0, .20, true);	
				ico.Y._alpha = 100
				
				xsTw.stop()
				ysTw.stop()
				xsTw = new mx.transitions.Tween(ico.Y, "_xscale", mx.transitions.easing.Regular.easeOut, 130, 100, .3, true);
				ysTw = new mx.transitions.Tween(ico.Y, "_yscale", mx.transitions.easing.Regular.easeOut, 130, 100, .3, true);	
				
			}
			
			function dimFX(){
				xsTw.stop()
				ysTw.stop()
				ico.Y._alpha = 0
				ico.N._alpha = 100
				//var lightAlphaTw = new mx.transitions.Tween(ico[i].Y, "_alpha", mx.transitions.easing.None.easeNone, 100, 0, .15, true);	
				//var lightAlphaTw = new mx.transitions.Tween(ico[i].N, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .15, true);	
			}
	
	

}