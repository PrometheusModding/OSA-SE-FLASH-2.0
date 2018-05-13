class XMSpeed extends MovieClip
{


public var o
public var m
public var dia
public var position

var pos

public var Suite
public var XPack


public var Actra
public var actraRole
public var Path

var SpMax
var SpMin

var BT = []
var BTCount = 0

var ctr
var textBox
var Text

			public function XMSpeed(){
			pos = {H:position.H, V:position.V}
			}
			
			public function startMenu():Number{
			var VAdj
			for (var i=0; i < dia.scene.speed.length; i++) {
				if (dia.scene.speed[i].a == actraRole){
				VAdj = buildMenu(dia.scene.speed[i])} 
			}
			return VAdj		
			}
			
			public function buildMenu(SP): Number{
			SpMax = SP.max
			SpMin = SP.min

			ctr = this.attachMovie("XMSpeedControl", "ctr", this.getNextHighestDepth(), {o:o, m:m, dia:dia,XPack:XPack,SP:SP,Minu:this});

			
			BT[BTCount] = this.attachMovie("XMSpeedBT", "minus", this.getNextHighestDepth(), {o:o, m:this, dia:dia,_x:pos.H+5,_y:pos.V,SP:SP,CMD:"minus"});

			pos.H+=35
			BTCount ++;
			
			BT[BTCount] = this.attachMovie("XMSpeedBT", "plus", this.getNextHighestDepth(), {o:o, m:this, dia:dia,_x:pos.H+5,_y:pos.V,SP:SP,CMD:"plus"});
			
			pos.H+=25
			BTCount ++;
			
			
			m.speedText = this.attachMovie("XMSpeedTx", textBox, this.getNextHighestDepth(), {_x:pos.H,_y:pos.V}).txt
			m.speedText.htmlText = ""
		

			var VAdj = -35
			
			ctr.Init()
			
			
			return VAdj				
			}
			
			function dimText() {
			textBox._alpha = 0	
			}
			
			function lightText() {
			textBox._alpha = 100
			}
			
			

}