import skse; 

class core.system.scan
{
	
var o
var mods
var refMod



		public function scan(core){
		o = core
		
		mods = []

		}
		
		public function scanMods(){
			
			o.log.addLog("boot", "\n-------- BEGIN SCAN SCRIPT ------------")
			
			refMod = new Object
			for (var i=0; i < arguments.length; i++){
				
				var incomingData:Array = arguments[i].split(".")
				
				var modData:Array = incomingData[0].split("$")
				
					
					refMod[modData[0]] = new core.system.template.osmod()
					refMod[modData[0]].fill(modData)					
					var L = mods.push(refMod[modData[0]])				
					refMod[modData[0]].index = L-1
					
					o["__"+modData[0]] = Number(1)
					
			}
					o.log.addLog("boot", "SCAN | Module Analysis: "+arguments.length+" module(s) installed...")

					o.sky("OSA_OStart")
					o.log.addLog("boot", "Scan Complete. OSA_OStart event sent...")
					
			trace(mods+" THIS IS MODS")
			trace(refMod["0Sex"].desc)
		}
		
		
		public function scanPlugs(){
			for (var i=0; i < arguments.length; i++){
				
					var incomingData:Array = arguments[i].split(".")
					var plugData:Array = incomingData[0].split("_")
					
					refMod[plugData[0]].plug[plugData[1]] = new Object
					refMod[plugData[0]].plug[plugData[1]] = 1
					
					trace(refMod["0Sex"].plug["BBMF"])
				 	trace(refMod["0Sex"].name)
					
					
			}
					o.log.addLog("boot", "Plugin Analysis: "+arguments.length+" plugin(s) installed...")

		}
		
		public function hasPlugin(moduleName, plugName):Boolean{
			if(refMod[moduleName].plug[plugName]){return true}
			else{return false}
			
		}
		
}