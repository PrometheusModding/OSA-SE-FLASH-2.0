

class core.panel.button.oconMiniCircleBool extends MovieClip {

public var o
public var m
public var dataO
public var posO
public var btGlobal

var base
var icon
var sele
var title
var togged
	function oconMiniCircleBool(){
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, btGlobal.lineColor, btGlobal.fillColor)	
		togged = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, 4, o.cfg.config.themeColorHex, btGlobal.fillColor)
		icon = this.attachMovie(dataO.bt.b, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
		update()
	}	
	
	function update(){
		trace("UPDATING "+o.cfg.config[dataO.bool.prop])
		if(o.cfg.config[dataO.bool.prop]==1){togged._visible=true}
		else if(o.cfg.config[dataO.bool.prop]==0){togged._visible=false}
		else{o.cfg.config[dataO.bool.prop]=Number(0);togged._visible=false}
	}
	
	
	function light(){
		sele = this.attachMovie("mh_bigdot", "option", this.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})
		core.panel.util.fx.ilight(this)
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		haloHue.rgb = o.cfg.config.themeColorHex
		haloTrans.colorTransform = haloHue
	}
	
	function use(){
		o.cfg.config[dataO.bool.fn](dataO.bool.prop)
		update()
	}
	
	function xUse(){
		o.cfg.config[dataO.bool.fn](dataO.bool.prop, dataO.bool.build.buttons[dataO.bool.ix].dataO.bool.prop)
		update()
		dataO.bool.build.buttons[dataO.bool.ix].update()
	}
		
	function dim(){
		core.panel.util.fx.idim(this)
		sele.removeMovieClip()
	}	

}