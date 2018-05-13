
class core.dias.choreo{
	

var o
var d
var autoNav


			public function choreo(om, dia){
				o = om
				d = dia
				autoNav = new core.dias.util.calcNav(o, d)
				
			}
			
			function hasChore(){
					if(autoNav.navAgenda[0]){
							return true
					}else{
							return false
					}
			}
			
			
			function nextChore(){
				if (isCommand()){
					
					if(o.cfg.config.logging){o.log.addLog("anav", "Next Choreography: "+autoNav.navAgenda[0])}
		
					core.dias.util.choreCMD.commandType(o, d, autoNav.navAgenda[0])
				}else{
				autoNav.navStep()
				}
			}
			
			function commandComplete(breakThread){
				if(breakThread){
					var _time = new Time({fn:commandCompleteNext, scope:this}, 10)
				}else{commandCompleteNext()}
			}
			
			function commandCompleteNext(){
				autoNav.navAgenda.shift()
				if(hasChore()){
						nextChore()
				}else{
					choreComplete()
				}
			}
			
			function isCommand(){
				if(autoNav.navAgenda[0].charAt(0) == "$"){
						return true
				}else{
						return false
				}
			}
			
			function choreComplete(){
				d.navOn(true)
				if(d.scena.scenePause){d.scena.unpause()}
			}
			
			function externalComplete(){
				commandComplete()
			}
	
}