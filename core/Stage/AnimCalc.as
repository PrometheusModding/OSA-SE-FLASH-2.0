
class AnimCalc
{


		
		public static function analyzeAnimation(sceneUnit, anim){
			if(anim[0].per){
			  return core.util.func.TIERper(anim)
			}else{return anim[core.util.func.RNG(0, anim.length-1)]}
		}

}	


