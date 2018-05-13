
class TwSlideMenu extends MovieClip
{
	

public var dat

public var o
var dia
var inject

var menuStyle

var opLength
var viY
var viScale
var opTop
var opMax
var slideBT
var opVisible
var opSelected

var hov


			public function TwSlideMenu(){
			opTop = 0
			slideBT =[]
			opVisible =[]
			viY = []
			viScale = []
			dat = []
			
			}
			
			public function create(){
	
			
			opLength = dat.length
			
			for (var i=0; i < opLength; i++){	
				if(dat[i].menuStyle){
				slideBT[i] = this.attachMovie(dat[i].menuStyle, slideBT[i], this.getNextHighestDepth(), {dat:dat[i], o:_parent.o, dia:dia, inject:inject});
				}else{
				slideBT[i] = this.attachMovie(menuStyle, slideBT[i], this.getNextHighestDepth(), {dat:dat[i], o:_parent.o, dia:dia, inject:inject});
				}
			slideBT[i]._alpha = 0
			hov = slideBT[opSelected]
			}
			
			
			for (var i=opTop; i <= opTop+opMax; i++){
				slideBT[i]._alpha = 100
				slideBT[i]._y = viY[i] 
				slideBT[i]._xscale = viScale[i] 
				slideBT[i]._yscale = viScale[i] 
			}
			slideBT[opTop]._alpha = 0

			shiftVisible()
			slideBT[opVisible[opSelected]].light()
			}
			
			public function shiftVisible(){
			for (var i=0; i <= opMax; i++){
			if (opTop+i >= opLength){
			opVisible[i] = (opTop+i) % opLength
			}else{
			opVisible[i] = opTop+i
			}
			}
			}
			
			public function SlideUp(){
			slideBT[opVisible[1]].TwAlpha(100,0)
			slideBT[opVisible[1]].TwMoV(viY[1], viY[0])
			slideBT[opVisible[1]].TwScl(viScale[1], viScale[0])
			slideBT[opVisible[opSelected]].dim()			
			opTop+=1
			if (opTop >= opLength){opTop = 0}

					
			shiftVisible()

			slideBT[opVisible[0]]._alpha = 0
			slideBT[opVisible[opMax]].TwAlpha(0, 100)
			
			for (var i=1; i <= opMax; i++){
				slideBT[opVisible[i]].TwMoV(viY[i+1], viY[i])
				slideBT[opVisible[i]].TwScl(viScale[i+1], viScale[i])
			}		
			slideBT[opVisible[opSelected]].light()
	
			
			hov = slideBT[opVisible[opSelected]]
			
			}
			


			
			public function SlideDown(){			
			slideBT[opVisible[opMax]].TwAlpha(100,0)
			slideBT[opVisible[opMax]].TwMoV(viY[opMax], viY[opMax+1])
			slideBT[opVisible[opMax]].TwScl(viScale[opMax], viScale[opMax+1])
			slideBT[opVisible[opSelected]].dim()			
			opTop-=1
			if (opTop < 0){opTop = opLength-1}

					
			shiftVisible()

			slideBT[opVisible[0]]._alpha = 0
			slideBT[opVisible[1]].TwAlpha(0, 100)
			
			for (var i=1; i <= opMax; i++){
				slideBT[opVisible[i]].TwMoV(viY[i-1], viY[i])
				slideBT[opVisible[i]].TwScl(viScale[i-1], viScale[i])
			}		
			slideBT[opVisible[opSelected]].light()
			
			hov = slideBT[opVisible[opSelected]]
			}
			
	
			
	


}