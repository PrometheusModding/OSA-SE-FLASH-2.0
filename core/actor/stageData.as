import skse;

class core.actor.stageData
{
	
var o
var actra
var dia

var intensity

		public function stageData(core, act, diasa){
		o = core
		actra = act		
		dia = diasa

		
		intensity = new Object
		intensity.sex = new Object
		
		
		startIntensity()

		//stats
		//speed
		//records
		//sore		
		}
		


		
		function startIntensity(){
		intensity.sex = {self:1, other:1}
		}
		
		
		function getSpeed(){
			
		}
		


}


