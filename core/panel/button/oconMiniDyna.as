

class core.panel.button.oconMiniDyna extends MovieClip {

public var o
public var dataO
public var posO
public var btGlobal
public var data
public var m

public var homePanel

var opt
var base
var ico
var burstIco
var burster
var sele
var title
var x

var icoName
var icoEnhanced

var lastShowcase


var titleText
var titleTextPlus
var titleEx

var tags
var cmd
var cmdOut

	function oconMiniDyna(){
		x = data
		opt={x:data}
		
		cmd = []
		cmdOut = []
		tags = []
		
		var baseColor = Number("0xFFFFFF")
		if(x.baseRGB){
			baseColor = Number("0x"+x.baseRGB)
		}
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, baseColor, btGlobal.fillColor)	
		
		icoName = core.panel.nav.np2.util.func.iconCmd(opt.x.icon.toLowerCase(), o, m)
		
		ico = this.attachMovie(data.icon, "ico", this.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
		ico.block = {x:x, o:o, actra:m.dia.actra}
		core.util.func.iconAdjust(x, ico)
		
	
		
		enhance(opt.x, ico)
		setRGB(opt.x, ico)
		
		titleText = core.util.syntax.SynDesc(o, o.lib.translate(data.text, m.dia.module.id, "P"), x, o.lib.langP[m.dia.module.id], m.dia.actra)
		
		if(data.ex[0]){			

		titleEx = core.util.syntax.SynDesc(o, o.lib.translate(data.ex[0].text, m.dia.module.id, "P"), data.ex[0], o.lib.langP[m.dia.module.id], m.dia.actra)
		//titleEx = "Umm<font color='#000000' size='25' >some text</font><span style=\"text-transform: uppercase;\">some text</span>"
		}
		   
		titleTextPlus = []
		for (var i=0; i < data.titlePlus.length; i++){
		titleTextPlus[i] = core.util.syntax.SynDesc(o, o.lib.translate(data.titlePlus[i].text, m.dia.module.id, "P"), data.titlePlus[i], o.lib.langP[m.dia.module.id], m.dia.actra)
		}
		
		tags[0] = data.tags[0].id
			
			
			
			cmd[0] = "warp"			   	
				if(data.fn=="navtag"){
				cmdOut[0]="navtag"
				}else if(data.fn=="anav"){
				cmdOut[0]=data.warp		
				}
			if(data.travel){
				cmd[1] = "travel"			   	
				if(data.fn=="navtag"){
				cmdOut[1]="navtag"
				}else if(data.fn=="anav"){
				cmdOut[1]=data.travel				
				}			   
			}

	}	
	
	function requestBurster(cycle){
		
		if(data.showcase){
			
				if(cycle){
					var showcaseIx
					var showcaseArr = []
					showcaseArr.concat(data.showcase)
					
						for (var i=0; i < showcaseArr.length; i++){
							if(showcaseArr.icon==lastShowcase){
								showcaseArr.splice(i)
							}
						}
						
						x = showcaseArr[core.util.func.RNG(0,data.showcase.length-1)]
				}
			x = data.showcase[core.util.func.RNG(0,data.showcase.length-1)]
			
			lastShowcase = x.icon
		}
		
		
		burstIco.removeMovieClip()		
		icoName = core.panel.nav.np2.util.func.iconCmd(x.icon.toLowerCase(), o, m)		
		burstIco = homePanel.burstIcoPin.attachMovie(x.icon, "icoBursta", homePanel.burstPanel.getNextHighestDepth(), {_visible:true})		
		burstIco.block = {x:x, o:o, actra:m.dia.actra}
		enhance(x, burstIco)
		setRGB(x, burstIco)	
		
		
		core.util.func.iconAdjust(x, burstIco)
	}
	
	function enhance(xx, ic){
		if(xx.enhance && o.cfg.config.dynamicIconDisplay=="1"){
				icoEnhanced = undefined
				icoEnhanced = new core.panel.nav.np2.onav.unique.ienhance(o, this, ic)
			}
			
		
		
	}
	
	function setRGB(xx, ic){
		if(xx.ihue[0]){				
					for (var i=0; i < xx.ihue.length; i++){					
					var outcome = core.panel.nav.np2.util.func.hueFormCmd(x.ihue[i], ic, o, m)
						if(outcome=="deny"){		
						}
					}
				}
	}
	
	
	function light(){
		homePanel.burstPanel.currentIco = this
		homePanel.burstPanel.setNewBurster()
		
		sele = this.attachMovie("mh_bigdot", "option", this.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})		
		core.panel.util.fx.ilight(this)
		
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		haloHue.rgb = o.cfg.config.themeColorHex
		haloTrans.colorTransform = haloHue
	}
	
	
	function dim(){
		
		homePanel.burstPanel.dimEntry(this)
		sele.removeMovieClip()
		burster.removeMovieClip()
		burstIco._visible=false
		core.panel.util.fx.idim(this)		
		
	}	

}