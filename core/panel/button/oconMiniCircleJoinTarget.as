

class core.panel.button.oconMiniCircleJoinTarget extends MovieClip {

public var o
public var m
public var dataO
public var posO
public var btGlobal

var base
var filled
var icon
var sele
var title
var name

var target

	function oconMiniCircleJoinTarget(){
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, Number("0x"+m.dataPin.visitor.gfx[0].color), btGlobal.fillColor)
		filled = core.util.draw.circle(this.createEmptyMovieClip("filled", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness*2, Number("0x"+m.dataPin.visitor.gfx[0].color), btGlobal.fillColor)
		name = this.attachMovie("fontbox", "option", this.getNextHighestDepth(), {_x:-25})
		icon = this.attachMovie(m.dataPin.visitor.bt, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
				
		checkTarget()		
	}	
	
	function checkTarget(){
		if(target){
			base._visible = false
			filled._visible = true
			setName(target.name)
		}else{
		setName("")
		base._visible = true
		filled._visible = false
		}
		
	}
	
	function setName(nameText){		
		name.val.htmlText = nameText
		name.val.setTextFormat(btGlobal._font);
		name.val.autoSize = "right";		
	}
	
	function update(newTarget){
		target = newTarget
		dataO.panel.target = newTarget
		checkTarget()
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