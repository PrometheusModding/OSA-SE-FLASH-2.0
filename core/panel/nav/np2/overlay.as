

class core.panel.nav.np2.overlay extends MovieClip {


public var o
public var dia
var xml
var frame

var panel
var ctr

var beaconSpeed
var replacerMenu

var rebuildArr

	function overlay(){
		trace("--------------------------------------------------------------------------------------- NEW SCENE "+dia.scene.id)

		
		rebuildArr = []
		
		o.ctr.menuOn(this, "MuNav")				
		xml = dia.scene.nav[0]

		frame = "onav"
		if(xml.frame){frame = xml.frame}
		panel = this.attachMovie(frame+"_frame", "navPanel", this.getNextHighestDepth(), {o:o,m:this});		
		
		
		
		
		//OmniDim()
	}	
	
	
	public function dim(){panel._visible = false}
	public function light(){panel._visible = true}
	
	
	
	
	function rebuildIcos(){
		for (var i=0; i < rebuildArr.length; i++){	
			rebuildArr[i].rebuild()
			}
	}
	
	public function endMenu(){	
		panel.endMenu()
		o.ctr.menuOff("MuNav")
		ctr.removeMovieClip();
		this.removeMovieClip();
	}
	
	public function updateSpeedText(speedUnit){
		if(speedUnit.mtx){
			var newText
			if(speedUnit.mtx.charAt(0)=="^"){newText = core.panel.nav.np2.util.func.translateDesc(o, dia, speedUnit.mtx.substr(1), speedUnit)}	
			if(speedUnit.qnt){beaconSpeed.updateText(speedUnit.qnt+" "+newText)}
			else{beaconSpeed.updateText(newText)}
		}
	}
	
	function addReplacerMenu(repType,f,g, x){
		dim()
		replacerMenu = this.attachMovie("rep_"+repType, "replacer", this.getNextHighestDepth(), {o:o,m:this,f:f,g:g,x:x});
		ctr.activeMenu = replacerMenu
	}
	
	function endReplacerMenu(){
		replacerMenu.removeMovieClip()
		ctr.activeMenu = undefined
		light()
	}

		
		
	
	

}