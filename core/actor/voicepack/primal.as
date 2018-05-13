import skse;

class core.actor.voicepack.primal
{
	
var o
var actra


var formSuite
var formMod
var formid
var formClass

var formIndex = 10


var breath0
var breath1
var breath2

var effort0
var effort1
var effort2

var subtle0
var subtle1
var subtle2

var medium0
var medium1
var medium2

var loud0
var loud1
var loud2

var frenzy0
var frenzy1
var frenzy2

var flavor0
var flavor1
var flavor2

		public function primal(core, act){
		o = core
		actra = act		
		}
		
		public function expandFormData(){
			formMod = formSuite.mod
			formid = String(Number("0x"+formSuite.formid))
			formClass = formSuite.id

			register()
			
			entrify("breath0", formSuite)
			entrify("breath1", formSuite)
			entrify("breath2", formSuite)
			
			entrify("effort0", formSuite)
			entrify("effort1", formSuite)
			entrify("effort2", formSuite)

			entrify("subtle0", formSuite)
			entrify("subtle1", formSuite)
			entrify("subtle2", formSuite)
			
			entrify("medium0", formSuite)
			entrify("medium1", formSuite)
			entrify("medium2", formSuite)
			
			entrify("loud0", formSuite)
			entrify("loud1", formSuite)
			entrify("loud2", formSuite)
			
			entrify("frenzy0", formSuite)
			entrify("frenzy1", formSuite)
			entrify("frenzy2", formSuite)
			
			entrify("flavor0", formSuite)
			entrify("flavor1", formSuite)
			entrify("flavor2", formSuite)
			
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

