

class core.panel.button.oconMiniCircleBind extends MovieClip {

public var o
public var dataO
public var posO
public var btGlobal

var base
var icon
var sele
var title
var binder

	function oconMiniCircleBind(){
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, btGlobal.lineColor, btGlobal.fillColor)	
		icon = this.attachMovie(dataO.bt.b, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
		binder = this.attachMovie("oconMiniKeybound", "binder", this.getNextHighestDepth(), {o:o, keyBind:o.cfg.binds.dx[o.cfg.binds.OKey[dataO.cmd.ix]], _xscale:btGlobal.xs, _yscale:btGlobal.xs, _x:-45})
	}	
	
	function updateBind(){
		binder.removeMovieClip()
		binder = this.attachMovie("oconMiniKeybound", "keybound", this.getNextHighestDepth(), {o:o, keyBind:o.cfg.binds.dx[o.cfg.binds.OKey[dataO.cmd.ix]], _xscale:btGlobal.xs, _yscale:btGlobal.xs, _x:-45})
	}
	
	function light(){
		sele = this.attachMovie("mh_bigdot", "option", this.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})
		core.panel.util.fx.ilight(this)
		
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		haloHue.rgb = o.cfg.config.themeColorHex
		haloTrans.colorTransform = haloHue
	}
	
	function dim(){
		core.panel.util.fx.idim(this)
		sele.removeMovieClip()
	}	

}