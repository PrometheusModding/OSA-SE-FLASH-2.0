
class core.dias.logData
{
	
var o
var dia

var full
var boot
var run
var mnu
var nav
var anav

		public function logData(om, dias){
		o = om
		dia = dias		
		full = "OSA STAGE LOG | FULL\n"
		boot = "OSA STAGE LOG | BOOT\n"
		run = "OSA STAGE LOG | PROCESS\n"
		mnu = "OSA STAGE LOG | MENU\n"
		nav = "OSA STAGE LOG | NAVIGATION\n"
		anav = "OSA STAGE LOG | AUTO-NAVIGATION\n"
		}
		
		function addLog(log, logText){
				this[log] += logText+"\n"
				full += logText+"\n"
		}
		
		
		function printLog(logType){
			
			var logTitle = "UNKNOWN"
			if(logType=="full"){logTitle = "FULL"}			
			else if(logType=="run"){logTitle = "PROCESS"}
			else if(logType=="boot"){logTitle = "BOOT"}
			else if(logType=="mnu"){logTitle = "MENU"}
			else if(logType=="nav"){logTitle = "NAVIGATION"}
			else if(logType=="anav"){logTitle = "AUTONAV"}
			
			var sendString="STAGE_"+dia.id+"_"+logTitle+"$#$#$"+this[logType]
			
			o.skyString("OSA_OutputLog", sendString)
		}

}


