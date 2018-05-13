
class core.actor.bospack.spank
{
	
var o
var actra


var formSuite
var formMod
var formid
var formClass

var formIndex = 60



var slap0
var slap1
var slap2
var slap3

var direct0
var direct1
var direct2
var direct3


		public function spank(core, act){
		o = core
		actra = act		
		}
		
		public function expandFormData(){
			formMod = formSuite.mod
			formid = String(Number("0x"+formSuite.formid))
			formClass = formSuite.id

			register()
			
			entrify("slap0", formSuite)
			entrify("slap1", formSuite)
			entrify("slap2", formSuite)
			entrify("slap3", formSuite)
			
			entrify("direct0", formSuite)
			entrify("direct1", formSuite)
			entrify("direct2", formSuite)
			entrify("direct3", formSuite)
			
		}
		
		
		function register(){
		actra.regFormBind(formIndex, formMod, formid)
		}
		
		public function entrify(entry, formData){
			this[entry] = formData.suite[0][entry]
		}
		
		
		public function makeSound(soundType, soundZeal){
			var sound = this[soundType+soundZeal] 
			actra.body.skySend(formIndex, sound)	
		}
}

