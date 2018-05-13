
class MienOutput
{

		
		
		public static function expression(actra, mien, recover){
		if(mien){
			trace("EXPRESSION SEND :"+mien.sy)
			//trace("mien output"+mien.sy)
			actra.expression.express("Ex", mien.sy, core.util.func.PAN(mien.am, mien.pan), false)	
		}
		}
		
		public static function reactionex(actra, mien){
		if(mien){
			trace("REACTION BEING SENT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+mien.sy)
			actra.expression.express("Ex", mien.sy, core.util.func.PAN(mien.am, mien.pan))
			
			var time = new Time({fn:actra.expression.restoreSaveEx, scope:actra.expression}, mien.rec*1000)
		}
		}
		
		public static function expressionSaveEx(actra, mien, recover){
		if(mien){
			actra.expression.expressSaveEx("Ex", mien.sy, core.util.func.PAN(mien.am, mien.pan), false)	
		}
		}
		
		public static function brows(actra, mien, recover){
		if(mien){
			if(mien.vpan){
				var pan:Number = core.util.func.PAN(0, mien.vpan)
				spectrum(actra, 2, 6, Number(mien.vl)+pan, false) 
				spectrum(actra, 3, 7, Number(mien.vr)+pan, false) 		
			}else{
				spectrum(actra, 2, 6, core.util.func.PAN(mien.vl, mien.vlpan), false) 
				spectrum(actra, 3, 7, core.util.func.PAN(mien.vr, mien.vrpan), false) 		
			}
			if(mien.hpan){
				var pan:Number = core.util.func.PAN(0, mien.hpan)
				actra.expression.express("Mo", 4, Number(mien.il)+pan, false)
				actra.expression.express("Mo", 5, Number(mien.ir)+pan, false)
			}else{
				actra.expression.express("Mo", 4, core.util.func.PAN(mien.il, mien.ilpan), false)
				actra.expression.express("Mo", 5, core.util.func.PAN(mien.ir, mien.irpan), false)
			}
		}
		}
     
	 
	 	public static function spectrum(actra, low, high, spec, recover){
			if(spec < 0){
			actra.expression.express("Mo", low, spec*-1, recover)
			actra.expression.express("Mo", high, 0, recover)
			}else{
			actra.expression.express("Mo", high, spec, recover)
			actra.expression.express("Mo", low, 0, recover)
			}
		}
		
		public static function squint(actra, mien, recover){
		if(mien){
			if(mien.pan){
					var pan:Number = core.util.func.PAN(0, mien.pan)
					actra.expression.express("Mo", 12, Number(mien.l)+pan, recover)
					actra.expression.express("Mo", 13, Number(mien.r)+pan, recover)
			}
		}
		}
		
		public static function lids(actra, mien, recover){
		if(mien){
			if(mien.pan){
					var pan:Number = core.util.func.PAN(0, mien.pan)
					actra.expression.express("Mo", 0, Number(mien.l)+pan, recover)
					actra.expression.express("Mo", 1, Number(mien.r)+pan, recover)
			}
		}
		}
		
		
		public static function mouth(actra, mien, rev){
		if(mien){ 
					if(!rev){
						var mouthMovement = []
							for (var i=0; i < mien.ph.length; i++) {
							mouthMovement.push({sy:mien.ph[i].sy, am:core.util.func.PAN(mien.ph[i].am, mien.ph[i].pan)})
							}
						actra.expression.expressMouth(mouthMovement, true, false)	

					}else{
						var mouthMovement = []
							for (var i=0; i < mien.ph.length; i++) {
							mouthMovement.push({sy:mien.ph[i].sy, am:core.util.func.PAN(mien.ph[i].am, mien.ph[i].pan), rev:mien.ph[i].rev})
							}
							actra.expression.expressMouthRevert(mouthMovement, true)	

						
					}
		}
		}
		
		
		public static function voice(actra, mien, blockLipSync){
		if(mien){

					actra.voice.say(mien.fo, mien.ty, mien.sy, mien.nosync)
		}
		}
		
		
}