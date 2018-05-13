import skse;

class core.actor.voice
{
	
var o
var actra

var lipShape
var voiceSuite

var vo
var ivo
var ivos
var wvo


var speaking = false

		public function voice(ocore, act){
		o = ocore
		actra = act

		vo = new core.actor.voicepack.sound(o, actra)
		ivo = new core.actor.voicepack.primal(o, actra)
		ivos = new core.actor.voicepack.primalsuck(o, actra)
		wvo = new core.actor.voicepack.sorcery(o, actra)
		
		lipShape = new Object
		
		}
		
		
		function say(formSuite, sound, zeal, notSpoken){
			this[formSuite].makeSound(sound, zeal, notSpoken)
		}
		 
		
		function skySend(formListIndex, formIndex, formLength, notSpoken){
			if(notSpoken){
				skse.SendModEvent("0SSO"+actra.id+"_Sound", String(formIndex), Number(formListIndex))
			}else{
				if(!speaking){
					if(formLength){
						speaking = true
						var time = new Time({fn:stopSpeaking, scope:this}, formLength*1000)
					}
					trace("Sent to Skyrim Actor:"+actra.id+" FormListIndex: "+formListIndex+" FormIndex: "+formIndex) 
					skse.SendModEvent("0SSO"+actra.id+"_Sound", String(formIndex), Number(formListIndex))
				}
			}
		}
		
		function stopSpeaking(){
			speaking = false
		}

}


