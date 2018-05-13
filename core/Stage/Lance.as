

class Lance{
	
var o
var fn
var scope
var dat

		public function Lance(core, func, sco){
			o = core
			fn = func
			scope = sco
			dat = []
		}
		
		function checkScene(destination, module){
			if(!o.lib.SLib.get(destination)){
				o.lib.getOData("S", destination, module, outLance, this)
			}else{
			  	outLance()
			}
		}
		
		function outLance(){
			fn.apply(scope, dat)
			
		}
				
		
		
	
}