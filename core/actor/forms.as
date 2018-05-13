import skse;

class core.actor.forms
{
	
var o
var actra

var has
var checked
var formsData


var hasIntimatesL
var hasIntimatesH
var hasIntimatesSet

var hasMGen


		public function forms(om, act){
		o = om
		actra = act		
		has = false
		checked = false
		hasIntimatesL = false
		hasIntimatesH = false
		hasIntimatesSet = false
		hasMGen = false
		}
		
		
		
		public function storeData(FormsData){			
		if(o.cfg.config.logging){actra.log.addLog("gen", "Checked for Forms.xml...")}
			if(FormsData&&!has){
				has = true
				formsData = FormsData
				if(o.cfg.config.logging){actra.log.addLog("gen", "forms.xml FOUND!")}
			}else{
				if(o.cfg.config.logging){actra.log.addLog("gen", "forms.xml not found...")}
			}
			
			checkData("IntimatesL")
			checkData("IntimatesH")
			checkData("IntimatesSet")
			checkData("MGen")
			if(o.cfg.config.logging){actra.log.addLog("esg", "forms.xml ||| IntimatesLow: "+String(hasIntimatesL)+" | IntimatesHigh: "+String(hasIntimatesH)+" | IntimatesSet: "+String(hasIntimatesSet)+" | MGen: "+String(hasMGen))}
			checked = true
			actra.equip.attire.autoInt.processAutoInt()
		}
		
		function checkData(dataType){
			if(formsData.AutoIntimates[0][dataType]){
			  this["has"+dataType] = true
			}
			
		}
				
		


}


