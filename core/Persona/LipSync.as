

class LipSync{



var actra
var sound
var formIndex

		public function LipSync(act, snd, fo){
		actra = act
		sound = snd
		formIndex = fo
		this[sound.lsync]()
		}
		
		public function shape(){
			
			
			var selectShape = sound.lshape.substr(core.util.func.RNG(0, (sound.lshape.length-2)/2)*2, 2)
			var chooseOne = actra.voice.lipShape[selectShape.substr(0,1)][core.util.func.RNG(0, actra.voice.lipShape[selectShape.substr(0,1)].length-1)]
			
			var degree = selectShape.substr(1,1)
			
			var outcome = chooseOne.ph[core.util.func.RNG(0, chooseOne.ph.length-1)]["sy"+degree]
			
			for (var i=0; i < chooseOne.ph.length; i++){
				var amount = core.util.func.PAN(chooseOne.ph[i]["am"+degree], chooseOne.ph[i]["pan"+degree]) 
				actra.expression.adjust("ph", chooseOne.ph[i]["sy"+degree], amount)
				
				var recoverStyle = []
				recoverStyle[0] = chooseOne.ph[i]["sy"+degree]
				var timeRecover = new OTime({fn:recoverShape, scope:this}, chooseOne.ph[i]["rev"+degree]*1000, recoverStyle)
			}
			var timeSound = new Time({fn:sendSound, scope:this}, chooseOne.sdelay*1000)
		}

		private function recoverShape(style){
			actra.expression.adjust("ph", style, 0)
		}
		
		private function sendSound(){			
			actra.voice.skySend(formIndex, sound.indx, sound.ti)	
		}
		

		

		
		
		
		
}