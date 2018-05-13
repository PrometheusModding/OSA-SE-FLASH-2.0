import skse;

class core.actor.bodyStats.map
{
	
var o
var actra

var has
var bodyData

		public function map(ocore, act){
		o = ocore
		actra = act	
		}
		
		public function storeData(BodyData){			
			if(BodyData){
				if(o.cfg.config.logging){actra.log.addLog("bod", "Actor has a body.xml...")}
				bodyData = BodyData
			}else{
				if(o.cfg.config.logging){actra.log.addLog("bod", "Actor does not have a body.xml...")}

			}					
			
		}
		

}


