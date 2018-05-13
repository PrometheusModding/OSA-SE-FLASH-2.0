import skse

class core.system.control
{

public var MuActive

public var MuNav
public var MuNavON

public var MuMajor
public var MuMajorON

public var MuScene
public var MuSceneON

public var MuInspect
public var MuInspectON

public var SubInput = true

public var globalPause
var o 

		public function control(core){	
		globalPause = false
		o = core
		MuSceneON = false
		MuMajorON = false
		trace("    ...Control Major Loaded")	
		}
		
		public function MainMenu(){
			if(MuScene){
			  sceneMenuDirect()
			}else{
				majorMenuDirect()
			}
		}
		
		function activateGlobalPause(time){
			globalPause = true
			time = new Time({fn:unlockGlobalPause, scope:this}, time)
		}
		
		function unlockGlobalPause(){
			globalPause = false
		}
		
		function sceneMenuDirect(){
			if (MuSceneON == false){		
				if (SubInput == true){
				MuSceneON = true
				MuScene.ctr.engage()
				}
			}
			else if (MuSceneON == true){
				MuScene.ctr.disengage()
				MuSceneON = false
			}
			menuDecide()
		}
		
		function majorMenuDirect(){
			if(MuInspect){
				o.hud.InspectMenu.endMenu()
			}
				if (MuMajorON == false){		
					if (SubInput == true){
					o.hud.createMajorMenu()
				MuMajorON = true
				MuMajor.ctr.engage()
					}
				}
				else if (MuMajorON == true){
					MuMajor.ctr.disengage()
					MuMajorON = false
				}
			menuDecide()
		}
		

		
		public function menuOn(Mu, MenuType) {	
			this[MenuType] = Mu
			this[MenuType+"ON"] = true
			
			menuDecide()
		}
		
		public function menuGreet(Mu, MenuType) {	
			this[MenuType] = Mu
		}
		
		
		public function menuDecide(){
			if (MuNavON && MuSceneON){
				MuActive = MuScene
			}
			else if(MuSceneON){
				MuActive = MuScene
			}
			else if(MuNavON){
				MuActive = MuNav
			}			
			else if(MuMajorON){
				MuActive = MuMajor
			}
			
			
			
		}		
		
		function menuOff(MenuType, superEnd) {	
			
			
			if(MenuType=="MuScene"){
				this[MenuType+"ON"] = false
					if(superEnd){
						this[MenuType] = undefined
					}
				menuDecide()
			}else{
				this[MenuType+"ON"] = false
				this[MenuType] = undefined
			}
			
		}

			function TOG(){if(!globalPause){MuActive.ctr.DT()}}
			function UP(){if(!globalPause){MuActive.ctr.DU()}}
			function DOWN(){if(!globalPause){MuActive.ctr.DD()}}		
			function LEFT(){if(!globalPause){MuActive.ctr.DL()}}	
			function RIGHT(){if(!globalPause){MuActive.ctr.DR()}}	
			function YES(){if(!globalPause){MuActive.ctr.DY()}}
			function NO(){if(!globalPause){MuActive.ctr.DN()}}
			function END(){if(!globalPause){o.com.endCommand(o.viewStage.id)}}
			function MENU(){if(!globalPause){MainMenu()}}
			
			
			function INSPECT(actraID){				
				if(!globalPause){
					if(MuNavON == true || MuSceneON == true){
										
					}else{
						if(MuMajor){
						o.hud.MajorMenu.endMenu()
						}
						MuInspectDirect(actraID)
						MuActive = MuInspect
					}
				}
			}
			
			function MuInspectDirect(actraID){
				o.hud.createInspectMenu(actraID)
				MuInspectON = true
				MuInspect.ctr.engage()
			}
}