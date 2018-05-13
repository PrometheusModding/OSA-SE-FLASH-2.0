

class core.panel.button.oconMiniCircleModBind extends MovieClip {

public var o
public var dataO
public var posO
public var btGlobal

var base
var icon
var sele
var title
var binder

	function oconMiniCircleModBind(){
		
		build()
	}	
	
	function build(){
		var lineThickness = btGlobal.lineThickness
		var lineColor = btGlobal.lineColor
		
		if(o.cfg.binds.refM[dataO.module.id]){
		lineThickness = 3
		lineColor = o.cfg.config.themeColorHex
		}
		
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, lineThickness, lineColor, btGlobal.fillColor)	
		icon = this.attachMovie(dataO.bt.b, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
		
		updateBind()
	}
	
	function update(){
		base.removeMovieClip()
		icon.removeMovieClip()
		build()
	}
	
	function updateBind(){
		binder.removeMovieClip()
		if(o.cfg.binds.dx[o.cfg.binds.refM[dataO.module.id].code]){
		binder = this.attachMovie("oconMiniKeybound", "keybound", this.getNextHighestDepth(), {o:o, keyBind:o.cfg.binds.dx[o.cfg.binds.refM[dataO.module.id].code], _xscale:55, _yscale:55, _x:-45})
		}
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