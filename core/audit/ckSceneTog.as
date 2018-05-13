
class core.audit.ckSceneTog
{


		
		public static function analyzeToggle(tog, curTog){
		return processTog(tog, curTog)
		}
		
		public static function processTog(tog, curTog){
			if(curTog[tog.arr]){
				if(!curTog[tog.arr].cmd){
					if(core.audit.ckSceneTog[curTog[tog.arr].id](tog, curTog[tog.arr])==true)
					{
						var arrSelect = tog.arr
						tog.arr=0
						tog.count+=1
						
						return processTog(tog, curTog[arrSelect]["tog"+tog.count])
						
					}else{
						tog.arr+=1
						return processTog(tog, curTog)
					}
				}else{
					return core.audit.ckSceneTog["cmd_"+curTog[tog.arr].cmd](tog, curTog[tog.arr])
					
				}
			}
		}
		
		public static function cmd_DEST(tog, curTog){
			return curTog			
		}
		
		public static function cmd_END(tog, curTog){
			return curTog			
		}
		
		public static function cmd_DESTLIST(tog, curTog){
			tog.dia.menuSelection(core.util.func.TIERrandotier(curTog.dest).id)
			return curTog			
		}
		
		
		
		
		public static function genderReq(tog, curTog){
			if(tog.actra[curTog.a].gender==curTog.req){
			return true
			}else{
			return false
			}
		}
		
		public static function wornEsgReq(tog, curTog){
			var esgStatus
				if(curTog.esg != "weapon"){
					if(tog.actra[curTog.a].equip.hasESG(curTog.esg))
					{
						if(tog.actra[curTog.a].equip.isESGOff(curTog.esg)){esgStatus = "OFF"}
						else{esgStatus = "ON"}
					}else{esgStatus = "NOEQ"}
				}else if(curTog.esg == "weapon"){
					if(tog.actra[curTog.a].equip.hasWeapon())
					{
						if(tog.actra[curTog.a].equip.armament.wornWeapon()){esgStatus = "OFF"}
						else{esgStatus = "ON"}
					}else{esgStatus = "NOEQ"}
				}
			if(esgStatus==curTog.req){return true}
			else{return false}
		}
		
		public static function tempStatReq(tog, curTog){
			if(tog.actra[curTog.a].temp.stat[curTog.block][curTog.vari] == curTog.req){return true}
			else{return false}
		}
		
		
		public static function flagMinMax(tog, curTog){
			var angle = Number(tog.dia.flags[curTog.flag])	
			if(angle < 0){ 
    		angle = Number(180) + Number(180+angle)
			}
			if(angle > curTog.min && angle < curTog.max){return true}
			else{return false}
		}
		
		
}	


