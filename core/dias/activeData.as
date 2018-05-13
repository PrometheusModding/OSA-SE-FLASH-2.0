


class core.dias.activeData{
	
var o
var actorPos
var sceneVault
var SSL
var SST


		public function activeData(core){
			o = core
			actorPos = new Object
			resetSST()
			resetSSL()
		}
		
		
		public function resetSST(){			
			SST={data:undefined, speed:[]}
		}
		
		public function resetSSL(){			
			SSL={data:undefined, speed:[]}
		}
		
		
	
}