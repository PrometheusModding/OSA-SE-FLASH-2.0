

class core.panel.button.oconMiniCircle extends MovieClip {

public var o
public var dataO
public var posO
public var btGlobal

var base
var icon
var sele
var title

	function oconMiniCircle(){
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, btGlobal.lineColor, btGlobal.fillColor)	
		icon = this.attachMovie(dataO.bt.b, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
	}	
	
	function light(){
		sele = this.attachMovie("mh_bigdot", "option", this.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})		
		core.panel.util.fx.ilight(this)
		
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		haloHue.rgb = o.cfg.config.themeColorHex
		haloTrans.colorTransform = haloHue
	}
	
	function update(){
		base.removeMovieClip()	
		icon.removeMovieClip()
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, btGlobal.lineColor, btGlobal.fillColor)	
		icon = this.attachMovie(dataO.bt.b, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
	}
	
	function dim(){
		core.panel.util.fx.idim(this)
		
		sele.removeMovieClip()
	}	

}