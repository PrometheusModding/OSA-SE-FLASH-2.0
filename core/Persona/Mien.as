
class Mien
{
	
var o
var actra
var func
var type
var mien
var mienEyes
var preMien
var drive
var recover = false




		public function Mien(core, act, mienType, driveType, mienClass, recoverToggle){
		o = core
		actra = act
		
		
		}				
		
		public function mienStandard(mienFn, mienType, pMien, eyes, recoverToggle){
			func = mienFn
			type = mienType
			mienEyes = eyes
			preMien = pMien
			drive = pMien.drive			
			mien = preMien.id
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
			var longEx = {fn:this[func], scope:this}
			o.lib.getMotifData(longEx, drive, "mien", actra.persona[drive].mien[type], mien)
		}
		
		public function expression(){
			
			mien = o.lib.getMotif(drive, "mien", actra.persona[drive].mien[type], mien)
			
			trace("LastTrace: "+mien)
			
			this[preMien.use+"Expression"]()
			//for (var i=0; i < mienUnitEx.mien.length; i++){
			//actra.expression.mien(mienUnitEx.mien[i])
			//}
			
			//if(recover){recoverMien(mienUnitEx)}
		}
		
		
		public function emotia(){
			
			mien = o.lib.getMotif(drive, "mien", actra.persona[drive].mien[type], mien)
			
			trace("LastTraceFACE: "+mien)
			
			this[preMien.use+"Emotia"]()
		}
		
		public function emovia(){
			
			mien = o.lib.getMotif(drive, "mien", actra.persona[drive].mien[type], mien)
			
			this[preMien.use+"Emotia"]()
		}
		
		
		
		function emoexEmotia(){
			var tier = core.util.func.TIERuncapped(mien[preMien.use], preMien.degree)
			
			if(tier.expression){MienOutput.expression(actra, core.util.func.TIERper(tier.expression[0].mien), tier.revert)}
			if(tier.brows){MienOutput.brows(actra, core.util.func.TIERper(tier.brows[0].mien), tier.revert)}
			if(tier.mouth){MienOutput.mouth(actra, core.util.func.TIERper(tier.mouth[0].mien), true)}
			if(tier.lids){MienOutput.lids(actra, core.util.func.TIERper(tier.lids[0].mien), tier.revert)}
			if(tier.squint){MienOutput.voice(actra, core.util.func.TIERper(tier.voice[0].mien), tier.revert)}

			
		}
		
		
		function emovoEmotia(){
			trace("WE ARE HERE")
			var tier = core.util.func.TIERuncapped(mien[preMien.use], preMien.degree)
			trace("TIER: "+preMien.use)
			if(tier.voice){MienOutput.voice(actra, core.util.func.TIERper(tier.voice[0].mien), 0)}
			
		}
		
		
		
		function montageExpression(){
			var tier = core.util.func.TIERuncapped(mien[preMien.use], preMien.degree)
			
			if(tier.expression){MienOutput.expression(actra, core.util.func.TIERper(tier.expression[0].mien), false)}
			if(tier.brows){MienOutput.brows(actra, core.util.func.TIERper(tier.brows[0].mien), false)}
			if(tier.mouth){MienOutput.mouth(actra, core.util.func.TIERper(tier.mouth[0].mien), false)}
			if(tier.lids){MienOutput.lids(actra, core.util.func.TIERper(tier.lids[0].mien), false)}
			if(tier.squint){MienOutput.voice(actra, core.util.func.TIERper(tier.voice[0].mien), false)}

			
		}
		

		
		public function voice(){
			
			mien = o.lib.getMotif(drive, "mien", actra.persona[drive].mien[type], mien)
			
			this[preMien.use+"Voice"]()
		}
		
		function montageVoice(){
			var tier = core.util.func.TIERuncapped(mien[preMien.use], preMien.degree)
			if(tier.voice){MienOutput.voice(actra, core.util.func.TIERper(tier.voice[0].mien), 0)}
			
		}
		
		
		
		
		
		function recoverMien(mienUnitEx){
			
			for (var i=0; i < mienUnitEx.mien.length; i++){
					if(mienUnitEx.mien[i].re){ 
					var restore = []
					restore[0] = mienUnitEx.mien[i]
					var time = new OTime({fn:exMienOut, scope:this}, mienUnitEx.mien[i].re*1000, restore)
					}
			}
		}
		
		function exMienOut(mienUnit){
			actra.expression.mienEnd(mienUnit.ty, mienUnit.sy)
		}
		
}