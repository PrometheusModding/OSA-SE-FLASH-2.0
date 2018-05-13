import skse;

class core.actor.util.personabuilder
{
	
var o
var actra
var dat

		public function personabuilder(core, act, personaData){
		o = core
		actra = act
		dat = personaData		
		}
		
		
		function createIntimate(){
		
		if(o.cfg.config.logging){actra.log.addLog("prs", "Creating persona...")}
		
		var intimateData = dat.intimate[0]	
		
		if(o.cfg.config.logging){actra.log.addLog("prs", "\n ---------- INTIMACY  ----------\n creating...")}
		
		if(o.cfg.config.logging){actra.log.addLog("prs", "\n ---------- MOTIF ----------")}
		
		var used=false
		
		if(intimateData.motifclass[0].id){actra.persona.intimate.motif = intimateData.motifclass[0].id
		var used=true
		if(o.cfg.config.logging){actra.log.addLog("prs", "motif : "+actra.persona.intimate.motif+ " | Used persona.xml: "+used)}
		}
		else{actra.persona.intimate.motif = o.lib.codex.chooseMotifClass(actra.genderL)
		if(o.cfg.config.logging){actra.log.addLog("prs", "motif : "+actra.persona.intimate.motif+ " | Used persona.xml: "+used)}
		}
		
		if(o.cfg.config.logging){actra.log.addLog("prs", "\n ---------- REACTION ----------")}
		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "spank", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "emb", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "kiss", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "gentle", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "phys", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "rough", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "abuse", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "hair", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "expo", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "clothes", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "inpus", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "inanal", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "inmo", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "pnpus", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "pnanal", "chooseReactClass")		
		HasOrRandomClass(actra, "intimate", "react", "reaction", "pnmo", "chooseReactClass")			
		
		if(o.cfg.config.logging){actra.log.addLog("prs", "\n ---------- MIEN ----------")}
		
		HasOrRandomClass(actra, "intimate", "mien", "mien", "expression", "chooseMienClass")	
		HasOrRandomClass(actra, "intimate", "mien", "mien", "voice", "chooseMienClass")			
		
		if(o.cfg.config.logging){actra.log.addLog("prs", "\n ---------- EMO ----------")}
		
		HasOrRandomClass(actra, "intimate", "mien", "emo", "expression", "chooseEmoClass")		
		HasOrRandomClass(actra, "intimate", "mien", "emo", "voice", "chooseEmoClass")
		
		}
		

		function HasOrRandomClass(actra, category, classType, classTypeS2, subClass, func){			
		
		var used = false
		if(dat.intimate[0][classType+"class"][0][subClass]){
			actra.persona[category][classTypeS2][subClass] = dat.intimate[0][classType+"class"][0][subClass]		
			used = true
		}else{			
			actra.persona[category][classTypeS2][subClass] = o.lib.codex[func](actra.genderL, subClass)
		}
		
		if(o.cfg.config.logging){actra.log.addLog("prs", subClass+": "+actra.persona[category][classTypeS2][subClass]+ " | Used persona.xml: "+used)}
		
		}
		
		
		public static function createLipShape(o, actra){
		
		actra.voice.lipShape =  o.lib.codex.chooseIdentraGen("LipShape", actra.genderL)
		if(o.cfg.config.logging){actra.log.addLog("prs", "\n Voice.LipShape class: "+actra.voice.lipShape.id)}
		}
		
		function createFormSuite(){
		var formSuite = dat.formclass[0]	
		actra.formBound = true
		
		if(o.cfg.config.logging){actra.log.addLog("prs", "Selecting Voice Suites")}
		
		actra.voice.voiceSuite =  o.lib.codex.chooseIdentraGen("VoiceSuite", actra.genderL)
		
		if(o.cfg.config.logging){actra.log.addLog("prs", "Assigned VoiceSuite: "+actra.voice.voiceSuite.id)}
		
		checkFormVoUnit(formSuite, actra.voice.vo, "vo")	
		
		checkFormVoUnit(formSuite, actra.voice.ivo, "ivo")	
		
		checkFormVoUnit(formSuite, actra.voice.ivos, "ivos")
		
		checkFormVoUnit(formSuite, actra.voice.wvo, "wvo")
		
		checkFormUnit(formSuite, actra.body.ibo, "ibo")
		
		checkFormUnit(formSuite, actra.body.spank, "spank")
		
		}
		
		
		function checkFormVoUnit(formSuite, path, designation){
			
		if(formSuite[designation]){
			path.formSuite = o.lib.codex.getForm(designation, formSuite[designation])
			if(o.cfg.config.logging){actra.log.addLog("prs", "From Persona.xml: Sound Suite | "+designation.toUpperCase()+": "+path.formSuite.id)}
		}else{
			if(actra.voice.voiceSuite[designation] == "!"){
				path.formSuite = o.lib.codex.randomForm(designation, actra.genderL)
				if(o.cfg.config.logging){actra.log.addLog("prs", "Value is '!' for Voice Suite | "+designation.toUpperCase()+": "+path.formSuite.id)}
			}else{path.formSuite = o.lib.codex.getForm(designation, actra.voice.voiceSuite[designation])
				if(o.cfg.config.logging){actra.log.addLog("prs", "Using Voice Suite for | "+designation.tsoUpperCase()+": "+path.formSuite.id)}
			}
		}
			path.expandFormData()
		}
		
		function checkFormUnit(formSuite, path, designation){
			
		if(formSuite[designation]){
			path.formSuite = o.lib.codex.getForm(designation, formSuite[designation])			
		}else{
				path.formSuite = o.lib.codex.randomForm(designation, actra.genderL)

		}
			path.expandFormData()
		}
}


