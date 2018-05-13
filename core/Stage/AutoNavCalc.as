
class AutoNavCalc
{


		
		public static function analyzePath(nav){
		navMajor(nav)	
		}
		
		public static function directify(ID){
			var Segment = ""
			var Ser
			var lastSer = 0
			Ser = ID.indexOf("|", lastSer)
			lastSer = Ser+1
			Ser = ID.indexOf("!", lastSer)
			while (Ser != -1){
			Segment += ID.substring(lastSer, Ser)
			lastSer = Ser+1
			Ser = ID.indexOf("!", lastSer)		
			}
			Ser =  ID.indexOf("|", lastSer)
			Segment += ID.substring(lastSer, Ser)		
			var fam = Segment
			lastSer = Ser+1
			Ser = ID.indexOf("|", lastSer)
			var ori = ID.substring(lastSer, Ser)
			lastSer = Ser+1
			var loc = ID.substring(lastSer)
		
			return {fam:fam, ori:ori, loc:loc}
		}
		
		public static function navMajor(nav){		
		if (nav.cScene.scene.region[0].maj != nav.dScene.scene.region[0].maj){
				return navOutput("maj", nav)
			}else{
				return navMinor(nav)
			}
		}
		
		public static function navMinor(nav){		
		if (nav.cScene.scene.region[0].min != nav.dScene.scene.region[0].min){
				return navOutput("min", nav)
			}else{
				return navFamily(nav)
			}
		}
		
		
		

		
		
		
		public static function navFamily(nav){	
		if (nav.cScene.fam != nav.dScene.fam){subnavOutput("fam", nav)}else{navOrientation(nav)}}
		
		public static function navOrientation(nav){		
		if (nav.cScene.ori != nav.dScene.ori){subnavOutput("ori", nav)}else{navLocation(nav)}}
		
		public static function navLocation(nav){		
		if (nav.cScene.loc != nav.dScene.loc){subnavOutput("loc", nav)}else{navComplete(nav)}}		

		public static function navOutput(range, nav){
		outputPath(nav, nav.cScene.scene.autonav[0][range][0][nav.dScene.scene.region[0][range]])		
		}
		
		public static function subnavOutput(range, nav){
		outputPath(nav, nav.cScene.scene.autonav[0][range][0][nav.dScene[range]])		
		}
		
		public static function navComplete(nav){
			nav.core.autonav.agendaCompleted()
		}
		
		public static function outputPath(nav, pathID){
		if(pathID){
				if(pathID.substring(0,1) == "!"){
					if(pathID.substring(1,2) == "r"){
					trace("THIS IS MY NAV TEST:"+pathID.substr(2))
					pathID = String(nav.cScene.scene.autonav[0].ref[0][pathID.substring(2)])
					}
				}
			
				nav.core.autonav.nextMove(String(pathID))
			}
		else{
			nav.core.autonav.nextMove(String(nav.cScene.scene.autonav[0].hub[0].b))
			}		
		}
		
}	


