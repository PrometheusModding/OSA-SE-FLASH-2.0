import XMLParser;
import ODelegate


class core.lib.dataLib{

var o

var om
var MLib
var SLib
var PLib
var TLib
var codex
var intimateLib
var sorceryLib
var lang
var langP






		public function dataLib(Core){
			o = Core
			MLib = new core.lib.dataCache(Core, this, "module")
			SLib = new core.lib.dataCache(Core, this, "scene")
			PLib = new core.lib.dataCache(Core, this, "pandect")
			TLib = new core.lib.dataCache(Core, this, "tags")
			codex = new core.lib.codex(Core, this)
			intimateLib = new core.lib.dataCacheMotif(Core, this, "intimate")
			sorceryLib = new core.lib.dataCacheMotif(Core, this, "sorcery")
			lang = new Object
			langP = new Object
		}
		
		

		
		function translate(txt, moduleID, type){
			if(o.lib["lang"+type][moduleID].user[txt]){return o.lib["lang"+type][moduleID].user[txt]}
			else{return o.lib["lang"+type][moduleID]["default"][txt]}
		}
		
		
		
		public function makeEntry(xmlText){
		var parse = new XMLParser();
		return parse.parseXML(xmlText)
		}
		
		public function getOData(dataType, ID, IDX, longBack, longScope, failBack){
			var getXML = new Load
			getXML.callBack = {fn:endOData, scope:this}
			getXML.args[1] = {fn:longBack, scope:longScope}
			getXML.args[2] = this[dataType+"Lib"]
			getXML.args[3] = failBack
			getXML.dir = this[dataType+"Dir"](ID, IDX)
			getXML.getDoc()
		}
		
		public function endOData(xml, longBack, Library, failBack){
			if(xml){
				Library.storeData(xml)
				longBack.fn.apply(longBack.scope)	
			}else{
				trace("MODULE NOT LOADED")
				failBack.fn.apply(failBack.scope)	
			}
		}
			
		function PDir(ID){
			o.log.addLog("run","Loading Pandect.xml:"+o.prefixDir+"0SA/mod/"+ID+"/pandect/pandect.xml")
			getPTranslations(ID)
			return o.prefixDir+"0SA/mod/"+ID+"/pandect/pandect.xml"
		}
		
		function TDir(ID){
			o.log.addLog("run","Loading Tag.xml:"+o.prefixDir+"0SA/mod/"+ID+"/tags/tags.xml")
			return o.prefixDir+"0SA/mod/"+ID+"/tags/tags.xml"
		}
		
		function MDir(ID){
			o.log.addLog("run","Loading Module.xml:"+o.prefixDir+"0SA/mod/"+ID+"/module/module.xml")
			getMTranslations(ID)
			return o.prefixDir+"0SA/mod/"+ID+"/module/module.xml"
		}
		
		
		function getMTranslations(ID){
			lang[ID] = new Object
			lang["default"] = new Object
			lang.user = new Object
			getMLang(ID, "default")
			getMLang(ID, o.cfg.language)
		}
		
		public function getMLang(moduleID, langType){
		var getXML = new Load
			getXML.callBack = {fn:outMLang, scope:this}
			getXML.args[1] = moduleID
			getXML.args[2] = langType
			getXML.dir = o.prefixDir+"0SA/mod/"+moduleID+"/translate/_"+langType+".ini"
			getXML.getDoc()
		}
		
		public function outMLang(ini, moduleID, langType){
		if(langType=="default"){lang[moduleID]["default"] = o.cfg.makeIni(ini)}
		else{lang[moduleID].user = o.cfg.makeIni(ini)}
		}
		
		
		
		
		function getPTranslations(ID){
			langP[ID] = new Object
			langP["default"] = new Object
			langP.user = new Object
			getPLang(ID, "default")
			getPLang(ID, o.cfg.language)
		}
		
		public function getPLang(moduleID, langType){
		var getXML = new Load
			getXML.callBack = {fn:outPLang, scope:this}
			getXML.args[1] = moduleID
			getXML.args[2] = langType
			getXML.dir = o.prefixDir+"0SA/mod/"+moduleID+"/translate/_"+langType+"_pandect.ini"
			getXML.getDoc()
		}
		
		public function outPLang(ini, moduleID, langType){
		if(langType=="default"){langP[moduleID]["default"] = o.cfg.makeIni(ini)}
		else{langP[moduleID].user = o.cfg.makeIni(ini)}
		}
		
		
		function SDir(ID, IDX){
			return o.prefixDir+"0SA/mod/"+IDX+"/scene/"+directifySID(ID)+".xml"
		}
		
		public function directifySID(SceneID){
		var Dir = ""
		var Ser
		var lastSer = 0
		Ser = SceneID.indexOf("|", lastSer)
		Dir += SceneID.substring(lastSer, Ser)+"/"
		lastSer = Ser+1
		Ser = SceneID.indexOf("!", lastSer)
		while (Ser != -1){
		Dir += SceneID.substring(lastSer, Ser)
		lastSer = Ser+1
		Ser = SceneID.indexOf("!", lastSer)		
		}
		Ser = SceneID.indexOf("|", lastSer)
		Dir += SceneID.substring(lastSer, Ser)+"/"
		lastSer = Ser+1
		Ser = SceneID.indexOf("|", lastSer)
		Dir += SceneID.substring(lastSer, Ser)+"/"
		Dir += SceneID.substring(Ser+1)
		return Dir	
		}
		
		
		
		function getMotifData(long, driveID, sectionID, classID, themeID){
			if(!this[driveID+"Lib"][sectionID][classID]){
				this[driveID+"Lib"][sectionID][classID] = new Object
				this[driveID+"Lib"][sectionID][classID] = makeEntry("<classdata></classdata>")
				this[driveID+"Lib"][sectionID][classID].r = new Object
				}
			if(!getMotif(driveID, sectionID, classID, themeID)){ 
				var getXML = new Load
				getXML.callBack = {fn:outMotifData, scope:this}
				getXML.args[1] = {fn:long.fn, scope:long.scope, extra:long.extra}
				
				var motifSuite = []
				motifSuite[0] = driveID
				motifSuite[1] = sectionID
				motifSuite[2] = classID
				motifSuite[3] = themeID
				
				getXML.args[2] = motifSuite
				
				getXML.dir = o.omfixDir+"OSA/Persona/class/"+classID+"/"+driveID+"/"+sectionID+"/"+themeID+".xml"
				getXML.getDoc()
			}else{long.fn.apply(long.scope, long.extra)}
		}
		
		private function outMotifData(xml, long, motifSuite){
			if(xml){
				if(!getMotif(motifSuite[0], motifSuite[1], motifSuite[2], motifSuite[3])){
				this[motifSuite[0]+"Lib"].storeData(xml, motifSuite)
				long.fn.apply(long.scope, long.extra)
				}else{long.fn.apply(long.scope, long.extra)}
			}else{
				trace("MODULE NOT LOADED")
			}
		}
		
		public function getMotif(driveID, sectionID, classID, themeID){
			return this[driveID+"Lib"][sectionID][classID].r[themeID].u
		}
		
		
		
		
		



}