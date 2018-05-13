
class core.dias.util.scenaFunc
{


		
		public static function processOut(o, scene){
				
			for (var i=0; i < scene.animation.out.length; i++){
				core.dias.util.scenaFunc["OUT_"+scene.animation.out[i].cmd](o, scene, i)
			}
		}
		
		public static function OUT_leadIntoAnim(o, scene, ix){
			skse.SendModEvent("0SAO"+scene.dia.id+"_AnimateStage", String(scene.animation.out[ix].id))

		}
		
		
}	


