

class core.panel.nav.np2.onav.unique.ienhance {


var o
var opt
var ico

	function ienhance (om, option, icon){
		o = om
		opt = option
		ico = icon	
					
		if(ico.multienhance){
			
			for (var i=0; i < opt.x.enhance.length; i++) {
				
				makeEnhanced(opt.m.dia.actra[opt.x.enhance[i].a], i, i)
			}
		}else{
		makeEnhanced(opt.m.dia.actra[opt.x.enhance[0].a], 0, "")
		}
	}
	
	
	function makeEnhanced(actra, num, suf){	
		
			var seeMGen = true
			var seeStockings = true
			var seeIntimates = true
			var toneTrans
			var cur
			//if(actra.equip.attire.hasEsg("pants")){
			//   this["pants"]._visible = true
			//   seeIntimate = false
			//   seeMGen = false
			//}
			

			
							
			
		
			var hasShirt = false
					
			if(ico["shirt"+suf]){
				
				
				
							
				if(actra.equip.attire.hasEsg("cuirass")){
					if(ico["cuirass"+suf+"style"]){cur = ico.attachMovie(opt.icoName+"_intlow", "mgenicon", ico.getNextHighestDepth(), {o:o})
					}else{cur = ico.attachMovie(opt.icoName+"_sh"+suf+"_"+o.cfg.config.gfxAttireDefault[opt.m.dia.actra[opt.x.enhance[num].a].gender].shirt, "ptico"+suf, ico.getNextHighestDepth())
					}
					
				
				
							
					hasShirt = true
					toneTrans = new flash.geom.Transform(cur.cl)
					toneTrans.colorTransform = actra.gfx.c_shirtRGB
				}
				
				
			}
			
			if(ico["pants"+suf]){
				
				if(actra.equip.attire.hasEsg("pants")||(core.util.esg.pantsFromCuirass(o, actra)&&actra.equip.attire.hasEsg("cuirass"))){
					if(ico["pants"+suf+"style"]){cur = ico.attachMovie(opt.icoName+"_intlow", "mgenicon", ico.getNextHighestDepth(), {o:o})
					}else{cur =  ico.attachMovie(opt.icoName+"_pa"+suf+"_"+o.cfg.config.gfxAttireDefault[opt.m.dia.actra[opt.x.enhance[num].a].gender].pants, "ptico"+suf, ico.getNextHighestDepth())
					}
					seeIntimates = false
					seeMGen = false
					toneTrans = new flash.geom.Transform(cur.cl)
					toneTrans.colorTransform = actra.gfx.c_pantsRGB
				}
			}
			
			
			if(seeStockings && ico["socks"+suf]){
				
				if(actra.equip.attire.hasEsg("stockings")){
					if(ico["socks"+suf+"style"]){cur = ico.attachMovie(opt.icoName+"_intlow", "mgenicon", ico.getNextHighestDepth(), {o:o})
					}else{cur =  ico.attachMovie(opt.icoName+"_so"+suf+"_"+o.cfg.config.gfxAttireDefault[opt.m.dia.actra[opt.x.enhance[num].a].gender].socks, "soico"+suf, ico.getNextHighestDepth())
					}
					toneTrans = new flash.geom.Transform(cur.cl)
					toneTrans.colorTransform = actra.gfx.c_socksRGB
				}
			}
			
			
			if(seeIntimates && ico["panty"+suf]){
				if(actra.equip.attire.hasEsg("intlow")){
					if(ico["intlow"+suf+"style"]){cur = ico.attachMovie(opt.icoName+"_intlow", "mgenicon", ico.getNextHighestDepth(), {o:o})
					}else{cur = ico.attachMovie(opt.icoName+"_pt"+suf+"_"+o.cfg.config.gfxAttireDefault[opt.m.dia.actra[opt.x.enhance[num].a].gender].panty, "ptico"+suf, ico.getNextHighestDepth())
					seeMGen = false
					toneTrans = new flash.geom.Transform(cur.cl)
					toneTrans.colorTransform = actra.gfx.c_intlowRGB
					}
				}
			}

			if(seeMGen && ico.cock+"suf"){
				if(actra.gfx.hasMGen==true){
					var mgendisplay
					if(ico["ck"+suf+"_"+actra.gfx.mgenSizeGFX]){mgendisplay = "ck"+suf+"_"+actra.gfx.mgenSizeGFX}
					else if(ico["ck"+suf+"_"+(Number(actra.gfx.mgenSizeGFX)-1)]){mgendisplay = "ck"+suf+"_0"+(Number(actra.gfx.mgenSizeGFX)-1)}
					else{mgendisplay = "ck"+suf+"_0"}
					
					var icomgen = ico.attachMovie(opt.icoName+"_"+mgendisplay, "mgenico", ico.getNextHighestDepth())
					toneTrans = new flash.geom.Transform(icomgen.mg)
					toneTrans.colorTransform = actra.gfx.mgRGB
				}
			}		
		
	}
	
}