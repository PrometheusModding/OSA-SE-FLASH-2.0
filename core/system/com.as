

class core.system.com{

var o


		public function com(core){
			o = core
		}	
			
			
		
			public function playerCreateStage(){
				
			o.diaso.create(arguments[0])
			var OStage = o.diaso.get(arguments[0])
			
			var trigData = []
			trigData = arguments[1].split(",")
			OStage.queModule = trigData[0]
			OStage.queScene = trigData[1]		
			
			var requests = []
					requests[0] = "details"
					requests[1] = "scale"

			for (var i=0; i < arguments.length-2; i++){
				o.diaso.primeActra(OStage, arguments[2+i], requests)
			}

		}
		
		
		public function playerStartStage(){					
			
			var oStage = o.diaso.get(arguments[0])
			oStage.flags.approachAngle = arguments[1]
			
			oStage.flags.hostility[1] = arguments[3]
			oStage.flags.hostility[10] = arguments[4]
			if(arguments[3] == 1|| arguments[4] == 1){
			oStage.flags.hostileActors = 1
			}
			
			oStage.flags.relationship[1] = arguments[5]
			oStage.flags.relationship[10] = arguments[6]
			
			
			//FLAG TEST
			//oStage.chore.autoNav.navAgenda.push("$Wait,10")
			//oStage.chore.autoNav.navAgenda.push("$Go,0MF|Sy6!Sy6|Ho|St6Pop")
			//oStage.chore.autoNav.navAgenda.push("$EndScene")
			oStage.initPrep()
			
			
		}
		 
		
		public function skyActraDetails(){
			if(!o.actro.get(arguments[0]).dat.detailsData){
			o.actro.get(arguments[0]).dat.storeDetails(arguments)
			}
		}
		
		public function skyActraScale(){
			if(!o.actro.get(arguments[0]).dat.scaleData){
			o.actro.get(arguments[0]).dat.storeScale(arguments)
			}
		}
		
		public function skyActraOHeight(){
			o.actro.get(arguments[0]).dat.storeOHeight(arguments[1])
		}
		
		public function skyActraInit(actraID){
			//if (!o.actro.get(actraID).id){o.actro.create(actraID,"awaken")}
			//else{o.actro.get(actraID).awaken()}
			o.actro.create(actraID,"awaken")
		}
		
		public function skyActraAttireWorn(){
			o.actro.get(arguments[39]).equip.attire.setSkyAttire(arguments)
		}
		
		public function skyEqReadCuirassStyle(){
			o.actro.get(arguments[0]).equip.attire.autoInt.getCuirassStyle(arguments)
		}
		
		public function skyActraWeaponWorn(){
			o.actro.get(arguments[0]).equip.armament.setSkyWeapon(arguments)
		}

		
		public function skyActroReadyCheck(StageID){
			o.diaso.get(StageID).initCheckActra()
		}
		
		public function skyActraAE(actorID, stageID, animEv){
		o.diaso.get(stageID).scena.animEvent.spark(animEv.substr(2,1))
		}
		
		public function skySyncComplete(stageID){
		o.diaso.get(stageID).syncComplete()
		}
		
		public function endCommand(StageID){
		o.diaso.get(StageID).endCommand()
		trace("end Sent")
		}
		
		
		public function skyINI(){
			o.cfg.config.expandSky(arguments)
		}
		
		function skyMKeyCode(){
			o.cfg.binds.storeMKeyCode(arguments)
		}
		
		function skyMKeyMod(){
			o.cfg.binds.storeMKeyMod(arguments)
		}
		
		function skyOKey(){
			o.cfg.binds.storeOKey(arguments)
		}
		
		function skyEmergencyBinds(){
			o.cfg.binds.emergencyBinds()
		}
		
		function skyReport(){
			o.log[arguments[0]](arguments)
		}
}