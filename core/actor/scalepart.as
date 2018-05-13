import skse; 

class core.actor.scalepart{

var o
var actra
var id

var orig
var current
var modified

		public function scalepart(core, act, scalenode){
		o = core
		actra = act		
		id = scalenode
		modified = false
		}
		
		
		public function snapScale(scaleValue){
		current = scaleValue
		modified = true
		skse.SendModEvent("0SAA"+actra.id+"_SnapSc", String(id), Number(scaleValue))
		}
				
		public function blendScale(scaleValue){
		current = scaleValue
		modified = true
		skse.SendModEvent("0SAA"+actra.id+"_BlendSc", String(id), Number(scaleValue))
		}
		
		
		public function restore(){if(modified){
			modified = false
			current = orig
			skse.SendModEvent("0SAA"+actra.id+"_SnapSc", String(id), Number(orig))}
		}
		
		public function restoreBlend(){if(modified){
			modified = false
			current = orig
			skse.SendModEvent("0SAA"+actra.id+"_BlendSc", String(id), Number(orig))}
		}
			
			
			
	    public function checkOriginB(scaleAmount){
		if(isNaN(scaleAmount)){
			if(scaleAmount == "ao"){
			modified = false
			current= orig
			return orig
			}else{
			modified = false
			current= orig
			return orig
			}			
		}			
		else{
		return scaleAmount			
		}
		}
}