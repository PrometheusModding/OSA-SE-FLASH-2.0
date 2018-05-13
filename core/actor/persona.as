import skse;

class core.actor.persona
{
	
var o
var actra

var intimate
var combat


		public function persona(ocore, act){
		o = ocore
		actra = act		
		intimate = new core.actor.intimate(o, act)
		combat = new core.actor.combat(o, act)
		}
		
		
		
		public function storeData(personaData){
			if(personaData){
				if(o.cfg.config.logging){actra.log.addLog("prs", "Actor has a persona.xml...")}
			}else{
				if(o.cfg.config.logging){actra.log.addLog("prs", "Actor does not have a persona.xml...")}
			}
			
			var personaBuilder = new core.actor.util.personabuilder(o, actra, personaData)
			personaBuilder.createIntimate()
			core.actor.util.personabuilder.createLipShape(o, actra)
			personaBuilder.createFormSuite()			
		}

}


