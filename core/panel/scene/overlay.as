

class core.panel.scene.overlay extends MovieClip {


public var o
public var dia
var panel
var ctr
var dataPin
var currentPanel
var targets

var actra
var tabActra
var sceneMode

	function overlay(){
        _x = Stage.width - 55
		_y = Stage.height - 50
		sceneMode = true		
		tabActra = 0
		actra = dia.actra[tabActra]
		
		targets = []
		
		o.ctr.menuGreet(this, "MuScene")
		ctr = this.attachMovie("sceneControl", "ctr", this.getNextHighestDepth(), {o:o, m:this});
		
		
		panel = []
		currentPanel = 0
		panel[currentPanel] = this.attachMovie("sceneMain", "panel"+currentPanel, this.getNextHighestDepth(), {o:o,m:this});	
		
		
		OmniDim()
	}	
	
	
	public function OmniDim(){panel[currentPanel]._visible = false}
	public function OmniLight(){panel[currentPanel]._visible = true;o.xplat.sysoi("hello");panel[currentPanel].appear()}
	
	
	function pushActra(){
		tabActra ++
		if(tabActra >= dia.actra.length){tabActra = 0}
		actra = dia.actra[tabActra]
		panel[currentPanel].newActra()
	}
	
	public function advancePanelFade(nextPanel){
	panel[currentPanel]._visible = false
	currentPanel += 1
	panel[currentPanel] = this.attachMovie(nextPanel, "panel"+currentPanel, this.getNextHighestDepth(), {o:o, m:this});
	}
	
		public function escape(){
		if (currentPanel > 0){
		panel[currentPanel].removeMovieClip()
		currentPanel -= 1
		panel[currentPanel]._visible = true
		panel[currentPanel].revisit()
		}
		}
		
	public function FullEscape(){
		var Pans = currentPanel
		for (var i=0; i < Pans; i++){
			panel[currentPanel].removeMovieClip()
			currentPanel -=1
		}
		o.ctr.menuOff("MuScene")

	}
	
	public function endMenu(superEnd){
		o.ctr.menuOff("MuScene", superEnd)
		OmniDim()
	}
	
		
		public function DY() : Void{
			panel[currentPanel].DY()
		}
		
		public function DN() : Void{
			panel[currentPanel].DN()
		}
		
		public function DU() : Void{
			panel[currentPanel].DU()
		}

		public function DD() : Void	{
			panel[currentPanel].DD()
		}
		
		public function DL() : Void{
			panel[currentPanel].DL()
		}

		public function DR() : Void	{
			panel[currentPanel].DR()
		}
		
		public function DT() : Void	{
			panel[currentPanel].DT()
		}
	
	

}