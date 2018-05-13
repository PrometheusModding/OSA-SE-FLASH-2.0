import skse;

class core.actor.voicepack.sound
{
	
var o
var actra


var formSuite
var formMod
var formid
var formClass

var formIndex = 20


var bored0
var bored1
var bored2

var curious0
var curious1
var curious2

var jolt0
var jolt1
var jolt2

var sharp0
var sharp1
var sharp2

var pain0
var pain1
var pain2

		public function sound(core, act){
		o = core
		actra = act		
		}
		
		public function expandFormData(){
			formMod = formSuite.mod
			formid = String(Number("0x"+formSuite.formid))
			formClass = formSuite.id

			register()
			
			entrify("bored0", formSuite)
			entrify("bored1", formSuite)
			entrify("bored2", formSuite)
			
			entrify("curious0", formSuite)
			entrify("curious1", formSuite)
			entrify("curious2", formSuite)
			
			entrify("jolt0", formSuite)
			entrify("jolt1", formSuite)
			entrify("jolt2", formSuite)

			entrify("sharp0", formSuite)
			entrify("sharp1", formSuite)
			entrify("sharp2", formSuite)
			
			entrify("pain0", formSuite)
			entrify("pain1", formSuite)
			entrify("pain2", formSuite)
			
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

