import mx.utils.Delegate;

class ConfigEsg
{
	
var o
var dat

var esgLib


		public function ConfigEsg(core){
			o = core
			dat = new Object
			esgLib = new Object			
		}
		
		
		function buildESG(dataString, gen){
		
		var dataArray = dataString.split("!");
		
		var esgData = dataArray[0].split(",")
		var esgExclude = dataArray[1].split(",")
			
		var tempPost = new Object
		esgLib[gen] = []
		esgLib[gen].li = []
		esgLib[gen].esg = new Object
		esgLib[gen].slot = []
		
		esgLib[gen+"ex"] = []
		
		
			for (var i=0; i < 32; i++){
				
				if(esgData[i] != "x"){
					if (!esgLib[gen].esg[esgData[i]]){esgLib[gen].esg[esgData[i]] = []}
					esgLib[gen].esg[esgData[i]].push(i)
					
					esgLib[gen].slot[i] = esgData[i]
					
							if(!tempPost[esgData[i]])
							{		
							tempPost[esgData[i]] = new Object
							esgLib[gen].li.push(esgData[i])
							}		
					
				}
			}
			
			for (var i=0; i < esgExclude.length; i++){
				esgLib[gen+"ex"].push(esgExclude[i]-30)
			}
			//trace("ESG type test:"+esgLib[gen].esg.intlow)
			//trace("List Test"+esgLib[gen].li)
			//trace("List Test"+esgLib[gen].slot[15])			
			//trace("Get Test ESG: "+getEsg(15, 0))
			//trace("Get Test SLOT: "+getSlots("intlow", 1))
		}
		
		function isEsgExclude(slot, gender){
			var exclude = false
			for (var i=0; i < esgLib[gender+"ex"].length; i++){
				if(slot == esgLib[gender+"ex"][i]){exclude = true}
			}
			return exclude
		}
		
		function getEsg(slot, gender){
			return esgLib[gender].slot[slot]
		}
		
		function getEsgName(esgType, gender){	
			if(gender == "1"){return o.cfg.langESG[esgType+"CategoryFemale"]}		
			else{return o.cfg.langESG[esgType+"CategoryMale"]}				
		}
		
		function getSlots(esg, gender){
			return esgLib[gender].esg[esg]
		}
		
}


