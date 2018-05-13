import gfx.io.GameDelegate;
import gfx.controls.Button;
import skse; 
import XMLParser;
import mx.utils.Delegate;
import skyui.widgets.WidgetBase;
import ODelegate


class SP1 extends MovieClip
{

public var o
public var dia


var pos

var lock

var tabActra = 0

var panel
var ActraSel
var TextPanel
var ctr
var MenuT1
var brass

var currentPanel = 0

var MaxV = 6
var MaxH = 3

var H
var V
var coreSuite

	public function SP1() {

	
	pos = {V:Stage.height-35, H:Stage.width-65}
	
	MenuT1 = []
	panel = []


	coreSuite = {o:o, m:this, dia:dia} 
	
	o.ctr.menuGreet(this, "MuScene")
	ctr = this.attachMovie("SP1Control", "ctr", this.getNextHighestDepth(), {o:o, dia:dia, m:this});
	
	panel[currentPanel] = this.attachMovie("SP1Main", "panel"+currentPanel, this.getNextHighestDepth(), {o:o, m:this, dia:dia, _x:pos.H, _y:pos.V});
	
	brass = this.attachMovie("SP1Brass", "brass", this.getNextHighestDepth(), {_x:pos.H, _y:pos.V});
	
	

	
	OmniDim()
	}
	
	var storePanel 
	
	
	public function advancePanelFade(nextPanel){
	lock = true
	var time = new Time({fn:unlock, scope:this}, 600)	
	storePanel = nextPanel	
	var ballTween = new mx.transitions.Tween(panel[currentPanel], "_alpha", mx.transitions.easing.Strong.easeOut, 100, 0, .3, true);
	var time = new Time({fn:advanceFadeOut, scope:this}, 300)	
	currentPanel += 1
	}
	
	public function advanceFadeOut(){
	panel[currentPanel] = this.attachMovie(storePanel, "panel"+currentPanel, this.getNextHighestDepth(), {o:o, m:this, dia:dia, _x:pos.H, _y:pos.V});	
	var ballTween = new mx.transitions.Tween(panel[currentPanel], "_alpha", mx.transitions.easing.Strong.easeOut, 0, 100, .3, true);
	}
	
	public function unlock(){lock = false}
		
	public function OmniDim(){panel[currentPanel]._alpha = 0, brass._alpha = 0}
	public function OmniLight(){panel[currentPanel]._alpha = 100, brass._alpha = 100}
	
	public function fade(i){
		var ballTween = new mx.transitions.Tween(panel[i], "_alpha", mx.transitions.easing.Strong.easeOut, 100, 0, .5, true);
		//panel[i]._alpha=0
		}
	
	public function dimLast(i){panel[i]._alpha = 0}
	public function lightLast(i){panel[i]._alpha = 100}
	
		public function Escape(){
		if (currentPanel > 0){
		panel[currentPanel].removeMovieClip()
		currentPanel -= 1
		panel[currentPanel]._alpha = 100
		}
		}
		
		
		public function TwAlpha(panelTween, St, En){
			var ballTween = new mx.transitions.Tween(panelTween, "_alpha", mx.transitions.easing.Strong.easeOut, 100, 0, 300, true);
		}
		
		
			
		
		public function DY() : Void{
			if(!lock){panel[currentPanel].DY()}
		}
		
		public function DN() : Void{
			if(!lock){panel[currentPanel].DN()}
		}
		
		public function DU() : Void{
			if(!lock){panel[currentPanel].DU()}
		}

		public function DD() : Void	{
			if(!lock){panel[currentPanel].DD()}
		}
		
		public function DT() : Void	{
			if(!lock){panel[currentPanel].DT()}
		}
	

	public function endMenu(){
		o.ctr.menuOff("MuScene")
		this.removeMovieClip();
	}


	public function FullEscape(){
		var Pans = currentPanel
		for (var i=0; i < Pans; i++){
			panel[currentPanel].removeMovieClip()
			currentPanel -=1
		}
		o.ctr.MainMenu()
	}
	
	public function pushTabActra(){
		tabActra ++
		if(tabActra >= dia.actra.length){tabActra = 0}
		panel[currentPanel].newActraTab()
	}








	

}