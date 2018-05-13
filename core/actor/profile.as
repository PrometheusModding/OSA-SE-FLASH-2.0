import skse;

class core.actor.profile
{
	
var o
var actra

var has

var profileData


var exRace
var exRaceType
var exReady

var autoNameAttempted

		public function profile(om, act){
		o = om
		actra = act		
		has = false
		autoNameAttempted = false
		
		exReady = {gfx:false, names:false, equip:false}
		exRace = undefined
		exRaceType = {gfx:"HUMAN", gfxSub:[], names:"HUMAN", namesSub:[], equip:"HUMAN", equipSub:[]}
		}
		
		
		
		public function storeData(ProfileData){			
			if(ProfileData){
				if(o.cfg.config.logging){actra.log.addLog("pro", "Actor has a profile.xml...")}
				has = true				
				profileData = ProfileData
				expandProfile()
			}else{
				if(o.cfg.config.logging){actra.log.addLog("pro", "Actor does not have a profile.xml...")}
			}
			
			if(o.cfg.config.logging){actra.log.addLog("pro", "Profile load complete...")}
			
		}
		
		
		function expandProfile(){
			if(profileData.useProName){
			actra.name = profileData.displayName
				if(o.cfg.config.logging){actra.log.addLog("pro", "useProName enabled, new name:"+actra.name)}
			}
			
			if(profileData.useProRace){
			actra.race = profileData.displayRace
				if(o.cfg.config.logging){actra.log.addLog("pro", "useProRace enabled, new race name:"+actra.race)}
			}

			
			
		}

}


