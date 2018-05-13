

class core.panel.major.overlay extends MovieClip {


public var o
var panel
var ctr
var dataPin
var currentPanel
var targets

	function overlay(){
        _x = Stage.width - 55
		_y = Stage.height - 50
		
		o.targ.resetTarg()
		o.xplat.sysoi("hello")
		
		targets = []
		
		o.ctr.menuGreet(this, "MuMajor")
		ctr = this.attachMovie("majorControl", "ctr", this.getNextHighestDepth(), {o:o, m:this});
		panel = []
		currentPanel = 0
		panel[currentPanel] = this.attachMovie("majorMain", "panel"+currentPanel, this.getNextHighestDepth(), {o:o,m:this});	
	}	
	
	
	public function OmniDim(){panel[currentPanel]._visible = false}
	public function OmniLight(){panel[currentPanel]._visible = true;o.xplat.sysoi("hello");panel[currentPanel].appear()}
	
	
	
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

	}
	
	public function endMenu(){
		o.ctr.menuOff("MuMajor")
		this.removeMovieClip();
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