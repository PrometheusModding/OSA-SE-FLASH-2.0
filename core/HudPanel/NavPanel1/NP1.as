

class NP1 extends MovieClip
{

public var o
public var dia

var Panel
var TextPanel
var ctr



var MaxV = 6
var MaxH = 3

var speedText
var fontSpeed

var barcode

	public function NP1() {

	
	fontSpeed = new TextFormat();
	fontSpeed.letterSpacing = 1.0
	fontSpeed.font = o.fonts.m
	fontSpeed.size = 8
		
	barcode = dia.scene.id
	
	var pos = {H:15, V:Stage.height-75}
	
	ctr = this.attachMovie("NP1Control", "ctr", this.getNextHighestDepth(), {o:o, m:this, dia:dia});

	o.ctr.menuOn(this, "MuNav")


	Panel = this.attachMovie("NP1Actra", "Panel", this.getNextHighestDepth(), {o:o, m:this, dia:dia, position:pos});


	TextPanel = this.attachMovie("NP1Text", "MainText", this.getNextHighestDepth(), {o:o, m:this, dia:dia, position:pos});
	
	
	ctr.Init()
	ctr.updateActraText()
	ctr.updateDesc()
	}
	
	public function endMenu(){
		dia.navStorage = {has:true, cmd:[], actor:Panel["AG"+ctr.SelActra].actraRole}		
		dia.navStorage.cmd.push("$saveactor")
		o.ctr.menuOff("MuNav")
		this.removeMovieClip();
	}
	

	function updateSpeedText(speedTextUnit){
		
				
		if(speedTextUnit.mtx){
			
		var displayText = speedTextUnit.mtx
		
		if(o.lib.lang[dia.module.id].user[displayText]){
			displayText = core.util.syntax.SynDesc(o, o.lib.lang[dia.module.id].user[displayText], speedTextUnit, o.lib.lang[dia.module.id], dia.actra)
			}else if(o.lib.lang[dia.module.id]["default"][displayText]){
			displayText = core.util.syntax.SynDesc(o, o.lib.lang[dia.module.id]["default"][displayText], speedTextUnit, o.lib.lang[dia.module.id], dia.actra)
			}else{displayText = ""}
		
		if(speedTextUnit.qnt){
			displayText= speedTextUnit.qnt+" "+displayText
		}
		speedText.htmlText = displayText
		speedText.setTextFormat(fontSpeed);
		speedText.autoSize = "left";
		
		}else{
		speedText.htmlText = ""	
		}
	}







}