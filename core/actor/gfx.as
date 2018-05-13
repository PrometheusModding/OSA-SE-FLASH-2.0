import skse;

class core.actor.gfx
{
	
var o
var actra

var skRGB
var skdRGB
var sklRGB
var liRGB
var haRGB
var hadRGB
var halRGB
var eyRGB
var niRGB
var mgRGB
var mglRGB
var mgdRGB
var fgRGB
var npRGB
var frRGB
var elRGB
var esRGB
var vnRGB
var bsRGB
var brRGB
var blRGB
var cmRGB

var c_intlowRGB
var c_shirtRGB
var c_pantsRGB
var c_socksRGB

var hasMGen
var mgenSizeGFX

var has
var gfxData

		public function gfx(om, act){
		o = om
		actra = act		
		
		has = false
		mgenSizeGFX = 0
		}
		
		
		public function storeData(GfxData){			
		if(o.cfg.config.logging){actra.log.addLog("gen", "Checked for gfx.xml...")}
			if(GfxData&&!has){
				has = true
				gfxData = GfxData
				if(o.cfg.config.logging){actra.log.addLog("gen", "gfx.xml FOUND!")}
				core.actor.util.func.expandRGB(o, actra, gfxData)
				core.actor.util.func.expandGFX(o, actra, gfxData)
			}else{
				if(o.cfg.config.logging){actra.log.addLog("gen", "gfx.xml not found...")}
				core.actor.util.func.expandRGB(o, actra, gfxData)
			}
			
			actra.gfx.finalize()
			
			if(o.cfg.config.logging){actra.log.addLog("gfx", "GFX load complete...")}
		}
		
		
		function finalize(){			
			if(o.cfg.config.logging){actra.log.addLog("gfx", "Generating light and dark shades...")}		
			shadeGen("skdRGB", "skRGB", Number(o.cfg.xconfig.gfxConfig[0].autoShade[0].darkAdj))
			shadeGen("sklRGB", "skRGB", Number(o.cfg.xconfig.gfxConfig[0].autoShade[0].lightAdj))
			shadeGen("hadRGB", "haRGB", Number(o.cfg.xconfig.gfxConfig[0].autoShade[0].darkAdj))
			shadeGen("halRGB", "haRGB", Number(o.cfg.xconfig.gfxConfig[0].autoShade[0].lightAdj))
			shadeGen("mgdRGB", "mgRGB", Number(o.cfg.xconfig.gfxConfig[0].autoShade[0].darkAdj))
			shadeGen("mglRGB", "mgRGB", Number(o.cfg.xconfig.gfxConfig[0].autoShade[0].lightAdj))			
		
			shadeGen("vnRGB", "skRGB", Number(o.cfg.xconfig.gfxConfig[0].autoShade[0].darkAdj))
			shadeGen("esRGB", "skRGB", Number(o.cfg.xconfig.gfxConfig[0].autoShade[0].darkAdj))
			shadeGen("bsRGB", "skRGB", Number(o.cfg.xconfig.gfxConfig[0].autoShade[0].darkAdj))
		}
		
		
		
		
	
			
		function shadeGen(shade, base, val){			
			this[shade] = new flash.geom.ColorTransform
			this[shade].rgb = core.util.func.ampRGB(this[base].rgb, val, val ,val)
			this[shade].from = "Auto-Shade"
			//this[shade].blueMultiplier = val
			//this[shade].redMultiplier = val
			//this[shade].greenMultiplier = val			
			
		}
		
		
		

		
		

}


