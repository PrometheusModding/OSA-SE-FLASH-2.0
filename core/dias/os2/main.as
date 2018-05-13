import mx.utils.Delegate;

class core.dias.os2.main
{

var o
var dia

var scene
var module
var actra

var animation

var speed
var time

var motif
var actraBuffs

var animEvent

var scenePause = false

var sxu

var playTime

var firstLoopTimer


var animAgent

		public function main(core, diasa){
			
			if(core.cfg.config.logging){diasa.log.addLog("nav", "NEW SCENE | Scene Script is OS2...")}
			
			if(diasa.stageAlive){
				
			o = core
			firstLoopTimer = true			
			dia = diasa
			actra = dia.actra
			module = dia.module
			scene = dia.scene
			actraBuffs = []
			playTime = 0
			
			sxu = {o:core, dia:dia, actra:actra, module:module, scene:scene}
			
			dia.menuScene.brass.module.htmlText = module.name
			dia.menuScene.brass.scene.htmlText = scene.info[0].name 


			trace("******************************New OS2******************************************************")
		
			if(o.cfg.config.logging){dia.log.addLog("nav", "SCENE LOADED: "+scene.id)}
			
			setScene()
			
			
			
			animEvent = new AnimationEvent(o, {dia:dia,actra:actra,module:module,scene:scene,scena:this})
			}else{
				if(o.cfg.config.logging){dia.log.addLog("nav", "SCENE stageAlive = False | ENDING SCENE...")}
				endScene()
				}
		}
		
		public function setScene(){
			animAgent = new core.dias.os2.anim(o, dia, this, scene.animation[0])	
			animAgent.init()
			
			makeBuffs()
			L()
		}
		
		public function OSceneTog(){			
			var tog = {o:o, dia:dia, module:module, scene:scene, actra:actra, dat:scene.togs[0], count:0, arr:0}
			var togOutput = core.audit.ckSceneTog.analyzeToggle(tog, scene.togs[0].tog0)			
			
			var arrTog = []
			arrTog[0] = togOutput
			time = new OTime({fn:OSceneTogOut, scope:this}, 10, arrTog)//For Magical unknown reasons this prevents a second animation loop from occuring that can never be cleared.
			
					
		}
		
		function OSceneTogOut(togOutput){
			this["togOut"+togOutput.cmd](togOutput)	
		}
		
		function togOutDEST(tog){
			dia.menuSelection(tog.dest)
		}
		function togOutEND(tog){
			dia.endCommand()
		}
		
		
		
		function refreshScene(){
		actra = dia.actra
		module = dia.module
		scene = dia.scene
		for (var i=0; i < actra.length; i++) {
		motif[i].End() 
		}
		actraAnimate()			
		playMotif()
		
		}
				
		function actraAnimate(){
			
		}
		
		function setAnimSpeed(){
			speed = []
				for (var i=0; i < actra.length; i++) {
					//calculate actra speed here
				speed[i] = 1
				}
		}
		

		public function L(){
			if(!dia.chore.autoNav.navAgenda[0] || dia.waiting == true){

			//actraAnimate()
			
			playMotif()

			sceneLoop()
			} else {scenePause = true}
		}

		public function unpause(){
			scenePause = false
			actraAnimate()
			
			playMotif()
		
			sceneLoop()
		}
		
		public function TPOS(){
			if(dia.activeData.actorPos.pos){
				if(dia.activeData.actorPos.pos != animation.actorPos[0].pos){
					dia.activeData.sceneVault = scene.id
					dia.menuSelection(animation.actorPos[0].prefix+dia.activeData.actorPos.pos+"_"+animation.actorPos[0].pos)
				}else{T()}				
			}else{T()}
			dia.activeData.actorPos = animation.actorPos[0] 
				
		}
		
		public function TPOSX(){	
			actraAnimate()
			var SceneOFX = new SceneFX(o, this, animation);			
			dia.preemtiveIn(dia.activeData.sceneVault)
			time = new Time({fn:callNextScene, scope:this}, animation.l*1000)			
		}
		
		public function T(){				
			dia.transitionLock = true
			actraAnimate()
			var SceneOFX = new SceneFX(o, this, animation);			

			dia.preemtiveIn(animation.dest)
			time = new Time({fn:callNextScene, scope:this}, animation.l*1000)
		}

		
		public function callNextScene(){
			dia.prep(dia.prepOut)
		}
		

		public function sceneLoop(){			
		trace("		!Loop Happaned: "+scene.id)
				if(dia.stageAlive){ //&& dia.scene == scene){//Fix for unknown cause of double animation when scene starts with OSceneTog
		
		
				
					if(dia.waiting){
						
						if(firstLoopTimer){
							firstLoopTimer = false
						}else{
						playTime += Number(animation.l)
						
							if(playTime >= dia.waitTime){
								playTime = 0
								dia.waitTime = 0
								dia.waiting = false
								firstLoopTimer = true
								dia.chore.externalComplete()
							}
						}
					}
					
					time = new Time({fn:sceneLoop, scope:this}, 2000)
				}else{endScene()}
		}
	

		public function playMotif(){
			motif = []
			if(scene.motif){
			for (var i=0; i < actra.length; i++) {
			
			motif[i] = new Motif(o, actra[i], {module:module, scene:scene, scena:this, actra:actra, role:i, dia:dia}, scene.motif[i])
			}
			}  
		}
		
		
		function makeBuffs(){
			for (var i=0; i < scene.buff.length; i++) {
				if(scene.buff[i].delay){
					var timeStorage = []
					timeStorage[0] = scene.buff[i]
					var time = new OTime({fn:applyBuff, scope:this}, scene.buff[i].delay*1000, timeStorage)
					
				}else{
				applyBuff(scene.buff[i])
				}
			}
		}
		
		function applyBuff(selectedBuff){
			var buff = new Buff(sxu, actra[selectedBuff.cast], actra[selectedBuff.targ], selectedBuff)
				actraBuffs.push(buff)
		}
		
		function getNodeKey(actraID, node){
			return scene.nodekey[dia.actro[actraID].i][node]
		}
		
		function getIntensity(role){
			if(animation["i"+role]){return animation["i"+role]}
			else{return 1}
		}
		
		
		function speedAdjust(amount, role, ix){

	    if(scene.speeddata[0]){
			
			var SP = scene.speeddata[0].speedevent[ix]
			var CurSpeed = Number(speed[SP.actor])

				
				CurSpeed += Number(amount)
				
				if (CurSpeed >= SP.max){
					CurSpeed = SP.max
				}
				if (CurSpeed <= 0){
					CurSpeed = 0
				}
				
				
				
				
				speed[SP.actor] = CurSpeed
	
				if(CurSpeed <= SP.min){
				CurSpeed = SP.min
				}
				

				animAgent.speedChange(ix)	
				
			
			dia.menuNav.updateSpeedText(SP)
		}
	}
		
		public function endScene(){
			time.sourceBack = undefined
			animAgent.End()
			dia.lastScene = scene			
			for (var i=0; i < motif.length; i++) {
			motif[i].End() 
			}
			
			for (var i=0; i < actraBuffs.length; i++) {
				actraBuffs[i].endBuff()
			}
			actraBuffs = []
			
			
		}
}