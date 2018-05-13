import skse;


class core.dias.diasa{
	
var o
var id


var scene
var module
var actra
var actro

var callBackA 

var playerIs 
var playerActor
var playerEye

var actraReady
var actraFullReady
var actraFullQue
var stageReady
var queModule
var queScene
var queActra

var lastScene

public var flags
public var activeData

var transitionLock

var scena
var chore

var navStorage

var menuNav
var menuScene

var roleData

var navReady

var arrangeLock

var preSync
var isStageSet

var isNavApplicable
var isSceneApplicable

var observed

var CMD

var waiting
var waitTime

var stageAlive

var navVirgin
var log

		public function diasa(om, dID){
			actra = []
			roleData = []
			queActra = []
			callBackA = []
			o = om			
			id = dID			
			stageAlive = true
			
			navVirgin = true
			
			flags = new core.dias.flags(o)
			activeData = new core.dias.activeData(o)
			chore = new core.dias.choreo(o, this)
			actraReady = 0
			actraFullReady = 0
			stageReady = 0
			playerActor = false
			playerEye = false
			transitionLock = false
			navReady = false
			arrangeLock = false
			preSync = false
			isNavApplicable = false
			isSceneApplicable = false
			observed = false
			waiting = false
			actraFullQue = undefined
			log = new core.dias.logData(o, this)
			
			if(o.cfg.config.logging){log.addLog("boot", "Stage Created, ID: "+id)}
			if(o.cfg.config.logging){o.log.addLog("stg", "Stage Created, ID: "+id)}
			
		}
		
		function enterObserver(){
			
			if(o.cfg.config.logging){log.addLog("run", "An Observer has joined the stage...")}
			
			observed = true
			playerEye = true
			if (isNavApplicable){menuNav = o.hud.createNav(this, module, scene, actra)}
			if (isNavApplicable){menuScene = o.hud.createSceneMenu(this, module, scene, actra)}
			
		}
		
		function exitObserver(){
			if(o.cfg.config.logging){log.addLog("run", "An Observer has exited the stage...")}
			o.hud.removeNav()
			menuNav = undefined			
			o.hud.removeScene(true)
			menuScene = undefined
			observed = false
			playerEye = false
			o.viewStage = undefined
		}
		
		function arrangeActra(){
			if (!arrangeLock){
				arrangeLock = true
			var newActra = []
				for (var i=actra.length-1; i >= 0; i--){
						newActra.push(actra[i])
				}
			actra = newActra
			trace(actra[0].name+" "+actra[1].name)
			syncActra()
			var modModify = new core.dias.moduleModify(o, this)
			}
		}
		
		function arrangeActraMulti(tempActra){
			if (!arrangeLock){
				arrangeLock = true
				
			var newActra = []
				
				for (var i=0; i < actra.length; i++){
						newActra.push(tempActra[i])
				}
			actra = newActra
			trace(actra[0].name+" "+actra[1].name)
			syncActra()
			var modModify = new core.dias.moduleModify(o, this)
			}
		}
		
		
		
		function syncActra(){
		var actraCount = actra.length
		var actraString = actraCount+","+actra[0].id		
			    for (var i=1; i <= actra.length-1; i++){
					actraString += ","+actra[i].id
				}
				
		if(o.cfg.config.logging){log.addLog("run", "Synchronizing Actors, SendString: "+actraString)}
		
			skse.SendModEvent("0SAO"+id+"_ActraSync", String(actraString))
			
			if(o.flashDevMode){
				if(o.cfg.config.logging){log.addLog("run", "WARNING: Developer ByPass switch activated in syncActra()")}
				o.sim.mimicGameCall(syncComplete, this)
			}
		}
		
		
		
		function syncComplete(){
			if(o.cfg.config.logging){log.addLog("boot", "Sync CallBack received...")}
			
			if (!preSync){
				if(o.cfg.config.logging){log.addLog("boot", "SyncReport: preSync = False...")}
				preSync = true
				
				if(isStageSet){
					if(o.cfg.config.logging){log.addLog("boot", "SyncReport: isStageSet = False...")}
					core.dias.util.diasFunc.roleSetup(o, this)
					core.dias.util.diasFunc.detectPlayer(o, this)
					sceneOn()
						if(module.flag[0].nopos!=1){
							if(o.cfg.config.logging){log.addLog("boot", "SyncReport: flag.nopos != 1...")}
							core.dias.util.diasFunc.livePositionActra(o, this)
						}
						//Addition
						var modModify = new core.dias.moduleModify(o, this)
						
					isStageSet = true
					prep(prepOut)
				
				}else{
					
					if(o.cfg.config.logging){log.addLog("boot", "SyncReport: isStageSet = true...")}
					
					core.dias.util.diasFunc.roleSetup(o, this)
					core.dias.util.diasFunc.detectPlayer(o, this)
					sceneOn()
						if(module.flag[0].nopos!=1){
							if(o.cfg.config.logging){log.addLog("boot", "SyncReport: flag.nopos != 1...")}
						core.dias.util.diasFunc.positionActra(o, this)
						}
						var modModify = new core.dias.moduleModify(o, this)
					isStageSet = true
					prep(prepOut)
				}
							
			
			}else{
			if(o.cfg.config.logging){log.addLog("boot", "SyncReport: preSync = true...")}
			arrangeLock = false
			core.dias.util.diasFunc.roleSetup(o, this)
			core.dias.util.diasFunc.detectPlayer(o, this)
			scena.refreshScene()
			}
			
		}
		
		
		
		
		
		public function initPrep(){
		if(menuNav){o.hud.removeNav()}
			trace("Init Prep")
		var scout = new Scout(o)
		var sourceBack = {fn:initCheckStage, scope:this}
		scout.ignoreActra = true
		scout.checkOData(this, sourceBack)
		}
		
		public function initCheckActra(){
			actraReady ++
			initCheckAll()
		}
		
		public function fullLoadCheck(){
			actraFullReady ++
			if(actraFullQue){
				this[actraFullQue]()
			}
		}
		
		public function initCheckStage(){
			stageReady = true
			initCheckAll()
		}
		
		public function initCheckAll(){
			if(o.cfg.config.logging){log.addLog("boot", "INIT: CheckAll RECIEVED - stageReady: "+stageReady+" | actraReady: "+actraReady+" | scene.actors: "+scene.actors+"...")}
			if(o.cfg.config.logging){o.log.addLog("stg", "INIT: CheckAll RECIEVED - stageReady: "+stageReady+" | actraReady: "+actraReady+" | scene.actors: "+scene.actors+"...")}
			
			if(stageReady == true && actraReady >= scene.actors){
				if(o.cfg.config.logging){log.addLog("boot", "INIT: CheckAll PASSED - stageReady: "+stageReady+" | actraReady: "+actraReady+" | scene.actors: "+scene.actors+"...")}
				if(o.cfg.config.logging){o.log.addLog("stg", "INIT: CheckAll PASSED - stageReady: "+stageReady+" | actraReady: "+actraReady+" | scene.actors: "+scene.actors+"...")}
		
				prep(moduleInit)
			}
		}
		
		public function moduleInit(){
		
			if(!isStageSet){
				var modInit = new core.dias.moduleInit(o, this)
				prepForStart()
			}
			preSync = false
			
			for (var i=0; i < actra.length; i++) {
				actra[i].enterStage(this)
				if(!flags.xfer){
				actra[i].equip.requestAttire()
				}
			}
			syncActra()
			core.dias.util.diasFunc.buildActro(o, this)
		}
		
		function prepForStart(){
			if(o.cfg.config.frostfallException==1){
				o.skyStringNum("0SA_Special", "ExposureException", id)
			}
		}
		
		
		
		
		function prep(func){
			if(CMD){
			core.dias.util.destCMD.process(o, this, CMD)
			}else{
			scena.endScene()
			var scout = new Scout(o)
			var sourceBack = {fn:func, scope:this}
			scout.checkOData(this, sourceBack)
			}
		}
		
		
		function prepOut(){
			transitionLock = false
			if(scene.style != undefined){
			scena = new core.dias.scena(o, this)
			}else{
			scena = new core.dias.os2.main(o, this)
			}
			if(scena.scene.nav[0]){
			navOn(true)
			}
		}
		
				
		function preemtiveIn(Destination){
			if(Destination.charAt(0)=="$"){
				CMD = Destination
			}else{
		
		
			queScene = Destination
			var scout = new Scout(o)
			var sourceBack = {fn:preemtiveOut, scope:this}
			scout.checkOData(this, sourceBack)
			}
		}
		
		function preemtiveOut(){
			transitionLock = true
			navOn(false)
		}
	
		function menuSelection(menuDestination){			
			if(menuDestination.charAt(0)=="$"){
				core.dias.util.destCMD.process(o, this, menuDestination)
			}else{
			//processchoice
			
			navOff()
			if(transitionLock){preemtiveIn(menuDestination)}
			else{
				queScene = menuDestination
				prep(prepOut)}			
			}
		}
		
		function autonavSelect(destination){

			navOff()
			if(transitionLock){preemtiveIn(destination)}
			else{
				queScene = destination
				prep(prepOut)}		
		}
		


		
		function navOn(trueNav){
					navReady = trueNav	
					if(chore.hasChore()){
						chore.nextChore()
					}else if(!waiting){
						if(!menuNav){
							isNavApplicable = true
							if(o.viewStage.id == id){
								
								
								if(module.boot[0].dataMenu.toLowerCase()!="full"||actraFullReady >= scene.actors){
								menuNav = o.hud.createNav(this, module, scene, actra)
								}else{
			 					actraFullQue = "navOnExeFullLoad"
									for (var i=0; i < actra.length; i++) {
										if(actra[i].dat.fullLoad){
										   fullLoadCheck()
										}
									}
								
								}
								
							}
						}
					}
		}
		
		
		
		function navOnExeFullLoad(){
			if(module.boot[0].dataMenu.toLowerCase()!="full"||actraFullReady >= scene.actors){
			actraFullQue = undefined
			menuNav = o.hud.createNav(this, module, scene, actra)
			}
			
						
		}
		
		
		function navOff(){
			isNavApplicable = false
			navReady = false			
			
			isNavApplicable = false
							if(o.viewStage.id == id){
								o.hud.removeNav()
								menuNav = undefined
							}
		}
		
		function sceneOff(){
			isSceneApplicable = false
			if(o.viewStage.id == id){
				sceneOffExe()
			}
		}
		
		function sceneOffExe(){
			o.hud.removeScene(true)
			menuScene = undefined
		}
		
		function sceneOn(){ 
		 	isSceneApplicable = true
			if(o.viewStage.id == id){
				sceneOnExe()
			}
		}
		
		function sceneOnExe(){
			menuScene = o.hud.createSceneMenu(this, module, scene, actra)
		}
		
		
		
		
		
		function endCommand(){
			core.dias.sec.endDiasa.concludeDiasa(o, this)			
		}
		
		function clearScope(){
			this = undefined			
		}
		
		
		
		
		function actraInvite(actraID, actraTrueID, sceneID){
				if(menuNav){o.hud.removeNav()}
				if(o.actro.get(actraID).isPlayer && observed){observed = false}				
				log.addLog("run", "ActraInvite - ID: "+actraID+" | TrueID: "+actraTrueID+" | SceneID: "+sceneID)
				core.dias.util.diasFunc.addActra(o, this, actraID, actraTrueID, sceneID)
		}
		
		function actraDismiss(actraIndex, sceneID){
				if(menuNav){o.hud.removeNav()}
				
				if(actra[actraIndex].isPlayer){		
					playerEye = false
					o.viewStage = undefined
					o.hud.removeScene()
					playerIs = undefined
					playerActor = false
					o.viewStage = undefined
					o.hud.removeScene()
					}				
					
				core.dias.util.diasFunc.removeActra(o, this, actraIndex, sceneID)
				o.beacon._cbActraRemoveAO = {fn:cbActraDismiss,scope:this}
				
		
		}
		
		function cbActraDismiss(){
				actraReady--
				initPrep()
		}
		
		
	
}