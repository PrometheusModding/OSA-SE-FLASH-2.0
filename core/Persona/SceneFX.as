import skse; 
import mx.utils.Delegate;

class SceneFX
{


var o
var dia

var scena

var fxu

var animSuite

		public function SceneFX(core, sceneActive, animation){			
			o = core
			if(o.cfg.config.tempOSFX == 1){
				scena = sceneActive			
				animSuite = animation
				fxu = {o:o, dia:scena.dia, module:scena.module, scene:scena.scene, actra:scena.actra, destination:undefined}
				
				var scout = new Scout(o)
				var sourceBack = {fn:beginFX, scope:this}
				
				if(animSuite.dest){
				scout.checkScene(animSuite.dest, fxu.module.id, sourceBack, {fn:beginFX, scope:this})
				}
			}
		}

		
				
		public function beginFX(){		
			fxu.destination = o.lib.SLib.get(animSuite.dest)
			var actraCur
			var GenActra
			trace("			!!!SceneFX")
		//MFX PROCESS
		
		for (var i=0; i < animSuite.mfx.length; i++) {			
			actraCur = fxu.actra[animSuite.mfx[i].a]
			
					for (var j=0; j < animSuite.mfx[i]["fx"+actraCur.gender].length; j++) {
						
						
						var MFX = new OSFX(fxu, actraCur, animSuite.mfx[i].a, animSuite.mfx[i]["fx"+actraCur.gender][j])
					}
		}
		
		
		//OFX PROCESS)
		
			for (var i=0; i < animSuite.ofx.length; i++) {			
			actraCur = fxu.actra[animSuite.ofx[i].a]
			
					for (var j=0; j < animSuite.ofx[i]["fx"+actraCur.gender].length; j++) {
						var MFX = new OSFX(fxu, actraCur, animSuite.ofx[i].a, animSuite.ofx[i]["fx"+actraCur.gender][j])
					}
			}
			
			for (var i=0; i < animSuite.cfx.length; i++) {			
						var CFX = new CinemaFX(fxu, animSuite.cfx[i])
			}
			
			if (animSuite.dfx){
					for (var i=0; i < animSuite.dfx.length; i++){
					var DFX =  fxu.module.dfx
						actraCur = fxu.actra[animSuite.dfx[i].a]
						
							for (var j=0; j < DFX[animSuite.dfx[i].fx]["fx"+actraCur.gender].length; j++) {
														
							var DFX = new OSFX(fxu, actraCur, animSuite.dfx[i].a, DFX[animSuite.dfx[i].fx]["fx"+actraCur.gender][j])
							}			
					}
				
			}
		}

				
				
						
				
				
				
				
		
}


