import skse;

class core.actor.logData
{
	
var o
var actra

var esg
var gen
var full
var pro
var prs
var bod
var gfx

		public function logData(om, act){
		o = om
		actra = act		
		full = "OSA ACTOR LOG | FULL LOG\n"
		esg = "OSA ACTOR LOG | ESG\n"
		gen = "OSA ACTOR LOG | GENERAL\n"
		pro = "OSA ACTOR LOG | PROFILE\n"
		prs = "OSA ACTOR LOG | PERSONA\n"
		bod = "OSA ACTOR LOG | BODY\n"
		gfx = "OSA ACTOR LOG | GFX\n"
		}
		
		function addLog(log, logText){
				this[log] += logText+"\n"
				full += logText+"\n"
		}
		
		function printLog(logType){
			
			var logTitle = "UNKNOWN"
			if(logType=="full"){logTitle = "FULL"}			
			else if(logType=="esg"){logTitle = "ESG"}
			else if(logType=="gen"){logTitle = "GENERAL"}
			else if(logType=="pro"){logTitle = "PROFILE"}
			else if(logType=="prs"){logTitle = "PERSONA"}
			else if(logType=="bod"){logTitle = "BODY"}
			else if(logType=="gfx"){logTitle = "GFX"}
			
			var sendString="Actor_"+actra.name+"_"+actra.id+"_"+logTitle+"$#$#$"+this[logType]
			
			o.skyString("OSA_OutputLog", sendString)
		}

}


