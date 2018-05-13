import skse;

class core.actor.expression
{
	
var o
var actra

var lastMouthMovement

var ex


		public function expression(core, act){
		o = core
		actra = act		
		ex = {sy:0, am:0}
		}
		
		
		
		
		public function eyes(up, down, left, right){
		trace(up+down+left+right)
		sendEyes(11, up)
		sendEyes(8, down)
		sendEyes(9, left)
		sendEyes(10, right)
		}
		
		public function focusOn(eyeData, focusPoint){
			var R = core.util.func.RNG(0, eyeData[focusPoint].length-1) 		
			eyesVH(8, 11, eyeData[focusPoint][R].v, eyeData[focusPoint][R].vpan)
			eyesVH(10, 9, eyeData[focusPoint][R].h, eyeData[focusPoint][R].hpan)
		}
		
		public function eyesVH(low, high, vh, pan){
			if(vh < 0){
			sendEyes(low, panAmount(vh*-1, pan))
			sendEyes(high, 0)
			}else{
			sendEyes(high, panAmount(vh, pan))
			sendEyes(low, 0)
			}
		}
		
		public function panAmount(amount, pan){
			if (pan){
				return Number(amount)+Number(core.util.func.RNG(-pan, pan))
			}else{return amount}			
		}
		
		private function sendEyes(direct, amount){
		if (amount > 100){amount = 100}
		else if (amount < 0){amount = 0}
		skse.SendModEvent("0SAA"+actra.id+"_BlendMo", String(direct), Number(amount))
		}
		
		
		function express(ty, sy, am, recover){
		if (am > 100){am = 100}
		if (am < 0){am = 0}
		trace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!                                    Sending Expression: "+ty+" "+sy+" "+am)
		//trace("sending express!!!: "+ty+" "+sy+" "+am+" "+recover)
		skse.SendModEvent("0SAA"+actra.id+"_Blend"+ty, String(sy), Number(am))
		}
		
		function expressSaveEx(ty, sy, am, recover){
		if (am > 100){am = 100}
		if (am < 0){am = 0}
		//trace("sending express (Saved)!!!: "+ty+" "+sy+" "+am+" "+recover)
		ex.sy = sy
		ex.am = am
		//trace("SAVED: "+ex.sy+" "+ex.am)
		skse.SendModEvent("0SAA"+actra.id+"_Blend"+ty, String(sy), Number(am))
		}
		
		function restoreSaveEx(ty, sy, am, recover){
		skse.SendModEvent("0SAA"+actra.id+"_Blend"+"Ex", String(ex.sy), Number(ex.am))
		}
		
		
		function foundateMouth(){
			if(lastMouthMovement){
				for (var i=0; i < lastMouthMovement.length; i++){
					//trace("Restoring Mouth Express:!!!: "+mouthMovement[i].sy+" "+mouthMovement[i].am+" "+recover)
					skse.SendModEvent("0SAA"+actra.id+"_Blend"+"Ph", String(lastMouthMovement[i].sy), Number(0))
				}
			}
			lastMouthMovement = undefined
		}
		function expressMouth(mouthMovement, store){
			foundateMouth()
			
			if(store){lastMouthMovement = mouthMovement}
			
			for (var i=0; i < mouthMovement.length; i++) {
			if (mouthMovement[i].am > 100){mouthMovement[i].am = 100}
			if (mouthMovement[i].am < 0){mouthMovement[i].am = 0}
			//trace("sending Mouth express!!!: "+mouthMovement[i].sy+" "+mouthMovement[i].am+" "+recover)
			skse.SendModEvent("0SAA"+actra.id+"_Blend"+"Ph", String(mouthMovement[i].sy), Number(mouthMovement[i].am))			
			}		
		}
		
		function expressMouthRevert(mouthMovement, store){
			foundateMouth()
			
			if(store){lastMouthMovement = mouthMovement}
			
			for (var i=0; i < mouthMovement.length; i++) {
			if (mouthMovement[i].am > 100){mouthMovement[i].am = 100}
			if (mouthMovement[i].am < 0){mouthMovement[i].am = 0}
			//trace("sending Mouth express!!!: "+mouthMovement[i].sy+" "+mouthMovement[i].am+" "+recover)
			skse.SendModEvent("0SAA"+actra.id+"_Blend"+"Ph", String(mouthMovement[i].sy), Number(mouthMovement[i].am))
			var mouthUnit = []
			mouthUnit[0] = "ph"
			mouthUnit[1] = mouthMovement[i].sy 
			var time = new OTime({fn:adjustToDefault, scope:this}, mouthMovement[i].rev*1000, mouthUnit)
			}		
		}
		

		
		
		function adjust(Mode, Type, Amount, Mouth){
		if (Amount > 100){Amount = 100}
		if (Amount < 0){Amount = 0}
		
		
		trace("!!sending expression: "+Mode+" "+Type+" "+Amount)
		skse.SendModEvent("0SAA"+actra.id+"_Blend"+Mode, String(Type), Number(Amount))
		}

		function adjustToDefault(Mode, Type){
			trace("MOUTH OUT :"+Mode+" "+Type)
		skse.SendModEvent("0SAA"+actra.id+"_Blend"+Mode, String(Type), Number(0))
		}
		
		
		


		function mien(mienUnit){
		
		var amount = mienUnit.am
		if (amount > 100){amount = 100}
		if (amount < 0){amount = 0}
		skse.SendModEvent("0SAA"+actra.id+"_Blend"+mienUnit.ty, String(mienUnit.sy), Number(amount))
		}
		
		function mienEnd(type, style){
		skse.SendModEvent("0SAA"+actra.id+"_Blend"+type, String(style), Number(0))
		}


}


