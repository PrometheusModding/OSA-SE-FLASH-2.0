

class core.dias.util.calcNav{

var o
var d
var coreUnit
var navAgenda
var navigating

		public function calcNav(om, dia){
			o = om
			d = dia
			coreUnit = {o:o, d:d, autonav:this}
			navAgenda = []
		}
		
		public function isNav(){
			if(navAgenda[0]){
			navStep()
			return true
			}else{
			return false
			}
		}
	
		function newAgenda(destination, command, warp){
			if(!warp){
				if(command){var DestLoad = new Lance(o, inputCommandAgenda, this)}
				else{var DestLoad = new Lance(o, inputAgenda, this)}
				DestLoad.dat[0] = destination
				DestLoad.checkScene(destination, d.module.id)
			}else{
				 navAgenda[0] = "WARP"+destination
				 if(d.navReady){
				 navStep()
				 }
			}
		}
		
		function inputAgenda(destination){
			 //var expand = AutoNavCalc.directify(destination)
			 navAgenda.push(destination) 
			 if(navAgenda.length <= 1){
				 if(d.navReady){
				 navStep()
				 }
			 }
		}
		
		function inputCommandAgenda(destination){
			 //var expand = AutoNavCalc.directify(destination)
			 navAgenda[0] = destination 
			 trace("NEW AGENDA COMMAND INPUT")
				 if(d.navReady){
				 navStep()
				 }
		}
		
		//NEW
		
		public function navStep(){
			if(d.navReady){ 
			stepStandard()
			}
			
		}
		
		
		function stepStandard(){
			trace("NEW STEP: "+navAgenda[0])

			if(navAgenda[0].substr(0,4)=="WARP"){
				nextMove(navAgenda[0].substr(4))
				navAgenda.shift()
			}else{
				if(!navAgenda[0].scene){
						var expandDest = AutoNavCalc.directify(navAgenda[0])
						 navAgenda[0] = {scene:o.lib.SLib.get(navAgenda[0]), fam:expandDest.fam, ori:expandDest.ori, loc:expandDest.loc}			
						
					}				
				
				var expand = AutoNavCalc.directify(d.scene.id)
				var current = {scene:d.scene, fam:expand.fam, ori:expand.ori, loc:expand.loc} 
				AutoNavCalc.analyzePath({core:coreUnit, cScene:current, dScene:navAgenda[0]}) 	
			}	
		}
		
		
		
		
		
		
		
		
		
		public function nextMove(destination){
			trace("NAV MVOEMENT PLANNED: "+destination)
			d.autonavSelect(destination)
		}
		
		public function agendaCompleted(){
			navAgenda.shift()
			trace("AGENDA COPMLETED"+navAgenda[0])
			d.chore.choreComplete()
		}
	
	
}