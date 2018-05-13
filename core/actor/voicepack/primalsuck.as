import skse;

class core.actor.voicepack.primalsuck
{
	
var o
var actra

var formSuite
var formMod
var formid
var formClass

var formIndex = 11

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

var gag0
var gag1
var gag2

var lips0
var lips1
var lips2

var throat0
var throat1
var throat2

var throatf0
var throatf1
var throatf2



		public function primalsuck(core, act){
		o = core
		actra = act		
		}
		
		public function expandFormData(){
			formMod = formSuite.mod
			formid = String(Number("0x"+formSuite.formid))
			formClass = formSuite.id
			
			register()
			
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
			
			entrify("gag0", formSuite)
			entrify("gag1", formSuite)
			entrify("gag2", formSuite)
			
			entrify("lips0", formSuite)
			entrify("lips1", formSuite)
			entrify("lips2", formSuite)
			
			entrify("throat0", formSuite)
			entrify("throat1", formSuite)
			entrify("throat2", formSuite)
			
			entrify("throatf0", formSuite)
			entrify("throatf1", formSuite)
			entrify("throatf2", formSuite)
		}
		
		
		function register(){
		actra.regFormBind(formIndex, formMod, formid)
		}
		
		public function entrify(entry, formData){
			this[entry] = {indx:formData[entry][0].indx, ti:formData[entry][0].ti}
		}
		
		public function makeSound(soundType, soundZeal, notSpoken){
			trace("SOUND IS HAPPANEING NOW"+this[soundType+soundZeal].indx+" CurZeal: "+soundType+soundZeal)
			var sound = this[soundType+soundZeal] 
			actra.voice.skySend(formIndex, sound.indx, sound.ti, notSpoken)	
		}

}


