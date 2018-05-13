

class core.actor.actro{

var o
var a = []
var r = new Object
	
		public function actro(core){
		
			o = core
			a[0] = "Default"
		}
		
		function create(aID, args){
			if(!o.actro.get(aID)){
			   o.log.addLog("run", "Actra entry made in Actro: "+aID)
				var L = a.length
				a[L] = new core.actor.actra(o, aID, args, L)
				r[aID] = new Object
				r[aID].u = a[L]
				r[aID].i = L
		   }
		}
		
		public function get(aID){
			return r[aID].u
		}
		
		
		public function details(){
			if (!o.actro.get(arguments[0])){o.actro.create(arguments[0])}
			o.actro.get(arguments[0]).dat.storeDetails(arguments)
		}
		
	

}