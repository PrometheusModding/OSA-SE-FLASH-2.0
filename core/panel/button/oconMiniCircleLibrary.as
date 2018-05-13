

class core.panel.button.oconMiniCircleLibrary extends MovieClip {

public var o
public var dataO
public var posO
public var btGlobal

var base
var icon
var sele
var title

var boundModule

	function oconMiniCircleLibrary(){
		build()
		
	}	
	
	function build(){
		var lineThickness = btGlobal.lineThickness
		var lineColor = btGlobal.lineColor
		
		boundModule = o.cfg.binds.refM[o.scan.mods[dataO.bindix].id].id
		if(boundModule){
		lineThickness = 3
		lineColor = o.cfg.config.themeColorHex
		}
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, lineThickness, lineColor, btGlobal.fillColor)	
		icon = this.attachMovie(dataO.bt.b, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
	}
	
	function light(){
		sele = this.attachMovie("mh_bigdot", "option", this.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})
		
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		haloHue.rgb = o.cfg.config.themeColorHex
		haloTrans.colorTransform = haloHue
	}
	
	function update(newModule){
		base.removeMovieClip()
		icon.removeMovieClip()
		build()
	}
	
	function dim(){
		sele.removeMovieClip()
	}	

}