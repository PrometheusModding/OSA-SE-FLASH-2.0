

class core.panel.nav.np2.onav.x.auxbar.main extends MovieClip {

public var o
public var m
public var f
public var x
var parentTab

var outV

var point

var arr

var speedText

var _fontSpeed

function main(){
		
		point = 0
		arr = []
		_y -= 20
		var v = 0
		var h = 19
		
		var __arr
		for (var i=0; i < x.aux.length; i++){		
			__arr  = this.attachMovie("onavx_auxbaroption", "plusico", this.getNextHighestDepth(), {o:o,m:m,f:f,x:x.aux[i],_y:v,_x:h})
			h+=25
			arr.push(__arr)
		}
		

		outV = -35
		
		
				_fontSpeed = new TextFormat();
				_fontSpeed.letterSpacing = .8
				_fontSpeed.font = o.fonts.l
				_fontSpeed.color = "0x"+"FFFFFF"
				_fontSpeed.size = 8	
				
				
		m.beaconSpeed = this
		updateText("")
		
		
	}	
	
	
			function updateText(newText){							
				speedText.val.htmlText = newText
				speedText.val.setTextFormat(_fontSpeed);
				speedText.val.autoSize = "left";
			}
	
			function lightCur(){
			arr[point].light()
			
			}
			
			function dimCur(){
				arr[point].dim()
			}
			
			function DY(){
				arr[point].clickFX()
				f.inputSnd("confirms")
				m.dia.scena.speedAdjust(arr[point].output)
			}
			
			function DT(){
				if(f.tab.length > 1){m.ctr.goTog()}
				else{f.inputSnd("blockm")}
			}
			
			function DN(){
				f.inputSnd("blocks")
			}
			
			function DU(){
				parentTab.upXM()
			}
			
			function DD(){
				parentTab.dnXM()
			}
			
			function DL(){
				if(arr[point-1]){
					arr[point].dim()
					point--
					arr[point].light()
					f.inputSnd("movex")
				}else{f.inputSnd("blocks")}
			}
			
			function DR(){
				if(arr[point+1]){
					arr[point].dim()
					point++
					arr[point].light()
						f.inputSnd("movex")
				}else{	f.inputSnd("blocks")}
			}
	
	
		

}