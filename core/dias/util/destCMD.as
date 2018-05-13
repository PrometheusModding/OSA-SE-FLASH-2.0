
class core.dias.util.destCMD
{


		
		public static function process(o, dia, command){
			var cmd = command.toLowerCase()
			core.dias.util.destCMD[cmd](o, dia, cmd)
			
		}
		
		public static function $obsexit(o, dia, command){
		dia.exitObserver()
		}
		
		public static function $endscene(o, dia, command){
		dia.endCommand()	
		}
		
		public static function $endsceneandredress(o, dia, command){
		for (var i=0; i < dia.actra.length; i++){
			dia.actra[i].equip.attire.redress()
		}
		dia.endCommand()	
		}
		

}	


