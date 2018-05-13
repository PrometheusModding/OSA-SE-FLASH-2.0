import XMLParser;
import ODelegate
import skse; 

class core.actor.dataLibrary{

var o
var actra
var detailsData
var scaleData
var oheightData
var profileData
var personaData
var formData
var gfxData
var bodyData
var gameLoad
var gamePreScene

var fullLoad

var requests 

public var waitListGameLoad
public var waitListGamePreScene

		public function dataLibrary(core, act, loadCommand){
		detailsData = false
		scaleData = false
		oheightData = false
		profileData = false
		personaData = false
		fullLoad = false
		gameLoad = false
		gamePreScene = false
			requests = []
			
			waitListGameLoad = []
			o = core
			actra = act
			
			if(loadCommand.requests){
				if(actra.awakened){getRequests(loadCommand.requests)}
				else{
				for (var i=0; i < loadCommand.requests.length; i++)
				requests.push(loadCommand.requests[i])
				}
			}
			
		}
		
		
		public function getRequests(newReqs){
			for (var i=0; i < newReqs.length; i++){
			requestData(newReqs[i])
			}
		}

		
		public function requestData(Req){
			skse.SendModEvent("0SA"+actra.id+"_RequestActraInfo", String(Req));
		}
		

		
		public function makeEntry(xmlText){
		var parse = new XMLParser();
		return parse.parseXML(xmlText)
		}
		
		public function makeIniEntry(IniText){
		var parse = new IniParser();
		return parse.parse(IniText)
		}
		
		
		public function get(mID){
			return detailsData
		}
		
		public function storeDetails(detailArr){

		detailsData     = true
		actra.trueID    = detailArr[1]
		actra.name      = detailArr[2]
		actra.skyName   = detailArr[2]
 		actra.gender    = detailArr[3]
		
		if(actra.gender == 0){
		actra.genderL = "M"
		actra.genderF = "Male"
		} 
		else{
		actra.genderL = "F"
		actra.genderF = "Female"
		}
	
		actra.isPlayer  = detailArr[4]
		
		
		actra.body.bodyScale = detailArr[5]
		actra.body.bodyScaleModified = detailArr[5]
		
		actra.race 	    = detailArr[6]
		actra.skyRace   = detailArr[6]
		actra.voiceType = (Number(detailArr[7]).toString(16)).toUpperCase()
		actra.body.weightSky    = detailArr[8]		
		
		actra.hex 	    = detailArr[10]
		
		if(detailArr[4] == 1){
		actra.mod 	    = "*PC"
		actra.modShort  = "*PC"
		
				if(o.cfg.config.playerSymbol == "!nm"){
				actra.osid      = "PC"+detailArr[2].toLowerCase()
				actra.folder    = "pc/"+detailArr[2].toLowerCase()+"/"
				}else if(o.cfg.config.playerSymbol == "!dg"){
				actra.osid      = "PC"+actra.genderF.toLowerCase()
				actra.folder    = "pc/"+actra.genderF.toLowerCase()+"/"
				}
				else{
				actra.osid      = "PC"+o.cfg.config.playerSymbolString
				actra.folder    = "pc/"+o.cfg.config.playerSymbolString+"/"
				}
		
		}else{
		
		actra.mod 	    = detailArr[11]
		actra.modShort  = detailArr[12]
		actra.osid      = detailArr[13]
		actra.folder    = "npc/"+formatModName(detailArr[12])+"/"+(detailArr[10].toUpperCase())+"/"
		}

		
		
		trace("										!ActraLIB! OHeight Loaded Name:"+actra.name+" ID:"+actra.id)
		oheightData = true
		o.lib[actra.id] = new String
		o.lib[actra.id] = String("1")
		actra.body.calculateWeight("orig")
		
		
		trace("										!ActraLIB! Details Loaded Name:"+actra.name+" ID:"+actra.id)
		if(o.cfg.config.logging){actra.log.addLog("gen", "Details have been aquired from Skyrim...")}
		if(o.cfg.config.logging){actra.log.addLog("gen", "Actor's name is "+actra.name)}
		actra.onDetails()
		updateLoadStatus()
		
		}
		
		function formatModName(modName){
			return (modName.split(" ").join(""))
		}
		
		public function storeScale(detailArr){
		scaleData = true
		actra.body.scale.body.orig         = detailArr[1]
 		actra.body.scale.belly.orig        = detailArr[2]
		actra.body.scale.belly.current     = detailArr[2]
		actra.body.scale.rearL.orig        = detailArr[3]
		actra.body.scale.rearL.current     = detailArr[3]
		actra.body.scale.rearR.orig        = detailArr[4]
		actra.body.scale.rearR.current     = detailArr[4]
		actra.body.scale.chestL.orig       = detailArr[5]
		actra.body.scale.chestL.current    = detailArr[5]
		actra.body.scale.chestR.orig       = detailArr[6]
		actra.body.scale.chestR.current    = detailArr[6]
		
		actra.body.scale.cockBase.orig      = detailArr[10]
		actra.body.scale.cockBase.current   = detailArr[10]
		actra.body.scale.cockScrotum.orig   = detailArr[11]
		actra.body.scale.cockScrotum.current= detailArr[11]
		actra.body.scale.cockShaft.orig     = detailArr[12]
		actra.body.scale.cockShaft.current  = detailArr[12]
		actra.body.scale.cockGen2.orig      = detailArr[13]
		actra.body.scale.cockGen2.current   = detailArr[13]
		actra.body.scale.cockGen3.orig      = detailArr[14]
		actra.body.scale.cockGen3.current   = detailArr[14]
		actra.body.scale.cockGen4.orig      = detailArr[15]
		actra.body.scale.cockGen4.current   = detailArr[15]
		actra.body.scale.cockGen5.orig      = detailArr[16]
		actra.body.scale.cockGen5.current   = detailArr[16]
		actra.body.scale.cockGen6.orig      = detailArr[17]
		actra.body.scale.cockGen6.current   = detailArr[17]
		
		
		trace("										!ActraLIB! Scales Loaded Name:"+actra.name+" ID:"+actra.id)		
		updateLoadStatus()
		}
		
		public function storeOHeight(oheightValue){
		actra.body.scale.oheight = oheightValue
		actra.body.scale.modifiedOHeight = oheightValue
		trace("										!ActraLIB! OHeight Loaded Name:"+actra.name+" ID:"+actra.id)
		oheightData = true
		o.lib[actra.id] = new String
		o.lib[actra.id] = String("1")
		actra.body.calculateWeight("orig")
		updateLoadStatus()
		}
		
		public function storeProfile(xmlText){
			trace("										!ActraLIB! Profile Loaded Name:"+actra.name+" ID:"+actra.id)
		profileData = true
		updateLoadStatus()
		}
		

	
		private function updateLoadStatus(){
			
			if(detailsData == true && scaleData == true){
				if (!gamePreScene){
				gamePreScene = true
				for (var i=0; i < waitListGamePreScene.length; i++){
				waitListGamePreScene[i].fn.apply(waitListGamePreScene[i].scope)
				}
				}
			}

			if(detailsData == true && scaleData == true && oheightData == true){
				if (!gameLoad){
					
				gameLoad = true
				for (var i=0; i < waitListGameLoad.length; i++){
				waitListGameLoad[i].fn.apply(waitListGameLoad[i].scope)
				}
				}
			}
		}
		
		
		
	
		
		private function getActraData(dataType, longBack, longScope){
			this[dataType+"Data"] = true
			var getXML = new Load
			getXML.callBack = {fn:outActraData, scope:this}
			getXML.args[1] = {fn:longBack, scope:longScope}
			getXML.args[2] = dataType
			if(dataType=="profile"){
			getXML.callBack.fn = outActraProfile
			getXML.dir = o.omfixDir+"OSA/Persona/"+actra.folder+dataType+".xml"
			}
			else if(dataType=="forms"){
			getXML.callBack.fn = outActraForms
			getXML.dir = o.omfixDir+"OSA/Persona/"+actra.folder+dataType+".xml"
			}
			else if(dataType=="body"){
			getXML.callBack.fn = outActraBody
			getXML.dir = o.omfixDir+"OSA/Persona/"+actra.folder+dataType+".xml"
			}
			else if(dataType=="gfx"){
			getXML.callBack.fn = outActraGfx
			getXML.dir = o.omfixDir+"OSA/Persona/"+actra.folder+dataType+".xml"
			}
			else{
			getXML.dir = o.omfixDir+"OSA/Persona/"+actra.folder+dataType+".xml"
			}
			
			getXML.getDoc()
		}
		
		public function outActraForms(iniData, longBack, dataType){			
			var outputData
			if(iniData){
				var outputData = makeEntry(iniData)
				
			}		
			actra[dataType].storeData(outputData)	
			
		}
		
		public function outActraGfx(iniData, longBack, dataType){			
			var outputData
			if(iniData){
				var outputData = makeEntry(iniData)
				
			}		
			actra[dataType].storeData(outputData)	
			
		}
		
		public function outActraBody(iniData, longBack, dataType){			
			var outputData
			if(iniData){
				var outputData = makeEntry(iniData)
				
			}		
			actra.bodyStats.storeData(outputData)	
			
		}
		
		public function outActraProfile(iniData, longBack, dataType){			
			if(iniData){
				var outputData = makeEntry(iniData)
				actra[dataType].storeData(outputData)
				longBack.fn.apply(longBack.scope)	
			}else{
				actra[dataType].storeData()
				longBack.fn.apply(longBack.scope)
			}		
			
		}
		
		public function outActraData(xml, longBack, dataType){			
			if(xml){
				var outputData = makeEntry(xml)
				actra[dataType].storeData(outputData)
				longBack.fn.apply(longBack.scope)	
			}else{
				actra[dataType].storeData()
				longBack.fn.apply(longBack.scope)
			}		
			
		}

		
}