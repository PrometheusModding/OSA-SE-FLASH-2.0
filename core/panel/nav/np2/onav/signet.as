import mx.utils.Delegate;

class core.panel.nav.np2.onav.signet extends MovieClip {

public var o
public var m
public var f

var shell
var ico = []

var outV

var lit


	function signet(){
		shell = this
		ico = []		
		lit = 0		
		
	}	
	
	function build(arr, extraArr){		
	
		
		var v = 0
		var h = 20

		var ix = 0
		
		for (var i=0; i < arr.length; i++){					
		
			if(f.tabDisplay[i]=="2"){}		
			else{
				if(f.tabDisplay[i]=="1" || f.tabDisplay[i]=="0"){				
					empty(this.attachMovie(arr[i].icon, "signet"+i, this.getNextHighestDepth(), {_x:h, _y:v}))
				}else{
				ico[ix] = this.attachMovie(arr[i].icon, "signet"+i, this.getNextHighestDepth(), {_x:h, _y:v})
				
				
				if(arr[i].hue[0]){
					var toneTrans
				
					for (var j=0; j < arr[i].hue.length; j++){					
					var outcome = core.panel.nav.np2.util.func.hueFormCmd(arr[i].hue[j], ico[ix].Y, o, m)		
					}
				}
				dim(ix)
				
				ix++
				}
				h += 35			
			}
		}
		
		for (var i=0; i < extraArr.length; i++){					
		
				ico[ix] = this.attachMovie(extraArr[i].icon, "signet"+i, this.getNextHighestDepth(), {_x:h, _y:v})
				dim(ix)
				ix++
				h += 35			
			
				
				if(extraArr[i].hue[0]){
					var toneTrans
				
					for (var j=0; j < extraArr[i].hue.length; j++){				
					var outcome = core.panel.nav.np2.util.func.hueFormCmd(extraArr[i].hue[j], ico[ix-1].Y, o, m)		
					}
				}
		}
		
		outV = -50
	}


	
	function onTab(i){
		dim(lit)
		lit = i
		light(lit)
	}	


			function empty(obj){
			obj.Y._visible = false
			obj.N._visible = false
			}
			
			function light(i){
			lightFX(i)
			ico[i].X._visible = false
			}
			
			function dim(i){
			dimFX(i)
			ico[i].X._visible = false
			}

var xsTw
var ysTw
			
			function lightFX(i){
				//var alphaYTw = new mx.transitions.Tween(ico[i].Y, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .20, true);	
				//var alpaNTw = new mx.transitions.Tween(ico[i].N, "_alpha", mx.transitions.easing.None.easeNone, 100, 0, .20, true);	
				ico[i].Y._alpha = 100
				
				xsTw.stop()
				ysTw.stop()
				xsTw = new mx.transitions.Tween(ico[i].Y, "_xscale", mx.transitions.easing.Regular.easeInOut, 135, 100, .3, true);
				ysTw = new mx.transitions.Tween(ico[i].Y, "_yscale", mx.transitions.easing.Regular.easeInOut, 135, 100, .3, true);	
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