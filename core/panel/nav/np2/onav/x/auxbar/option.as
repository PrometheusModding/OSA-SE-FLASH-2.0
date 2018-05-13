

class core.panel.nav.np2.onav.x.auxbar.option extends MovieClip {

public var o
public var m
public var f
public var x
var ico

var outV

var desc
var output

	function option(){
		this[x.type]()
	}	
	
	
	function select(){
		ico = this.attachMovie(x.icon, "plusico", this.getNextHighestDepth(), {_xscale:50, _yscale:50})
					desc = ""
					if(x.text.charAt(0)=="^"){desc = core.panel.nav.np2.util.func.translateDesc(o, m.dia, x.text.substr(1), x)}
					
					for (var i=0; i < x.asprop.length; i++){
						ico[x.asprop[i].id] = Number(x.asprop[i].v)
					}
		
	}
	
	function crown(){
		ico = this.attachMovie(x.icon, "plusico", this.getNextHighestDepth(), {_xscale:60, _yscale:60})
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