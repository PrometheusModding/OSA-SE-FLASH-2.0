import skse;


class core.actor.equipment{

var o
var actra

var attire
var armament


		public function equipment(ocore, act){
		   o = ocore
		   actra = act
		   attire = new core.actor.equip.attire(o, actra)
		   armament = new core.actor.equip.armament(o, actra)
		}
	
	
		public function getEsgName(esgType){
			return o.cfg.esg.getEsgName(esgType, actra.gender)
		}
		
		
		function hasESG(esgType):Boolean{
			if(attire.esg[esgType]){return true}
			else{return false}
		}
		
		function hasWeapon(){
				var wepExists = false
				for (var i=0; i < armament.hand.length; i++){
					
					if(armament.hand[i].exists){wepExists = true}
				}
				return wepExists
		}
		
		function isESGOff(esgType):Boolean{
			if(attire.esg[esgType]){
				var isRemoved = false
				var list = attire.esg.item[attire.esg[esgType]]
				
				for (var i=0; i < list.length; i++){					
					if(!attire.esg.item[attire.esg[esgType]][i].worn){isRemoved = true}
				}
				
				return isRemoved
			}else{return false}
		}
		
		public function requestAttire(){
		if(o.cfg.config.logging){actra.log.addLog("esg", "Requested list of actor's equipment...")}
		skse.SendModEvent("0SAA"+actra.id+"_RequestEQSuite", String(""))
		}
		
		function unequipSlot(slot){
				if(o.cfg.esg.getEsg(slot, actra.gender)=="cuirass"){
					if(!attire.autoInt.onCuirassOff(slot)){
						
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) AutoIntimates was not used upon removing "+actra.name+"'s Cuirass.")}
						
						skse.SendModEvent("0SAA"+actra.id+"_EqOFF", String(slot+30))
					}
				}else if(o.cfg.esg.getEsg(slot, actra.gender)=="pants"){
					if(!attire.autoInt.onPantsOff(slot)){
						
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) AutoIntimates was not used upon removing "+actra.name+"'s Pants.")}
						
						skse.SendModEvent("0SAA"+actra.id+"_EqOFF", String(slot+30))
					}
				}else{
				skse.SendModEvent("0SAA"+actra.id+"_EqOFF", String(slot+30))
				}
		}
		
		function unequipSlotInspect(slot){
			o.skyAll("0SC_MyUnEquip", String(slot+30), Number(0), String(actra.trueID))
		}
		
		function unequipWeapon(hand){
			skse.SendModEvent("0SAA"+actra.id+"_WepOFF", String(hand))
		}
		
		function equipWeapon(weapon, hand){
			skse.SendModEvent("0SAA"+actra.id+"_WepON", String(weapon), Number(hand))
		}
		
		function equipSlot(formId){
				skse.SendModEvent("0SAA"+actra.id+"_EqOn", String(formId))
		}
		
		function equipSlotByItem(item){
				if(item.esg=="cuirass"){
					if(!attire.autoInt.onCuirassOn(item.id)){					
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) AutoIntimates were not impacted when "+actra.name+" put on a Cuirass.")}
						skse.SendModEvent("0SAA"+actra.id+"_EqOn", String(item.id))
						}
					}else if(item.esg=="pants"){
						if(!attire.autoInt.onPantsOn(item.id)){					
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) AutoIntimates were not impacted when "+actra.name+" put on Pants.")}
						skse.SendModEvent("0SAA"+actra.id+"_EqOn", String(item.id))
						}
				}else{
				skse.SendModEvent("0SAA"+actra.id+"_EqOn", String(item.id))
				}
		}
		
		function equipSlotInspect(formID, slot){
			o.skyAll("0SC_MyEquipEx", String(formID+","+slot), Number(0), String(actra.trueID))
		}

}