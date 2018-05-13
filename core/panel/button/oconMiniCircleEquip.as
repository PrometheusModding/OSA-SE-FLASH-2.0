

class core.panel.button.oconMiniCircleEquip extends MovieClip {

public var o
public var m
public var actra
public var dataO
public var posO
public var btGlobal

var base
var icon
var sele
var title
var worn
var _font
var textMini

var hasItem

	function oconMiniCircleEquip(){
		
		hasItem = false
		if(dataO.item){
			if(dataO.item.exists){
				hasItem = true
				if(dataO.item.faux){
				base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, 4, o.cfg.config.subColorHex, undefined)				
				}else{
				base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, 4, o.cfg.config.themeColorHex, undefined)
				}
			manageIcon()
			}else{
			base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, "0xAAAAAA", undefined)	
			manageIcon()
			}
		}else{
			base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, btGlobal.lineColor, btGlobal.fillColor)
		}
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
		

		if(o.cfg.esg.getEsg(dataO.item.slot, actra.gender)&&!dataO.item.faux){
		  icon = this.attachMovie("ome_a_"+o.cfg.esg.getEsg(dataO.item.slot, actra.gender)+"_"+actra.genderL, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs}) 
			
			if(!icon){
				icon = this.attachMovie("fontboxCentra", "icon", this.getNextHighestDepth())
			
			icon.val.htmlText = dataO.item.slot+30
			icon.val.setTextFormat(_font);	
			}else{
				textMini = this.attachMovie("fontboxCentra", "textMini", this.getNextHighestDepth(), {_x:-17, _y:-17})
				textMini.val.htmlText = dataO.item.slot+30
				textMini.val.setTextFormat(_fontmini);
			}
		}else if(dataO.item.faux){
			icon = this.attachMovie("ome_a_"+dataO.item.esg+"_"+actra.genderL, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs}) 
			textMini = this.attachMovie("fontboxCentra", "textMini", this.getNextHighestDepth(), {_x:-22, _y:-20})
			textMini.val.htmlText = "faux"
			textMini.val.setTextFormat(_fontmini);
						
		}else{		
		icon = this.attachMovie("fontboxCentra", "icon", this.getNextHighestDepth())
		
		icon.val.htmlText = dataO.item.slot+30
		icon.val.setTextFormat(_font);
	
		}
		calcWorn()
	}
	
	
	function calcWorn(){
		if(dataO.item.exists){
			if(!dataO.item.worn){
				if(!dataO.item.faux){
					
				}
			worn = this.attachMovie("mfx_strike", "worn", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
			
			var haloTrans = new flash.geom.Transform(worn.gx);
			var haloHue = new flash.geom.ColorTransform
			if(dataO.item.faux){
			haloHue.rgb = o.cfg.config.subColorHex
			}else{
			haloHue.rgb = o.cfg.config.themeColorHex
			}
			haloTrans.colorTransform = haloHue
		
			}else{
			worn.removeMovieClip()
			}
		}
	}
	
	function light(){
		sele = this.attachMovie("mh_bigdot", "option", this.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})
		
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		if(dataO.item.faux){
		haloHue.rgb = o.cfg.config.subColorHex
		}else{
		haloHue.rgb = o.cfg.config.themeColorHex
		}
		haloTrans.colorTransform = haloHue
	}
	
	function dim(){
		sele.removeMovieClip()
	}	

}