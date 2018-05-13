import mx.utils.Delegate;

class core.lib.codex{


var o

var omnisius
var form
var ref
var identra

var formM
var formF
	
var MClas
var FClas

var MLipShape
var FLipShape
var RLipShape

var MVoiceSuite
var FVoiceSuite
var RVoiceSuite

var scanOIDEN
var scanOFORM

		public function codex(core){
		o = core
		omnisius = new Object		
		scanOIDEN = []
		scanOFORM = []
		form = []
		ref = new Object
		
		identra = []		
		formM = new Object
		formF = new Object
		
		RLipShape = new Object
		MLipShape = []
		FLipShape = []
		
		RVoiceSuite = new Object
		MVoiceSuite = []
		FVoiceSuite = []
		
			MClas = {motif:[], 
			react:{spank:[], kiss:[], emb:[], gentle:[], phys:[], rough:[], abuse:[],
			hair:[], expo:[], clothes:[], inpus:[], inanal:[], inmo:[], pnpus:[], pnanal:[], pnmo:[]
			}, 
			mien:{expression:[], voice:[]}, emo:{expression:[], voice:[]}}
			FClas = {motif:[], 
			react:{spank:[], kiss:[], emb:[], gentle:[], phys:[], rough:[], abuse:[],
			hair:[], expo:[], clothes:[], inpus:[], inanal:[], inmo:[], pnpus:[], pnanal:[], pnmo:[]
			}, mien:{expression:[], voice:[]}, emo:{expression:[], voice:[]}}			
			
		}
		



		function scanIdentity(){
			scanOIDEN = arguments
			inIdentra()
		}
		
		function scanForm(){
			scanOFORM = arguments
			inFormius()
		}
		
		function chooseMienClass(gender, section){
			var R = core.util.func.RNG(0, this[gender+"Clas"].mien[section].length-1)
			return this[gender+"Clas"].mien[section][R]
		}
		
		function chooseEmoClass(gender, section){
			var R = core.util.func.RNG(0, this[gender+"Clas"].emo[section].length-1)
			return this[gender+"Clas"].emo[section][R]
		}
		
		function chooseReactClass(gender, section){
			var R = core.util.func.RNG(0, this[gender+"Clas"].react[section].length-1)
			return this[gender+"Clas"].react[section][R]
		}
		
		function chooseMotifClass(gender){
				var R = core.util.func.RNG(0, this[gender+"Clas"].motif.length-1)
			return this[gender+"Clas"].motif[R]
		}
		
		function chooseIdentraGen(IdentraType, gender){
				var R = core.util.func.RNG(0, this[gender+IdentraType].length-1)
			return this[gender+IdentraType][R]
		}
		
		
		
		public function getForm(type, oclass){
			return ref[type][oclass]
		}
		
		public function randomForm(type, gender){
			var randomPick = core.util.func.RNG(0, this["form"+gender][type].length-1)
			return this["form"+gender][type][randomPick]
		}
		
		
		
		
		
		public function inIdentra(){
			var xmlIdentra = new Load
			xmlIdentra.callBack = {fn:outIdentra, scope:this}
			xmlIdentra.dir = o.omfixDir+"OSA/Persona/base/default/oIdentity.oiden"
			o.log.addLog("boot", "loading Identra: "+o.omfixDir+"OSA/Persona/base/default/oIdentity.oiden")
			xmlIdentra.getDoc()				
		}
		
		public function inIdentraCustom(){
			var xmlIdentra = new Load
			xmlIdentra.callBack = {fn:outIdentra, scope:this}
			xmlIdentra.dir = o.omfixDir+"OSA/Persona/base/identity/"+scanOIDEN[0]
			o.log.addLog("boot", "loading Custom Identra: "+o.omfixDir+"OSA/Persona/base/identity/"+scanOIDEN[0])
			scanOIDEN.shift()
			xmlIdentra.getDoc()				
		}
		
		public function outIdentra(xml){			
			var identraData = o.lib.makeEntry(xml)
			if(xml){
			o.log.addLog("boot", "Identra Loaded")
			}else{
			o.log.addLog("boot", "WARNING: Identra not Loaded")
			o.log.addLog("war", "WARNING: Identra not Loaded")
			}
			for (var i=0; i < identraData.identityBase.length; i++){
			identra.push(identraData.identityBase[i])
			}
			if(scanOIDEN.length > 0){inIdentraCustom()}
			else{IdentraBuilder.primary(o, identra)}
		}

		public function inFormius(){
			var xmlFormius = new Load
			xmlFormius.callBack = {fn:outFormius, scope:this}
			xmlFormius.dir = o.omfixDir+"OSA/Persona/base/default/oForm.oform"
			o.log.addLog("boot", "loading Formius: "+o.omfixDir+"OSA/Persona/base/default/oForm.oform")
			xmlFormius.getDoc()				
		}
		
		public function inFormiusCustom(){
			var xmlFormius = new Load
			xmlFormius.callBack = {fn:outFormius, scope:this}
			xmlFormius.dir = o.omfixDir+"OSA/Persona/base/form/"+scanOFORM[0]
			o.log.addLog("boot", "loading Custom Formius: "+o.omfixDir+"OSA/Persona/base/form/"+scanOFORM[0])
			scanOFORM.shift()
			xmlFormius.getDoc()				
		}

		
		function outFormius(xml){
			var formiusData = o.lib.makeEntry(xml)
			if(xml){
			o.log.addLog("boot", "Formius Loaded")
			}else{
			o.log.addLog("boot", "WARNING: Formius not Loaded")
			o.log.addLog("war", "WARNING: Formius not Loaded")
			}
			for (var i=0; i < formiusData.form.length; i++){
				form.push(formiusData.form[i])
			}
			if(scanOFORM.length > 0){inFormiusCustom()
			trace("Loading XTRA FORM")
			}
			else{indexForms()}
		}
		
		function indexForms(){
			trace("INDEXING")
			for (var i=0; i < form.length; i++){
				formIndexer(form[i])
				
			}			
			
			//trace(ref.ivo._OGal.id)
			//trace("GENLIB"+formF.ivo[0].id)
			//trace("GENLIB"+formM.ivo[0].id)
			//trace("GENLIB"+formF.spank[0].id)
		}
		
		
		function formIndexer(formEntry){
				var type = (formEntry.type).toLowerCase()
				var gender = (formEntry.gender).toUpperCase()
				if (gender != "U"){
				
				var genLib = this["form"+gender]
				 
				if(!genLib[type]){genLib[type] = []}
				genLib[type].push(formEntry)
				
				}else{
					
				
				if(!formM[type]){formM[type] = []}
				formM[type].push(formEntry)
				if(!formF[type]){formF[type] = []}
				formF[type].push(formEntry)
				
				}
				 
				 if(!ref[type]){ ref[type] = new Object }
				 if(ref[type][formEntry.id]){
					 trace("Error: Form ID already used")
				 }
				 else{ 
				 ref[type][formEntry.id] = new Object
				 ref[type][formEntry.id] = formEntry
				 }				 
				 
		}

		
}