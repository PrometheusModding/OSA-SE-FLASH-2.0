

class core.panel.nav.np2.onav.option extends MovieClip {

public var o
public var m
public var f
public var x
public var arrn
public var p
public var row
var u

var outV
var empty


var ico
var icoEnhanced
var icoName
var base
var halo
var haloType
var dest
var desc
var cmd
var lit

var refX

var permX
var permY

var burstIco


var xScaler
var yScaler
var xScalerMax
var yScalerMax
var pushNear
var pushFar

	function option(){
			
			if(!o.cfg.config.smallNavigationIcons==1){
					
			xScaler = 110
			yScaler = 110
			
			xScalerMax = 135
			yScalerMax = 135
			
			pushNear = 9
			pushFar = 5
			
			}else{			
			
			xScaler = 80
			yScaler = 80
			
			xScalerMax = 95
			yScalerMax = 95
			
			pushNear = 6
			pushFar = 4			
			}
			
			if(x.iRevX==1){
			xScaler *= -1
			xScalerMax *= -1
			}
			
			if(x.iRevY==1){
			yScaler *= -1
			yScalerMax *= -1
			}
			
			_xscale = xScaler
			_yscale = yScaler
			
			if(x.style){
			this["build"+"_"+x.style]()	
			}else{
			build()
			}
	}
	
	function rebuild(){
			ico.removeMovieClip()
			icoEnhanced.removeMovieClip()
			base.removeMovieClip()
			
			if(x.style){
			this["build"+"_"+x.style]()	
			}else{
			build()
			}
	}
	
	
	function build(){
			
			refX = x
			setBase(refX)
			setIco(refX)
			enhance(refX)
			setDesc(refX)
			setDest(refX)
			setRGB(refX)	
			permX = _x
			permY = _y
		
	}
	
	function build_gendericosplit(){		
			

			refX = x.genico[m.dia.actra[x.a].gender]
			setBase(refX)
			setIco(refX)
			enhance(refX)
			setDesc(x)
			setDest(x)
			setRGB(refX)	
			
	}
	
	function setBase(xx){
				if(!xx.base){base = this.attachMovie(f.dbase, "base", this.getNextHighestDepth())}
			else{base = this.attachMovie(x.base.toLowerCase(), "base", this.getNextHighestDepth())}
	}
	
	function setIco(xx){
		icoName = core.panel.nav.np2.util.func.iconCmd(xx.icon.toLowerCase(), o, m)
		ico = this.attachMovie(icoName, "icon", this.getNextHighestDepth())
	    ico.block = {x:xx, o:o, actra:m.dia.actra}
		if(xx.iRot){
			ico._rotation = xx.iRot
		}
		haloType = xx.halo
	}
	
	function setDest(xx){
		if(xx.go.charAt(0) == "^"){dest = m.dia.scene.id+(xx.go.substr(1))}
		 	else if(xx.go.charAt(0) == "$"){
			dest = "cmd"
			cmd = xx.go
			}
			else{dest = xx.go}
	}
	
	function setDesc(xx){
		if(xx.text.charAt(0)=="^"){
				if(xx.text.charAt(1)== "^"){desc = o.cfg.lang[(xx.text.substr(2))]}
				else{desc = core.panel.nav.np2.util.func.translateDesc(o, m.dia, xx.text.substr(1), xx)}
			}else{desc = xx.text}
	}
	
	function enhance(xx){
		if(xx.enhance && o.cfg.config.dynamicIconDisplay=="1"){
				icoEnhanced = new core.panel.nav.np2.onav.unique.ienhance(o, this, ico)
			}
	}
	
	function setRGB(xx){
		if(xx.ihue[0]){				
					for (var i=0; i < xx.ihue.length; i++){					
					var outcome = core.panel.nav.np2.util.func.hueFormCmd(x.ihue[i], ico, o, m)
						if(outcome=="deny"){
		
						}
					}
				}
	}
				
			function light(){
			if(!lit){
			lit = true
			halo = this.attachMovie(haloType, "halo", this.getNextHighestDepth());
			
				for (var i=0; i < refX.hhue.length; i++){	
					var haloTrans = new flash.geom.Transform(halo[refX.hhue[i].n]);
					var haloHue = new flash.geom.ColorTransform
					haloHue.rgb = "0x"+core.panel.nav.np2.util.func.hueFormCmd(refX.hhue[i], undefined, o, m)
					haloTrans.colorTransform = haloHue
				}
			lightFX()
			f.updateDesc(desc)
			}
			}
			

			function lightFX(){
				
				xsTw.stop()
				ysTw.stop()
				
				var xsTw = new mx.transitions.Tween(this, "_xscale", mx.transitions.easing.Regular.easeOut, xScaler, xScalerMax, .2, true);
				var ysTw = new mx.transitions.Tween(this, "_yscale", mx.transitions.easing.Regular.easeOut, yScaler, yScalerMax, .2, true);	
				if(p.arr[arrn-1].row == row){
				var pushTop = new mx.transitions.Tween(p.arr[arrn-1], "_y", mx.transitions.easing.Strong.easeOut, p.arr[arrn-1]._y, p.arr[arrn-1].permY+pushNear, .2, true);
				}
				if(p.arr[arrn+1].row == row){
				var pushBot = new mx.transitions.Tween(p.arr[arrn+1], "_y", mx.transitions.easing.Strong.easeOut, p.arr[arrn+1]._y, p.arr[arrn+1].permY-pushNear, .2, true);	
				}
				if(p.arr[arrn-2].row == row){
				var pushTop = new mx.transitions.Tween(p.arr[arrn-2], "_y", mx.transitions.easing.Strong.easeOut, p.arr[arrn-2]._y, p.arr[arrn-2].permY+pushFar, .25, true);
				}
				if(p.arr[arrn+2].row == row){
				var pushBot = new mx.transitions.Tween(p.arr[arrn+2], "_y", mx.transitions.easing.Strong.easeOut, p.arr[arrn+2]._y, p.arr[arrn+2].permY-pushFar, .25, true);	
				}
				
				var pushLeft = new mx.transitions.Tween(p.arr[arrn+p.maxV], "_x", mx.transitions.easing.Strong.easeOut, p.arr[arrn+p.maxV]._x, p.arr[arrn+p.maxV].permX+pushNear, .2, true);
				var pushRight = new mx.transitions.Tween(p.arr[arrn-p.maxV], "_x", mx.transitions.easing.Strong.easeOut, p.arr[arrn-p.maxV]._x, p.arr[arrn-p.maxV].permX-pushNear, .2, true);
			}
			
			function dim(){
			lit = false
			halo.removeMovieClip()
			var xsTw = new mx.transitions.Tween(this, "_xscale", mx.transitions.easing.Regular.easeOut, xScalerMax, xScaler, .2, true);
			var ysTw = new mx.transitions.Tween(this, "_yscale", mx.transitions.easing.Regular.easeOut, yScalerMax, yScaler, .2, true);	
			var pushTop = new mx.transitions.Tween(p.arr[arrn-1], "_y", mx.transitions.easing.Strong.easeOut, p.arr[arrn-1]._y, p.arr[arrn-1].permY, .18, true);
			var pushBot = new mx.transitions.Tween(p.arr[arrn+1], "_y", mx.transitions.easing.Strong.easeOut, p.arr[arrn+1]._y, p.arr[arrn+1].permY, .18, true);	
			var pushTop = new mx.transitions.Tween(p.arr[arrn-2], "_y", mx.transitions.easing.Strong.easeOut, p.arr[arrn-2]._y, p.arr[arrn-2].permY, .18, true);
			var pushBot = new mx.transitions.Tween(p.arr[arrn+2], "_y", mx.transitions.easing.Strong.easeOut, p.arr[arrn+2]._y, p.arr[arrn+2].permY, .18, true);
			var pushLeft = new mx.transitions.Tween(p.arr[arrn+p.maxV], "_x", mx.transitions.easing.Strong.easeOut, p.arr[arrn+p.maxV]._x, p.arr[arrn+p.maxV].permX, .18, true);
				var pushRight = new mx.transitions.Tween(p.arr[arrn-p.maxV], "_x", mx.transitions.easing.Strong.easeOut, p.arr[arrn-p.maxV]._x, p.arr[arrn-p.maxV].permX, .18, true);
			}
			
			public function output(){
			return dest
			}

			


}