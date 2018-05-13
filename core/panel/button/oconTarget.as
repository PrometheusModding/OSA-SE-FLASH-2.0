

class core.panel.button.oconTarget extends MovieClip {

public var o
public var dataO
public var posO
public var btGlobal

var base
var icon
var sele
var title
var entryName

var textWidth
var textHeight

var shape

var haloType

	function oconTarget(){


			base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, btGlobal.lineColor, btGlobal.fillColor)

		if(dataO.tx.gender==1){icon = this.attachMovie("omu_female", "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})}
		else{icon = this.attachMovie("omu_male", "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})}
		
		
		var _font = new TextFormat();
		_font.letterSpacing = 1.0
		_font.font = o.fonts.l
		_font.size = 14	
		
		entryName = this.attachMovie("fontbox", "option", this.getNextHighestDepth(), {_x:btGlobal.toff})	
		
		entryName.val.htmlText = dataO.tx.desc
		entryName.val.setTextFormat(_font);
		entryName.val.autoSize = "right";		
	}	
	
	function light(){
		sele = this.attachMovie("mh_bigdot", "option", this.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})
		
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		haloHue.rgb = o.cfg.config.themeColorHex
		haloTrans.colorTransform = haloHue
	}
	
	function dim(){
		sele.removeMovieClip()
	}

}