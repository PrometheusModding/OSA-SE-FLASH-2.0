

class Scout{
	
var o
var dia
var sourceBack
var failBack
var waiting
var ignoreActra
var dataType

var module
var scene
var actra

		public function Scout(Core){
			o = Core			
			waiting = []
			ignoreActra = false
		}
				
				
		
		function checkScene(sceneID, moduleID, SourceB, failB){			
			sourceBack = SourceB
			failBack = failB
			scene = sceneID
			module = moduleID
			sceneIn()
		}
		
				
				
		function sceneIn(){
				if(!o.lib.SLib.get(scene)){o.lib.getOData("S", scene, module, sceneIn, this, failBack)
				}else{sourceBack.fn.apply(sourceBack.scope)}
		}	
				
				
		function checkPandect(moduleID, SourceB){			
			sourceBack = SourceB
			module = moduleID
			inPandect()
		}
		
				
				
		function inPandect(){
				if(!o.lib.PLib.get(module)){o.lib.getOData("P", module, "", inPandect, this)
				}else{sourceBack.fn.apply(sourceBack.scope)}
		}	
				
				
		function checkTags(moduleID, SourceB){			
			sourceBack = SourceB
			module = moduleID
			inTags()
		}
		
				
				
		function inTags(){
				if(!o.lib.TLib.get(module)){o.lib.getOData("T", module, "", inTags, this)
				}else{sourceBack.fn.apply(sourceBack.scope)}
		}	
				
				
				
				
		function checkOData(diasa, SourceB){			
			sourceBack = SourceB
			dia = diasa
			odataIn()
		}
		
		function odataIn(){
			odataModuleIn()
		}
		
		function odataModuleIn(){
			if(dia.queModule){
				if(!o.lib.MLib.get(dia.queModule)){
					o.lib.getOData("M", dia.queModule, "", odataModuleOut, this)
				}else{
					dia.module = o.lib.MLib.get(dia.queModule)
					odataModuleOut()
					}								
			}else{odataSceneIn()}			
		}
		
		function odataModuleOut(){
				dia.module = o.lib.MLib.get(dia.queModule)
				dia.queModule = undefined
				odataSceneIn()
		}
		
		function odataSceneIn(){
			if(dia.queScene!="AUTO"){
				if(dia.queScene){
					if(!o.lib.SLib.get(dia.queScene)){
						o.lib.getOData("S", dia.queScene, dia.module.id, odataSceneOut, this)
					}else{
						dia.scene = o.lib.SLib.get(dia.queScene)
						odataSceneOut()
						}				
				}else{actraIn()}
			}else{dia.queScene = dia.module.autoscene[core.util.func.RNG(0, dia.module.autoscene.length-1)].id
			odataSceneIn()
			}
		}
		
		function odataSceneOut(){
				dia.scene = o.lib.SLib.get(dia.queScene)
				dia.queScene = undefined
				actraIn()
		}
		
		function actraIn(){
			if(ignoreActra){odataOut()}
			else{actroCheck()}
		}
		
		function actroCheck(){
			if(dia.queActra){
				var readyCheck = 0
				for (var i=0; i < dia.queActra.length; i++) {
					readyCheck += actraCheck(dia.queActra[i], i)
				}			
				if (readyCheck >= dia.queActra.length){
					actroOut()
				}
			}else(odataOut())

		}
		
		function actraCheck(ID, actIndex){
			if(!o.actro.get(ID))
			{o.actro.create(ID)}
			
			if(!o.actro.get(ID).dat.gameLoad){
				if (!waiting[actIndex]){
				waiting[actIndex] = true
				trace(o.actro.get(ID).dat.waitListGameLoad)
				trace("On Wait List")
				o.actro.get(ID).dat.waitListGameLoad.push({fn:actroCheck, scope:this})
				}
				return 0
			}else{return 1}
		}
		
		function actroOut(){
			for (var i=0; i < dia.queActra.length; i++) {
					dia.actra.push(o.actro.get(dia.queActra[i]))
			}		
			dia.queActra = []
			odataOut()
		}
		
		function odataOut(){
			sourceBack.fn.apply(sourceBack.scope)	
		}
		
		
		
		
		

				
		function retrieveActraData(dataType, act, SourceB){
				actra = act
				sourceBack = SourceB
				actra.dat.getActraData(dataType, endScout, this)			
		}
		
		function endScout(){
			trace("Persona End Reached")
			trace("test:"+sourceBack.scope)
			sourceBack.fn.apply(sourceBack.scope)	
		}	
		
		
		
		
		
	
}