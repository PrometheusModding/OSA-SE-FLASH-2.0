import skse;

class core.actor.bospack.intimate
{
	
var o
var actra


var formSuite
var formMod
var formid
var formClass

var formIndex = 50



var pussydry0
var pussydry1
var pussydry2

var pussymoist0
var pussymoist1
var pussymoist2

var pussywet0
var pussywet1
var pussywet2

var assimpactdry0
var assimpactdry1
var assimpactdry2

var assimpactmoist0
var assimpactmoist1
var assimpactmoist2

var assimpactwet0
var assimpactwet1
var assimpactwet2

var bodyimpactdry0
var bodyimpactdry1
var bodyimpactdry2

var bodyimpactmoist0
var bodyimpactmoist1
var bodyimpactmoist2

var bodyimpactwet0
var bodyimpactwet1
var bodyimpactwet2

var softimpactdry0
var softimpactdry1
var softimpactdry2

var softimpactmoist0
var softimpactmoist1
var softimpactmoist2

var softimpactwet0
var softimpactwet1
var softimpactwet2



var impact


		public function intimate(core, act){
		o = core
		actra = act		
		}
		
		public function expandFormData(){
			formMod = formSuite.mod
			formid = String(Number("0x"+formSuite.formid))
			formClass = formSuite.id

			register()
			
			entrify("pussydry0", formSuite)
			entrify("pussydry1", formSuite)
			entrify("pussydry2", formSuite)

			entrify("pussymoist0", formSuite)
			entrify("pussymoist1", formSuite)
			entrify("pussymoist2", formSuite)

			entrify("pussywet0", formSuite)
			entrify("pussywet1", formSuite)
			entrify("pussywet2", formSuite)
			
			entrify("assimpactdry0", formSuite)
			entrify("assimpactdry1", formSuite)
			entrify("assimpactdry2", formSuite)

			entrify("assimpactmoist0", formSuite)
			entrify("assimpactmoist1", formSuite)
			entrify("assimpactmoist2", formSuite)

			entrify("assimpactwet0", formSuite)
			entrify("assimpactwet1", formSuite)
			entrify("assimpactwet2", formSuite)
			
			entrify("bodyimpactdry0", formSuite)
			entrify("bodyimpactdry1", formSuite)
			entrify("bodyimpactdry2", formSuite)

			entrify("bodyimpactmoist0", formSuite)
			entrify("bodyimpactmoist1", formSuite)
			entrify("bodyimpactmoist2", formSuite)

			entrify("bodyimpactwet0", formSuite)
			entrify("bodyimpactwet1", formSuite)
			entrify("bodyimpactwet2", formSuite)
			
			entrify("softimpactdry0", formSuite)
			entrify("softimpactdry1", formSuite)
			entrify("softimpactdry2", formSuite)

			entrify("softimpactmoist0", formSuite)
			entrify("softimpactmoist1", formSuite)
			entrify("softimpactmoist2", formSuite)

			entrify("softimpactwet0", formSuite)
			entrify("softimpactwet1", formSuite)
			entrify("softimpactwet2", formSuite)
						
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

