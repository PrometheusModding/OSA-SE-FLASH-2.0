
class core.lib.targeting
{

var o

var male
var female
var all

var targPost

		public function targeting(core){
		o = core

		}
		
		function addTarg(actraID){
			
			o.log.addLog("trg", "INCOMING TARGET: "+actraID)	
			if(!targPost[actraID]){		
			var actra = o.actro.get(actraID)
				if(actra){
				targPost[actraID] = new Object
				targPost[actraID] = 1
					
					o.log.addLog("trg", actraID+" has been added to the "+actra.genderF.toLowerCase()+" list.")
					o.log.addLog("trg", "ID: "+actra.id)
					
					actra.targIndex = all.push(actra)-1
					actra.targGenIndex = this[actra.genderF.toLowerCase()].push(actra)-1
				}else{
				o.log.addLog("trg", "Entry was unable to be made in actro.")
				}
			}else{
			o.log.addLog("trg", actraID+" is already in the target list.")	
			}
		
		}
		
		
		function resetTarg(){
			male = []
			female = []
			all = []
			targPost = new Object
			o.log.addLog("trg", "Targeting log reset...")	
			
			if(!o.actro.get("00000007")){
				o.skyString("0SA_Targeting", "Player")
			}else{
				addTarg("00000007")
			}
		}

}