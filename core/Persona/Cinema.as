import skse; 

class Cinema
{
	
var o

var drama
var magic
var shader
var spell
		public function Cinema(core, act, evntData){
		o = core	
					drama={
							i:0,
							Transition_EnterTitanMaj:0,						  
						  	Drum_Bg_Big_10s:1,
							Drum_DeepGong:2,
							Drum_MysticGong:3
						  
						  },
					magic={
							i:1,
							Amb_DeepPowerSwell:0						  
						  
						  }
					
					shader={
							Signet_Holy:0,
							Aura_Holy:1
							
					}
					  
					spell={
							Lightning_Vio:1,
							LightningSpread_Holy:2,
							TimeSpaceI:3,
							TimeSpaceII:4,
							PulseSpike_Vio:5
							
					}
		
		
		}				
		
		
		public function convert(section, type){
			return this[section][type]
		}
		
		public function playAudioO(stageID, section, sound){
			trace("INPUT SOUND SENT "+this[section][sound])
			skse.SendModEvent("0SAO"+stageID+"_OCinemaAudio", String(this[section].i), Number(this[section][sound]))
		}
}