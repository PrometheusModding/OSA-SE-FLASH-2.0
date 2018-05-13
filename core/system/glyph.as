
class core.system.glyph
{
	
var o
var ref

		public function glyph(core){
		o = core
		ref = new Object
		}	
		
		
		public function makeStage(sceneDesignation){	
		
		var OStage = o.diaso.getUStageID()		
		ref[sceneDesignation] = new Object
		ref[sceneDesignation] = String(OStage)
		o.diaso.create(OStage)
		OStage = o.diaso.get(OStage)
		}
		
		public function setActors(stageID){
			var requests = []
					requests[0] = "details"
					requests[1] = "scale"
			for (var i=1; i < arguments.length; i++){
				o.diaso.primeActra(o.diaso.get(stageID), arguments[i], requests)
			}
			
		}
		
		public function setModule(stageID, moduleID, sceneID, sceneLoc){
			o.diaso.get(stageID).queModule = moduleID
			o.diaso.get(stageID).queScene = sceneID
			
			if(sceneLoc!=""){o.diaso.get(stageID).flags.loc = sceneLoc}
			
		}
		
		public function setPlan(stageID, plan){
			var ostage = o.diaso.get(arguments[0])
			
			for (var i=1; i < arguments.length; i++){
			ostage.chore.autoNav.navAgenda.push(arguments[i])
			}
		}
		
		public function setPlanString(myPlan){
			var plan:Array = myPlan.split("__") 
			var ostage = o.diaso.get(plan[0])
			
			for (var i=1; i < plan.length; i++){
			ostage.chore.autoNav.navAgenda.push(plan[i])
			}
		}
		
		public function startStage(stageID){	
			o.diaso.get(stageID).initPrep()
		}
		
}