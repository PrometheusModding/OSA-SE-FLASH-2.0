

class core.panel.nav.np2.onav.x.cabinet.main extends MovieClip {

public var o
public var m
public var f
public var x
var parentTab

var outV

var point

var arr
var crown
var cabinet
var cabinetX
var _fontSpeed
var textBox
var descBox
var titleText

var pTw
var aTw

var title


		function main(){
		
		point = 0
		arr = []
		_y -= 20
		
		
		
		var v = 0
		var h = 19
		
		
		
	
		crown = this.attachMovie(core.panel.nav.np2.util.func.iconCmd(x.icon.toLowerCase(), o, m), "plusico", this.getNextHighestDepth(), {_y:v,_x:h,_xscale:60, _yscale:60})
		
		if(x.ihue[0]){				
					for (var i=0; i < x.ihue.length; i++){					
					core.panel.nav.np2.util.func.hueFormCmd(x.ihue[i], crown, o, m)
					}
					}
		
		textBox = this.attachMovie("textboxl", "plusico", this.getNextHighestDepth(), {o:o,m:m,f:f,x:x,_y:v-2,_x:h+15})
		
		titleText = ""
		if(x.text){
			if(x.text.charAt(0)=="^"){titleText = core.panel.nav.np2.util.func.translateDesc(o, m.dia, x.text.substr(1), x)}
			else{titleText = x.text}
		}
		
		
		
		cabinet = this.createEmptyMovieClip("cabinet", this.getNextHighestDepth())
		cabinet._visible = false
		cabinetX = cabinet._x
		h+=30
		
		for (var i=0; i < x.option.length; i++){		
			var __arr  = cabinet.attachMovie("onavx_cabinetoption", "plusico", cabinet.getNextHighestDepth(), {o:o,m:m,f:f,par:this,x:x.option[i],_y:v,_x:h})
			h+=25
			
			
			if(x.option[i].type){
				if(x.option[i].type=="selected"){					
					__arr.ico.Y._alpha = 100
				}			
			}else{
				arr.push(__arr)
			}
		}
		descBox = cabinet.attachMovie("textboxl", "plusico", cabinet.getNextHighestDepth(), {o:o,m:m,f:f,x:x,_y:v-2,_x:h-5})

		outV = -35
		
		
				_fontSpeed = new TextFormat();
				_fontSpeed.letterSpacing = .6
				_fontSpeed.font = o.fonts.l
				_fontSpeed.color = "0x"+"FFFFFF"
				_fontSpeed.size = 8	
				
		
		updateText(titleText)
		
		if(x["title"]){
			title = x.title
			if(x.title.charAt(0)=="^"){title = core.panel.nav.np2.util.func.translateDesc(o, m.dia, x.title.substr(1), x)}			
		}		
		
		pTw = new mx.transitions.Tween(cabinet, "_x", mx.transitions.easing.None.easeNone, cabinetX, cabinetX-25, .1, true);
		aTw = new mx.transitions.Tween(cabinet, "_alpha", mx.transitions.easing.Strong.easeOut, 100, 0, .3, true);	
		pTw.stop()
		pTw.stop()
		pTw.fforward()
		pTw.fforward()
		
		
		
		
	}	
	
	
			function updateText(newText){							
				textBox.val.htmlText = newText
				textBox.val.setTextFormat(_fontSpeed);
				textBox.val.autoSize = "left";
			}
	
			function updateDesc(newText){
				descBox.val.htmlText = newText
				descBox.val.setTextFormat(_fontSpeed);
				descBox.val.autoSize = "left";
			}
			
			function openMenu(){				
				openFX()
				lightCur()
			}
			

			function openFX(i){
				cabinet._visible = true
				textBox._visible = false
				pTw.yoyo()
				aTw.yoyo()
				
			}
			
			function closeMenu(){
				textBox._visible = true
				pTw.yoyo()
				aTw.yoyo()
			}
			
			function lightCur(){
			arr[point].light()
			
			}
			
			function dimCur(){
				arr[point].dim()
			}
			
			function DY(){
			f.inputSnd("confirmm")
			if(arr[point].cmd){
			core.panel.nav.np2.util.optionOutput[arr[point].cmd.toLowerCase()](o, m, f, this, arr[point].x.cmd[0])
			}
			else{m.ctr.outputMenuSelection(arr[point], arr[point].x)}		
			}
			
			function DT(){
				if(f.tab.length > 1){m.ctr.goTog()}
				else{f.inputSnd("blockm")}
			}
			
			function DN(){
					f.inputSnd("moves")
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
				}else{f.inputSnd("blocks")}
			}
	
	
		

}