import mx.utils.Delegate;

class core.panel.nav.np2.onav.pagebar extends MovieClip {

public var o
public var m
public var f
public var x

var shell
var ico

var outV

var lit


var xsTw
var ysTw

	function pagebar(){
		shell = this
		ico = []
		lit = 0
	}	
	
	function build(arr){		
		var v = -20
		var h = 20
		
		for (var i=0; i < arr.length; i++){			
			ico[i] = this.attachMovie(arr[i].x.icon, "pageicon"+i, this.getNextHighestDepth(), {_x:h,_y:v, o:o, m:m, xml:arr[i].x})
			h += 35
			dim(i)
		}
		

		
		if(_parent.hiddenIcons[0]){
			this.attachMovie("hiddenIcons", "vanisheye", this.getNextHighestDepth(), {_x:h-13,_y:v-5, _xscale:15, _yscale:15})
		}
		
		outV = -42
	}
	
	
		function onPage(i){
		dim(lit)
		lit = i
		light(lit)
	}	
	
			function light(i){
			lightFX(i)
			}
			
			function dim(i){
			dimFX(i)
			}


			
			function lightFX(i){
				//var alphaYTw = new mx.transitions.Tween(ico[i].Y, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .20, true);	
				//var alpaNTw = new mx.transitions.Tween(ico[i].N, "_alpha", mx.transitions.easing.None.easeNone, 100, 0, .20, true);	
				ico[i].Y._alpha = 100
				
				xsTw.stop()
				ysTw.stop()
				xsTw = new mx.transitions.Tween(ico[i].Y, "_xscale", mx.transitions.easing.Strong.easeOut, 130, 100, .3, true);
				ysTw = new mx.transitions.Tween(ico[i].Y, "_yscale", mx.transitions.easing.Strong.easeOut, 130, 100, .3, true);	
			}
			
			function dimFX(i){
				xsTw.stop()
				ysTw.stop()
				ico[i].Y._alpha = 0
				ico[i].N._alpha = 100
				//var lightAlphaTw = new mx.transitions.Tween(ico[i].Y, "_alpha", mx.transitions.easing.None.easeNone, 100, 0, .15, true);	
				//var lightAlphaTw = new mx.transitions.Tween(ico[i].N, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .15, true);	
			}

}