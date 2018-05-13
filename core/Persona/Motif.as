
class Motif
{
	
var o
var actra
var motif
var sceneUnit


var theme
var activated = false

var voiceDataMien

var reactExDataMien
var reactVoDataMien

		public function Motif(core, act, scu, motifData){
		o = core
			if(o.cfg.config.tempMotif == 1){
				actra = act
				sceneUnit = scu
				motif = motifData
				
				
				
				reactExDataMien = []
				reactVoDataMien = []
				
				activated = true
		
					if(!actra.formBound){
						if(!actra.dat.personaData){
						var scout = new Scout(o)
						var sourceBack = {fn:personaIsLoaded, scope:this}
						scout.retrieveActraData("persona", actra, sourceBack)
						}else{actra.formBind()
						personaIsLoaded()
						}
					}else{personaIsLoaded()}
			}
		}				
		
		public function personaIsLoaded(){
			var longEx = {fn:themeIsLoaded, scope:this}
			o.lib.getMotifData(longEx, motif.drive, "motif", actra.persona[motif.drive].motif, "d_"+motif.theme)			
		}
		
		public function themeIsLoaded(){
			
			theme = o.lib.getMotif(motif.drive, "motif", actra.persona.intimate.motif, "d_"+motif.theme)
		 	beginEx()
		}
		

		function beginVo(){
		var time = new Time({fn:beginVoCycle, scope:this}, core.util.func.RNG(1000,4000))
		}
		
		function beginVoCycle(){
		if(activated){
			if(voiceDataMien){
			var mien = core.util.func.TIERper(voiceDataMien.mien)
			if(mien){MienOutput.voice(actra, mien)}
			
			}
			var time = new Time({fn:beginVoCycle, scope:this}, core.util.func.RNG(1000,4000))
		}
		}
		
		
		public function voiceMien(mien, activeTier){
		voiceDataMien = mien[activeTier.use][activeTier.degree].voice[0]
		}
		
		
		function beginEx(){		
		trace("				!Motif Expression Started: "+theme.id)
		beginVo()
		var time = new Time({fn:beginCycle, scope:this}, core.util.func.RNG(0, 5000))
		}
		
		
				
		
		public function beginCycle(){
		if(activated){
		var tier = decideTier()
		decide("expression", "expression", tier)
		decide("brows", "expression", tier)
		decide("squint", "expression", tier)
		decide("lids", "expression", tier)
		decide("mouth", "expression", tier)
		decide("eyes", "expression", tier)
		decide("reactionex", "expression", tier)
		if(tier.voice[0].id){decide("voice", "voice", tier)}
		
				var time = new Time({fn:beginCycle, scope:this}, core.util.func.RNG(6000,9000))
		}
		}
		
		
		public function decideTier(){
		var caliber = 4
		var intensity = sceneUnit.scena.getIntensity(sceneUnit.role)
		var tier = theme.motif[0].caliber[caliber]
				if(!tier){
					tier = theme.motif[0].caliber[theme.motif[0].caliber.length-1]
				}
				if(tier.hasintensity){
						var tierIntensity = tier.intensity[intensity]	
						if(!tierIntensity){
							tierIntensity = tier.intensity[tier.intensity.length-1]
						}
						
						tier = tierIntensity
				}
			return tier
		}
		
		public function decide(section, mienType, activeTier){
			activeTier = core.util.func.TIERper(activeTier[section])			
			
			if(activeTier){
	
					if(!o.lib.getMotif(activeTier.drive, "mien", actra.persona[activeTier.drive].mien[mienType], activeTier.id)){
						var active = []
						active[0] = section
						active[1] = activeTier	
						active[2] = mienType	
						var callBack = {fn:outMien, scope:this, extra:active}
						o.lib.getMotifData(callBack, activeTier.drive, "mien", actra.persona[activeTier.drive].mien[mienType], activeTier.id)		
					}else{outMien(section, activeTier, mienType)}
			}
		}
		
		
		function outMien(section, activeTier, mienType){
			var mien = o.lib.getMotif(activeTier.drive, "mien", actra.persona[activeTier.drive].mien[mienType], activeTier.id)
			this[section+"Mien"](mien, activeTier)
		}
		
		

		public function expressionMien(mien, activeTier){
			if(mien){
				var tier = core.util.func.TIERuncapped(mien[activeTier.use], activeTier.degree)
				MienOutput.expressionSaveEx(actra, core.util.func.TIERper(tier.expression[0].mien), 0)
			}
		}
		
		public function browsMien(mien, activeTier){
			if(mien){
				var tier = core.util.func.TIERuncapped(mien[activeTier.use], activeTier.degree)
				MienOutput.brows(actra, core.util.func.TIERper(tier.brows[0].mien), 0)}	
		}
		
		public function squintMien(mien, activeTier){
			if(mien){
				var tier = core.util.func.TIERuncapped(mien[activeTier.use], activeTier.degree)
				MienOutput.squint(actra, core.util.func.TIERper(tier.squint[0].mien), 0)}	
		}
		
		public function lidsMien(mien, activeTier){
			if(mien){
				var tier = core.util.func.TIERuncapped(mien[activeTier.use], activeTier.degree)
				MienOutput.lids(actra, core.util.func.TIERper(tier.lids[0].mien), 0)}	
		}
		
		public function mouthMien(mien, activeTier){
			if(mien){
				var tier = core.util.func.TIERuncapped(mien[activeTier.use], activeTier.degree)
				MienOutput.mouth(actra, core.util.func.TIERper(tier.mouth[0].mien), 0)}	
		}
		
		public function eyesMien(mien, activeTier){
			if(mien){
				var tier = core.util.func.TIERuncapped(mien[activeTier.use], activeTier.degree)
				var eyeUnit = sceneUnit.scene.eyes[sceneUnit.role]
				//mien = mien.facerelation[eyeUnit.face].actionrelation[eyeUnit.action].bodyrelation[eyeUnit.body]
				//MienOutput.mouth(actra, mien, 0)
				if(!tier.special){
				mien = core.util.func.TIERper(tier.facerelation[eyeUnit.facerel].actionrelation[eyeUnit.actionrel].bodyrelation[eyeUnit.bodyrel].mien)
				
				}else{
				if(tier.simple){
				   mien = core.util.func.TIERper(tier.mien)
				  }
				}
				trace("Eyes output: "+mien.focus)
				actra.expression.focusOn(eyeUnit, mien.focus)
				}	
		}
		
		public function reactionexMien(mien, activeTier){
			if(mien){
				var tier = core.util.func.TIERuncapped(mien[activeTier.use], activeTier.degree)
				recordReactionEx(tier)
				//MienOutput.mouth(actra, core.util.func.TIERper(tier.mouth[0].mien), 0)}	
		}
		}
		
		function recordReactionEx(mien){
			//trace("REACTIONEX BUILDER"+mien+" "+mien.mien[0].sy)
			for (var i=0; i < mien.mien.length; i++) {
				reactExDataMien.push({sy:mien.mien[i].sy, am:mien.mien[i].am, pan:mien.mien[i].pan, rec:mien.mien[i].rec})
			}
		}
		
		
		public function reaction(){
			if(reactExDataMien){
				MienOutput.reactionex(actra, reactExDataMien[reactExDataMien.length-1])	
			}
			
		}
		
		public function End(){
			activated = false
			
		}
}