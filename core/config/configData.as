import skse; 
import IniParser;
import mx.utils.Delegate;

class core.config.configData
{
	
var o
var esg
var config
var lang
var langESG
var units
var language


var xconfig

var binds
var loadAttempt 

var customizer


		public function configData(om){
		o = om
		o.fonts = {l:"OFontL", m:"OFontM"}
		config = new core.config.configTemplate(o)
        
		customizer={gfx:undefined, gfxHas:false, names:undefined, namesHas:false, equip:undefined, equipHas:false}
		
		binds = new core.config.binds(o)
	
		
		o.log.addLog("boot", "\n-------- BEGIN CONFIG SCRIPT ------------")
		
		language = _global.skse.plugins.OSA.GetSkyIni(String("sLanguage:General")).toLowerCase()
		
		
		
			if (String(o) == "_level0.widget"){
			o.log.addLog("boot", "CFG | WARNING: Development Switch ByPass in configData constructor() ACTIVATED...")
			language="english"
			}
			
		o.log.addLog("boot", "CFG | ClientLanguage Settings loaded: "+language)
		
		
		esg = new ConfigEsg(o)
		inConfigXML()
		inCustomizerXML("gfx")
		inCustomizerXML("equip")
		inCustomizerXML("names")
		
		loadAttempt = false 
		translateOSA()
		
		
		
		}
		
		
		
		public function inConfigXML(){
		o.log.addLog("boot", "CFG | Loading config.xml: "+o.prefixDir+"0SA/_0S/Config/_config.xml")
		var lv = new LoadVars();
		lv.onData = Delegate.create(this, outConfigXML)
		lv.load(o.prefixDir+"0SA/_0S/Config/_config.xml"); 
		}
		
		private function outConfigXML(configXML){
		xconfig = o.makeEntry(configXML)
		if(xconfig){
			o.log.addLog("boot", "\n----- CONFIG DOCUMENTS INCOMING -----\nCFG | confix.xml loaded...")
		}else{
			o.log.addLog("boot", "CFG | CRITICAL WARNING | confix.xml NOT FOUND...")
		}
		units = xconfig.measurementUnits[0]
			o.log.addLog("boot", "CFG | Booting InClient OSA script...")
		o.gameBoot()
		o.ready.systemReady("config")
		}

		
		
		function translateOSA(){
		if(xconfig.deepConfig[0].languageOverride[0] != "" && xconfig.deepConfig[0].languageOverride[0] != undefined){
			o.log.addLog("boot", "CFG | Attempting to load config.xml languageOverride...")
		
			language = xconfig.deepConfig[0].languageOverride[0].toLowerCase()
		}		
		inTranslationIni(language)
		}
		
		public function inTranslationIni(gameLanguage){
		o.log.addLog("boot", "CFG | Loading translate.ini: "+o.prefixDir+"0SA/_0S/Translate/_"+gameLanguage+".ini")
		
		var lv = new LoadVars();
		lv.onData = Delegate.create(this, outTranslationIni)
		lv.load(o.prefixDir+"0SA/_0S/Translate/_"+gameLanguage+".ini"); 
		}
		

		
		private function outTranslationIni(translationIni){
		if(!translationIni){
				if(!loadAttempt){
				o.log.addLog("boot", "CFG | translate.xml not found, loading default ENGLISH version...")
				
					loadAttempt = true
					inTranslationIni("english")
				}else{
				o.log.addLog("boot", "CFG | CRITICAL WARNING | Could not find any translation.xml files...")
					o.display.hudDisplayBasicPush("OHudWarning01", "OSA Installation Problem$TX$OSA WAS UNABLE TO BOOT UP!</br><br/>This is a result of conflicting UI mods being installed. Some mods incorrectly interfere with Skyrim's UI and stop other mods from accessing files. Conflicts must be removed to allow OSA to properly start.</br><br/></br><br/>See the OSA Troubleshooting FAQ (Section 2)</br><br/>Code: UIConflict01")
				}
			}
		else{
		o.log.addLog("boot", "CFG | translate.xml has been loaded...")
		
		lang = makeIni(translationIni)
		o.ready.systemReady("translate")
		inTranslationESG(language)
		}
		
		}
		
		public function inTranslationESG(gameLanguage){
		o.log.addLog("boot", "CFG | Loading esg_"+gameLanguage+".ini "+o.prefixDir+"0SA/_0S/Translate/esg_"+gameLanguage+".ini")
		
		var lv = new LoadVars();
		lv.onData = Delegate.create(this, outTranslationESG)
		lv.load(o.prefixDir+"0SA/_0S/Translate/esg_"+gameLanguage+".ini"); 
		}
		
		private function outTranslationESG(translationESGIni){
		if(!translationESGIni){
			o.log.addLog("boot", "CFG | esg_translation.ini not found, loading default ENGLISH version...")
			
			inTranslationESG("english")
		}else{
			o.log.addLog("boot", "CFG | esg_translation.ini document has been found...")
			langESG = makeIni(translationESGIni)
		}		
		
		o.log.addLog("boot", "MAJ | OSA Boot-Up has been completed...")
		
		}

		
		
		
		public function inCustomizerXML(type){
			o.log.addLog("boot", "CFG | Loading customizer_"+type+".xml: "+o.omfixDir+"OSA/util/customizer_"+type+".xml")
		
		var lv = new Load
		lv.callBack = {fn:outCustomizerXML, scope:this}
		lv.args[1] = type
		lv.dir = o.omfixDir+"OSA/util/customizer_"+type+".xml" 
		lv.getDoc()
		}
		
		private function outCustomizerXML(xml, type){
			if(xml){
				o.log.addLog("boot", "CFG | customizer_"+type+".xml has been found...")
				customizer[type] = o.makeEntry(xml)
				customizer[type+"Has"]=true
			}else{
				o.log.addLog("boot", "CFG | customizer_"+type+".xml has not been found. This is an optional document and is not required...")
			}
		
		}
		
		public function makeIni(IniText){
		var parse = new IniParser();
		return parse.parse(IniText)
		}
		
		function saveAll(ix){
			o.log.addLog("boot", "CFG | Save Settings | index: "+ix+"...")
			core.util.specialPanel.onotice(o,"settingsSaved",true,true)
			o.skyStringNum("0SA_Preferences", o.cfg.config.makeSaveString(), Number(10)+Number(ix))
		}
		
		function loadAll(ix){
			o.log.addLog("boot", "CFG | Load Settings | index:"+ix+"...")
			core.util.specialPanel.onotice(o,"settingsLoaded",true,true)
			o.skyStringNum("0SA_Preferences", "", ix)
		}
		
		function loadSkySettings(saveString){
			o.cfg.config.loadSaveString(saveString)
		}
}