import skse; 

class CinemaFX
{


var fxu
var cfx
		
		public function CinemaFX(u, command){
			fxu = u
			cfx = command
			trace("			!!!CINEMA FX IS HERE")
			if (cfx.ti){var time = new Time({fn:this[cfx.cmd], scope:this}, (cfx.ti)*1000)}else{this[cfx.cmd]()} 
		}
		
		function AUDIO(){
			if(!cfx.playereq){				
				
				if(cfx.lib == "OCinema"){
				trace("AUDIO HAS HAPPANED"+fxu.o.lib)
				fxu.o.cin.playAudioO(fxu.dia.id, cfx.section, cfx.sound)
				}
			}
		}
		
		function RUMBLE(){
			if(!cfx.playereq){				
				
				skse.SendModEvent("0SAO"+fxu.dia.id+"_Rumble", String(cfx.am+","+cfx.dur), Number(cfx.range))
				
			}
		}
		



}


