

class core.dias.diaso{

var o
var a = []
var r = new Object



var uiStage

		public function diaso(Core){
			o = Core
			a[0] = "Default"
			uiStage = 50
		}
	
		function create(dID){
		var L = a.length
		a[L] = new core.dias.diasa(o, dID)
		r[dID] = new Object
		r[dID].u = a[L]
		r[dID].i = L
		}
		
		public function get(dID){
			return r[dID].u
		}

		public function addActra(aID, dID){
			var L = r[dID].u.actru.length
			r[dID].u.actru[L] = o.actro.get(aID)
			
			trace("New Diasa created")
		}
		
		
		function primeActra(OStage, actraID, dataRequests){
			if (!o.actro.get(actraID)){
					
					var loadCommand = {requests:dataRequests}
					
					o.actro.create(actraID, loadCommand)
				}else{o.actro.get(actraID).dat.getRequests(dataRequests)}
				
				
		trace("NEW PUSH:" +actraID)
		  OStage.queActra.push(actraID)
		}
		
		function getUStageID(){
		   uiStage++
		   if(uiStage>=100){uiStage=50}
		   return uiStage
		}
		
		function startStage(trig){
		var OStage = trig.dia
		
		o.diaso.create(OStage)
		OStage = o.diaso.get(OStage)

			OStage.queModule = trig.module
			OStage.queScene = trig.scene
			
			var requests = []
					requests[0] = "details"
					requests[1] = "scale"

			for (var i=0; i < trig.actra.length; i++){
				primeActra(OStage, trig.actra[i], requests)
			}			
			OStage.flags = trig.flags
			OStage.initPrep()
		
		}
		
	
	
}