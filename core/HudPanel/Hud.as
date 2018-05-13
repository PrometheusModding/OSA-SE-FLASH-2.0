
class Hud extends MovieClip{

public var o

var NavMenu
var SceneMenu
var MajorMenu
var InspectMenu
var specialPanel
var onotice
var onoticeIx
///500000-600000 reserved for power messages
///500001+9 = specialKeybindNotice
///500010+9 = TextInput
///589900 = onotice 

///589800 = inspect

var sigInspect

		public function Hud(){
			onoticeIx = 0
		}
		
		public function createNav(diasa){
			if(diasa.scene.nav[0]){
			var style = "NP2"
			if(diasa.scene.nav[0].style){style=diasa.scene.nav[0].style}
			NavMenu = this.attachMovie(style, "NavMenu", 300000, {o:o, dia:diasa});
			return NavMenu}
			else{return undefined}
		}
		
		public function removeNav(){
			NavMenu.endMenu()
		}
		
		public function createSceneMenu(diasa){
			SceneMenu = this.attachMovie("sceneOverlay", "SceneMenu", 200000, {o:o, dia:diasa});
			if(MajorMenu){MajorMenu.endMenu()}
			if(InspectMenu){InspectMenu.endMenu()}
			return SceneMenu
		}
		
		public function removeScene(superEnd){
			SceneMenu.endMenu(superEnd)
		}
		

	
		function createMajorMenu(){
			MajorMenu = this.attachMovie("majorOverlay", "MajorMenu", 100000, {o:o});
		}
		
		public function removeMajor(){
			MajorMenu.endMenu()
		}
		
		function createInspectMenu(actraID){
			if(sigInspect){
				sigInspect.removeMovieClip()
			}
			InspectMenu = this.attachMovie("inspectOverlay", "InspectMenu", 400000, {o:o, actra:o.actro.get(actraID)});
		}
		
		public function removeInspect(){
			InspectMenu.endMenu()
		}

		function clearONotice(ix){
			if(onoticeIx = ix){
				onotice.removeMovieClip()
			}
		}
		
		function addSigInspect(actraName){

			if(!o.ctr.globalPause){
				if(InspectMenu){
				removeInspect()
				}
			
					if(o.ctr.MuNavON == true || o.ctr.MuSceneON == true){
										
					}else{
							if(InspectMenu){
							removeInspect()
							}
						sigInspect = this.attachMovie("inspecting", "sigInspect", 589800, {o:o, actraName:actraName});
			
					}
			}
		}

}