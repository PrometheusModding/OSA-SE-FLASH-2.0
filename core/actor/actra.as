import skse; 

class core.actor.actra{

var o

var i
var id
var trueID

var name
var skyName
var gender
var genderL
var genderF
var hex

var mod
var modShort

var osid
var folder
var isPlayer
var voiceType

var race
var skyRace

var targIndex
var targGenderIndex

var awakened = false
var formBound = false

var dat

var cock
var pussy
var ahole



var body
var equip
var expression

var profile
var persona
var forms
var bodyStats
var voice
var temp
var gfx
var actua
var log

var formBindList

var stageStatus

		public function actra(ocore, aID, loadCommand, actroIndex){
			o = ocore
			i = actroIndex
			id = aID
			formBindList = []
			stageStatus = undefined
			
			if(loadCommand.cmd == "awaken"){awakened = true}				

			
			dat = new core.actor.dataLibrary(o, this, loadCommand)		
			equip = new core.actor.equipment(o, this)
			body = new core.actor.body(o, this)
			expression = new core.actor.expression(o, this)
			persona = new core.actor.persona(o, this)
			profile = new core.actor.profile(o, this)
			bodyStats = new core.actor.bodyStats.map(o, this)
			voice = new core.actor.voice(o, this)
			gfx = new core.actor.gfx(o, this)
			temp = new core.actor.temp(o, this)
			forms = new core.actor.forms(o, this)
			log = new core.actor.logData(o, this)
			//pussy = new FGen			
			//ahole = new AHole
			
			if(o.cfg.config.logging){log.addLog("gen", "ID: "+id+" Index: "+i)}

			
		}
		function actraEvent(eventUnit){
			ActorEvents[eventUnit.subtype](o, this, eventUnit)	
		}
		
		function clean(){
			formBound = false
			body.restoreBodyScale()
			body.scale.restore()
			body.scale.modeOCock = false
		}
		
		public function awaken(){
			if(!awakened){
			awakened = true
			
			dat.getRequests(dat.requests)
			}
		}
		
		function enterStage(dia){
			stageStatus = dia
			actua = new core.actor.stageData(o, this, dia)
		}
		
		function exitStage(){
			stageStatus = undefined
		}
		
		function isOnStage(){
			if(stageStatus){return true}
			else{return false}
		}
		
		public function animate(animation){
			skse.SendModEvent("0SAA"+id+"_Animate", String(animation));	
		}
		
		public function lightFx(lightType){			
		trace("Lights Sent "+id+" type "+lightType)
			skse.SendModEvent("0SAA"+id+"_Lights", String(lightType))
		}
		
		
		function regFormBind(formIndex, formMod, formid){
			var formBind = {index:formIndex, id:formid, mod:formMod}
			var L = formBindList.length
			if(L <= 0){
				formBindList[0] = formBind
				sendFormBind()
			}else{
				formBindList[L] = formBind
			}
		}

		public function outFormBind(){
		formBindList.shift()
		sendFormBind()
		}
		
		public function sendFormBind(){
			var L = formBindList.length
			if (L > 0){
			trace("Sending FormBIND"+formBindList[0].mod+" "+formBindList[0].index+" "+formBindList[0].id)
			var dubindex = formBindList[0].index+formBindList[0].id
			skse.SendModEvent("0SAA"+id+"_FormBind", String(formBindList[0].mod), Number(dubindex))
			var time = new Time({fn:outFormBind, scope:this}, core.util.func.RNG(60,100))
			} else {				
			}			
		}
	
	
		public function onDetails(){
		dat.getActraData("profile")	
		dat.getActraData("forms")
		dat.getActraData("body")
		dat.getActraData("gfx")
		}

	
		function fullyLoaded(){
			//curently in autoIntimates
			dat.fullLoad = true
			stageStatus.fullLoadCheck()
		}
		
		function formBind(){
			formBound = true
			body.ibo.register()
			body.spank.register()
			voice.vo.register()
			voice.ivo.register()
			voice.ivos.register()
			voice.wvo.register()
		}
		
		
}