

class core.panel.nav.np2.onav.x.speed.main extends MovieClip {

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
		arr.push(this.attachMovie("onavx_speedoption", "plusico", this.getNextHighestDepth(), {o:o,m:m,f:f,x:x,_y:v,_x:h, _xscale:60, _yscale:60}))
		arr[0].minus()
		arr[0].dim()
		h += 40		
		arr.push(this.attachMovie("onavx_speedoption", "plusico", this.getNextHighestDepth(), {o:o,m:m,f:f,x:x,_y:v,_x:h, _xscale:60, _yscale:60}))
		arr[1].plus()
		arr[1].dim()
		outV = -35
		
		speedText = this.attachMovie("textboxl", "plusico", this.getNextHighestDepth(), {o:o,m:m,f:f,x:x,_y:v-2,_x:h+20})
		
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
	
			function openMenu(){
				lightCur()
			}
			
			function closeMenu(){
				dimCur()
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
				m.dia.scena.speedAdjust(arr[point].output.amount, arr[point].output.role, arr[point].output.ix)
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
				}else{	f.inputSnd("blocks")}
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