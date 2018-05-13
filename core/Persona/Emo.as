
class Emo
{
	
var o
var actra
var func
var type
var emo
var emoEyes
var preEmo
var drive
var recover = false




		public function Emo(core, act, emoType, driveType, emoClass, recoverToggle){
		o = core
		actra = act	
		}				
		
		public function emoStandard(emoType, pEmo, eyes, recoverToggle){
			type = emoType
			emoEyes = eyes
			preEmo = pEmo
			drive = pEmo.drive			
			emo = preEmo.id
			recover = recoverToggle

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
		
		public function personaIsLoaded(){
			var longEx = {fn:this[type], scope:this}
			o.lib.getMotifData(longEx, drive, "emo", actra.persona[drive].emo[type], emo)
		}
		
		public function expression(){
			
			emo = o.lib.getMotif(drive, "emo", actra.persona[drive].emo[type], emo)
			
			this[preEmo.use]()
		}
		

		
		public function voice(){
			
			emo = o.lib.getMotif(drive, "emo", actra.persona[drive].emo[type], emo)
			
			this[preEmo.use]()
		}
		
		
		
		function emoex(){
			var tier = core.util.func.TIERuncapped(emo[preEmo.use], preEmo.degree)
			
			for (var i=0; i < tier.declare.length; i++) {
			this[tier.declare[i].id+"EmoEx"](tier)			}

			
		}
		
		
		
		function expressionEmoEx(tier){
			MienOutput.expression(actra, core.util.func.TIERper(tier.expression[0].emo), tier.revert)
			
		}
		
		function browsEmoEx(tier){
			MienOutput.brows(actra, core.util.func.TIERper(tier.brows[0].emo), tier.revert)
		}
		
		function mouthEmoEx(tier){
			trace("MOUTH HAPPENING")
			MienOutput.mouth(actra, core.util.func.TIERper(tier.mouth[0].emo), true)
		}
		
		function lidsEmoEx(tier){
			MienOutput.lids(actra, core.util.func.TIERper(tier.lids[0].emo), tier.revert)
		}
		
		function eyesEmoEx(tier){
			if(emoEyes){
			var emoUnit = core.util.func.TIERper(tier.eyes[0].emo)
				if (emoUnit.focus){
				actra.expression.focusOn(emoEyes, emoUnit.focus)
				}
			}
		}
		
		function squintEmoEx(tier){
			
			MienOutput.squint(actra, core.util.func.TIERper(tier.squint[0].emo), tier.revert)
		}
		
		function emovo(){
			trace("WE ARE HERE")
			var tier = core.util.func.TIERuncapped(emo[preEmo.use], preEmo.degree)
			trace("TIER: "+preEmo.use)
			if(tier.voice){MienOutput.voice(actra, core.util.func.TIERper(tier.voice[0].emo), 0)}
			
		}
		

				
}