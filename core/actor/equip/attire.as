

class core.actor.equip.attire{


var o
var actra

var item
var esg
var autoInt
var autoIntReady

var cuirassMulti


		public function attire(ocore, act){
			o = ocore
			actra = act
			item = []
			esg = new Object
			autoIntReady = false
			cuirassMulti = 0
			for (var i=0; i < 32; i++){
				item[i] = new core.actor.equip.item(i)		
			}
			
			
		}
		
		
		function hasFauxESG(esgID){return autoInt[esgID].worn}
		
		function hasEsg(esgID){
			var slots = o.cfg.esg.getSlots(esgID, actra.gender)
			var isWorn = false
				for (var i=0; i < slots.length; i++){
					var slotNum = Number(String(slots[i]))
					if(item[slotNum].worn||hasFauxESG(esgID)){
						isWorn = true} 
				}
			return isWorn
		}
		
		function sortEsg(){
		esg = new Object
		esg.list = []
		esg.item = []

				for (var i=0; i < actra.equip.attire.item.length; i++){
						if(actra.equip.attire.item[i].exists){
							  if(o.cfg.esg.getEsg(i, actra.gender)){
									if(!esg[o.cfg.esg.getEsg(i, actra.gender)]){
										
									
									esg[o.cfg.esg.getEsg(i, actra.gender)] = new Object
									esg[o.cfg.esg.getEsg(i, actra.gender)]
									
									var L = esg.list.push(o.cfg.esg.getEsg(i, actra.gender))-1
									esg[o.cfg.esg.getEsg(i, actra.gender)] = L
									
									esg.item[L] = [] 
									esg.item[L].push(actra.equip.attire.item[i])
									
		
									}else{
									esg.item[esg[o.cfg.esg.getEsg(i, actra.gender)]].push(actra.equip.attire.item[i])
									}			
									actra.equip.attire.item[i].esg = o.cfg.esg.getEsg(i, actra.gender)
							  }
						}					
				}
				
		}

		
		function preUndressESG(esgType){
			if(esgType != "weapon"){
				for (var i=0; i < esg.item[esg[esgType]].length; i++){
						esg.item[esg[esgType]][i].worn = false
				}
			}
			else{actra.equip.armament.preRemoveWeapon()}
		}
		
		public function undressEsg(esgType){
			
			if(esgType != "weapon"){
				for (var i=0; i < esg.item[esg[esgType]].length; i++){
						actra.equip.unequipSlot(esg.item[esg[esgType]][i].slot, i, esgType)
						esg.item[esg[esgType]][i].worn = false
				}
			}
			else{actra.equip.armament.removeArmament(0);actra.equip.armament.removeArmament(1)}
		}
		
		public function dressEsg(esgType){
			if(esgType != "weapon"){
				
				for (var i=0; i < esg.item[esg[esgType]].length; i++){
					actra.equip.equipSlotByItem(esg.item[esg[esgType]][i])
					esg.item[esg[esgType]][i].worn = true
				}
			}else{
				for (var i=0; i < actra.equip.armament.hand.length; i++){
						actra.equip.equipWeapon(actra.equip.armament.hand[i].id, i)
						actra.equip.armament.hand[i].worn = true
				}
			}
		}
		
		
		public function dressSlot(slot){	
			  actra.equip.equipSlotByItem(item[slot])
		}
		
		
		public function redress(alternate){
			
			
			if(alternate == 1){
				for (var i=0; i < 32; i++){
					if (item[i].worn == false && item[i].exists){
					actra.equip.equipSlotInspect(item[i].id)
					item[i].worn = true
					}
				}	
			}else{
				for (var i=0; i < 32; i++){
					if (item[i].worn == false && item[i].exists){
					actra.equip.equipSlotByItem(item[i])
					item[i].worn = true
					}
				}			
			}
			dressEsg("weapon")	
		}
		
		public function undress(alternate){
			
					var allowed = []					
					for (var i=0; i < 32; i++){
						if(!o.cfg.esg.isEsgExclude(i, actra.gender)){allowed.push(i)}						
					}
			
			if(alternate == 1){
				for (var i=0; i < allowed.length; i++){
					if (item[allowed[i]].worn && item[allowed[i]].exists){
					actra.equip.unequipSlotInspect(allowed[i])
					item[allowed[i]].worn = false
					}
				}	
			}else{
				for (var i=0; i < allowed.length; i++){
					if (item[allowed[i]].worn && item[allowed[i]].exists){
					actra.equip.unequipSlot(allowed[i])
					item[allowed[i]].worn = false
					}
				}			
			}
			undressEsg("weapon")			
		}
		

		
		
		public function setSkyAttire(attireSet){
			trace("SKY ATTIRE SET")
			for (var i=0; i < 32; i++){
				if(attireSet[i] != 0){	
				item[i].id = attireSet[i]
				item[i].name = attireSet[i+40]
				item[i].worn = true
				item[i].exists = true

				}else{
				item[i].id = 0
				item[i].name = ""
				item[i].worn = false
				item[i].exists = false
				}
			}
			esg = new Object
			if(o.cfg.config.logging){actra.log.addLog("esg", "Equipment list received...")}
			
			sortEsg()		
			autoIntReady = true
			processAutoInt()
		}


		function processAutoInt(){
			if(autoIntReady&&actra.forms.checked&&!autoInt.activated)
				autoInt = new core.actor.equip.autoIntimates(o, actra, item)
		}
		
		public function setSkyWeapon(attireSet){
			trace("SKY ATTIRE SET")
			for (var i=0; i < 32; i++){
				if(attireSet[i] != 0){	
				item[i].id = attireSet[i]
				item[i].name = attireSet[i+40]
				item[i].worn = true
				item[i].exists = true

				}else{
				item[i].id = 0
				item[i].name = ""
				item[i].worn = false
				item[i].exists = false

				}
			}			
		}
}