

class core.system.ready
{
	
var o
var translate
var config


		public function ready(core){
		o = core
		translate = false
		config = false
		}
		
		function systemReady(section){
		this[section.toLowerCase()] = true

			//if(translate && config){
				//skse.SendModEvent("0SA_UIReady", String(o.cfg.lang.codePage))
			//}
			
		}
		
		
		
}