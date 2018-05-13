

class core.system.logData{

var o
var maj
var sys
var hot
var full
var boot
var run
var stg
var trg
var war

var callBack


		function logData(core){
			o = core
			sys = "No system scan has been run yet. Press YES to scan..."
			run = "OSA SYSTEM | PROCESS\n"
			boot = "OSA SYSTEM | BOOTUP LOG\n"
			full = "OSA SYSTEM | FULL LOG\n"
			stg = "OSA SYSTEM | STAGE LOG\n"
			trg = "OSA SYSTEM | TARGET LOG\n"
			hot = "OSA SYSTEM | HOT LOG\n"
			war = "OSA SYSTEM | WARNING LOG\n"
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
			else if(logType=="stage"){logTitle = "STAGE"}
			else if(logType=="trg"){logTitle = "TARGET"}
			else if(logType=="hot"){logTitle = "HOT"}
			else if(logType=="war"){logTitle = "WARNING"}
			
			var sendString="OSA_"+logTitle+"$#$#$"+this[logType]
			
			o.skyString("OSA_OutputLog", sendString)
		}
		
		function systemReport(sysLog){
			sys	= ""
			sys +="\n Begin System Analysis..."
			sys +="\n ------------------------"
			sys	+="\n Skyrim Analysis..."
			sys +="\n Client Language: "+sysLog[1]
			sys +="\n Code Page set in cpconvert.ini: "+sysLog[2]
			if(sysLog[3] == 1){
			sys +="\nVanilla skeleton installed is an XPMS Variant..."
			}else{
			sys +="\nVanilla skeleton installed is NOT an XPMS Variant..."
			}
			sys +="\n"
			sys	+="\n OSA Analysis..."
			sys +="\n ------------------------"
			sys	+="\n OSA UI Version: "+o.ver
			sys	+="\n OSA Script Version: "+sysLog[10]
			sys	+="\n OSA Script Bracket: "+sysLog[11]
			sys	+="\n OSA Script Increment Version: "+sysLog[12]
			sys	+="\n OSA DLL version: "+sysLog[13]
		
			sys +="\n"
			sys	+="\n SKSE Analysis..."
			sys +="\n ------------------------"
			
			sys	+="\n SKSE Plugin Version: "+sysLog[20]
			sys	+="\n SKSE Release Version: "+sysLog[26]
			sys	+="\n Chargen Version: "+sysLog[21]
			sys	+="\n CPConvert DLL Version: "+sysLog[22]
			sys	+="\n PapyrusUtil DLL Version: "+sysLog[23]
			sys	+="\n PapyusUtil Script Version : "+sysLog[24]
			sys	+="\n NiOverride DLL Version: "+sysLog[25]
			sys	+="\n NiOverride Script Version: "+sysLog[26]
			sys	+="\n MFGConsole DLL Version: "+sysLog[27]
			if(sysLog[27]!= -1){sys +="\n SOS DLL Version: "+sysLog[28]}
			
			
			if(sysLog[40]!= -1){sys +="\n CrashFix DLL Version: "+sysLog[40]}
			if(sysLog[41]!= -1){sys +="\n HDTHeels DLL Version: "+sysLog[41]}
			if(sysLog[42]!= -1){sys +="\n HDTPhysicsExtnsion DLL Version: "+sysLog[42]}
			if(sysLog[43]!= -1){sys +="\n HDTSkinnedMeshPhysics DLL Version: "+sysLog[43]}
			if(sysLog[44]!= -1){sys +="\n HDTMemPatch DLL Version: "+sysLog[44]}
			if(sysLog[45]!= -1){sys +="\n OneTweak DLL Version: "+sysLog[45]}
			if(sysLog[46]!= -1){sys +="\n Saftey Load DLL Version: "+sysLog[46]}
			if(sysLog[47]!= -1){sys +="\n PreCacheKiller DLL Version: "+sysLog[47]}
			if(sysLog[48]!= -1){sys +="\n SkyrimReloaded DLL Version: "+sysLog[48]}
			
			sys +="\n"
			sys	+="\n System Scan Complete..."
			
			
			if(callBack){
				callBack.fn.apply(callBack.scope)
			}
		}
			
}