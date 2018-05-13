

class core.panel.button.oconMyEntry extends MovieClip {

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

	function oconMyEntry(){

		
		var thickness = dataO.type.th
		if(dataO.entry.th){
		thickness = dataO.entry.th 	
		}
		
		var lineColor = Number("0x"+dataO.type.lc)
		if(dataO.entry.lc){
		lineColor = Number("0x"+dataO.entry.lc) 	
		}
		

		
		var fill = Number("0x"+dataO.type.b)
		if(dataO.entry.b){
		fill = Number("0x"+dataO.entry.b) 	
		}
		
		

			if(dataO.entry.t){
			dataO.tx.desc+=" | "+dataO.entry.t
			}
			
			if(dataO.entry.s){
			dataO.tx.desc+=" | "+dataO.entry.s
			}

		shape = dataO.type.sh
			if(dataO.entry.sh=="sq"){
			shape = "sq"
			}else if(dataO.entry.sh=="ci"){
			shape = "ci"
			}
		
		if(shape=="sq"){
		base = core.util.draw.square(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, thickness, lineColor, fill)	
		
			var seleFill = Number("0x"+dataO.type.sb)
			if(dataO.entry.sb){
			seleFill = Number("0x"+dataO.entry.sb) 	
			}
			

			
			if(isNaN(Number(seleFill))){
			seleFill = o.cfg.config.themeColorHex
			
			}
			
			
			var seleThickness = Number("0x"+dataO.type.sth)
			if(dataO.entry.sth){
			seleThickness = Number("0x"+dataO.entry.sth) 	
			}

			
			var seleLineColor = Number("0x"+dataO.type.slc)
			if(dataO.entry.slc){
			seleLineColor = Number("0x"+dataO.entry.slc) 	
			}
			
			if(isNaN(Number(seleLineColor))){
			seleLineColor = o.cfg.config.themeColorHex
			}
			
			sele = core.util.draw.square(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, seleThickness, seleLineColor, seleFill)
			sele._visible = false
		
		
		}else if(shape=="ci"){
			base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, thickness, lineColor, fill)
				
				haloType = dataO.type.h
				if(dataO.entry.h){haloType = dataO.entry.h}		
				
				if(haloType == "!"){
				haloType = "mh_bigdot"
				}
		}
		
		if(dataO.entry.i){
		icon = this.attachMovie(dataO.entry.i, "icon", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
		}
		
		
		var _font = new TextFormat();
		_font.letterSpacing = .9
		_font.font = o.fonts.m
		_font.size = 8
		
		entryName = this.attachMovie("fontbox", "option", this.getNextHighestDepth(), {_x:btGlobal.toff, _y:4})	
		
		var fontColor = "0x"+dataO.type.fc
		if(dataO.entry.fc){
		_font.color = "0x"+dataO.entry.fc
		}
		
		entryName.val.htmlText = dataO.entry.n
		entryName.val.setTextFormat(_font);
		entryName.val.autoSize = "right";		
	}	
	
	function light(){
		if(shape=="sq"){
		sele._visible = true
		}else{
		
		sele = this.attachMovie(haloType, "option", this.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})
		
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		haloHue.rgb = o.cfg.config.themeColorHex
		haloTrans.colorTransform = haloHue
		}
	}
	
	function dim(){
		if(shape=="sq"){
		sele._visible = false	
		}else{sele.removeMovieClip()}
	}	

}