

class core.panel.button.oconMiniCircleESG extends MovieClip {

public var o
public var m
public var dataO
public var posO
public var btGlobal

var base
var icon
var sele
var title
var exc
var _font
var textMini

var gen
var genL
var slot
var exclude
var esgVal


	function oconMiniCircleESG(){
		
		gen=dataO.esg.gen
		slot=dataO.esg.slot
		
		if(gen==0){genL = "M"}
		else{genL = "F"}
		esgVal = dataO.esg.type
		exclude = o.cfg.esg.isEsgExclude(slot, gen)
		buildBase()
	}	
	
	function buildBase(){
		base.removeMovieClip()
		if(esgVal){
			base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, 4, o.cfg.config.themeColorHex, undefined)
			
		}else{
			base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, btGlobal.lineColor, btGlobal.fillColor)
		}
		manageIcon()
	}
	
	function manageIcon(){
		var _font = new TextFormat();
		_font.letterSpacing = 1.2
		_font.font = o.fonts.m
		_font.size = 12
		if(!dataO.item.exists){
		_font.color = Number("0xAAAAAA")
		}
		
		var _fontmini = new TextFormat();
		_fontmini.letterSpacing = 1.0
		_fontmini.font = o.fonts.m
		_fontmini.size = 6
		if(!dataO.item.exists){
		_fontmini.color = Number("0xAAAAAA")		
		}
		
		icon.removeMovieClip()
		textMini.removeMovieClip()
		
		if(esgVal){
		  icon = this.attachMovie("ome_a_"+esgVal+"_"+genL, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs}) 
			
			if(!icon){
				icon = this.attachMovie("fontboxCentra", "icon", this.getNextHighestDepth())
			
			icon.val.htmlText = slot+30
			icon.val.setTextFormat(_font);	
			}else{
				textMini = this.attachMovie("fontboxCentra", "textMini", this.getNextHighestDepth(), {_x:-17, _y:-17})
				textMini.val.htmlText = slot+30
				textMini.val.setTextFormat(_fontmini);
			}
		}else{		
		icon = this.attachMovie("fontboxCentra", "icon", this.getNextHighestDepth())
		
		icon.val.htmlText = slot+30
		icon.val.setTextFormat(_font);
	
		}

		if(esgVal){dataO.tx.desc=o.cfg.esg.getEsgName(esgVal, gen)+" | "+o.cfg.lang.slot+" "+(Number(slot)+Number(30))}
		else{dataO.tx.desc = o.cfg.lang.noEsgAssigned+" | "+o.cfg.lang.slot+" "+(Number(slot)+Number(30))}
		
		if(exclude){
			exc = core.util.draw.circle(this.createEmptyMovieClip("excluder", this.getNextHighestDepth()), 13, -13, 7, 1, "0xFFFFFF", o.cfg.config.subColorHex) 
		}else{exc.removeMovieClip()}
		
	}
	
	function setESG(esgType){
		esgVal = esgType
		buildBase()
	}
	
	function setExclude(){
		
		exclude = !exclude
		buildBase()
	}
	
	function setAll(){
		if(esgVal){esgVal = undefined}
		if(exclude){exclude = !exclude}			
		buildBase()
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