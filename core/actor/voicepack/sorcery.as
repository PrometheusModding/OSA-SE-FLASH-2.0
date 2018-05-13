import skse;

class core.actor.voicepack.sorcery
{
	
var o
var actra


var formSuite
var formMod
var formid
var formClass

var formIndex = 80


var build0
var release0


		public function sorcery(core, act){
		o = core
		actra = act		
		}
		
		public function expandFormData(){
			formMod = formSuite.mod
			formid = String(Number("0x"+formSuite.formid))
			formClass = formSuite.id

			register()
			
			entrify("build0", formSuite)
			entrify("release0", formSuite)
		}
		
		
		function register(){
		actra.regFormBind(formIndex, formMod, formid)
		}
		public function entrify(entry, formData){
			this[entry] = {indx:formData[entry][0].indx, ti:formData[entry][0].ti, lsync:formData[entry][0].lsync, lshape:formData[entry][0].lshape}
		}
		
		
		public function makeSound(soundType, soundZeal){
			trace("		!Sound(Voice): "+this[soundType+soundZeal].indx+" CurZeal: "+soundType+soundZeal)
			var sound = this[soundType+soundZeal] 
			var Lips = new LipSync(actra, sound, formIndex)
		}
}

