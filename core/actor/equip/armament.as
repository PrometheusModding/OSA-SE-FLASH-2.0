

class core.actor.equip.armament{


var o
var actra
var hand

		public function armament(ocore, act){
			o = ocore
			actra = act
			hand = []
			
			hand[0] = new core.actor.equip.weapon(0)
			hand[1] = new core.actor.equip.weapon(1)
			
			
		}

		function preRemoveWeapon(){
				for (var i=0; i < hand.length; i++){
						hand[i].worn = false
				}
		}		
		
		
		function wornWeapon(){
				var isWorn = false
				for (var i=0; i < hand.length; i++){
					
					if(hand[i].worn){isWorn = true}
				}
				return isWorn
		}
		
		function removeArmament(equipHand){
			actra.equip.unequipWeapon(equipHand)
			hand[equipHand].worn = false
		}
		
		public function setSkyWeapon(weaponData){
			trace("SKY WEAPON SET")

				if(weaponData[2] != 0){	
				var curWeapon = hand[weaponData[1]]
				curWeapon.id = weaponData[2]
				curWeapon.name = weaponData[3]
				curWeapon.worn = true
				curWeapon.exists = true
				curWeapon.weaponType = weaponData[4]
				}
				
				
			
		}
}