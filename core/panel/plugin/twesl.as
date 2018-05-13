

class core.panel.plugin.twesl extends MovieClip
{

public var o
public var m

var slideMenu
var displayMenu
var lock

var header
var offSetX

var module
var pandect
var brass

			public function twesl(){			
			var StartV = 0
			var H = 0
			
			lock = false
			
			if(m.dia){
			module = o.lib.MLib.get(m.dia.module.id) 
			pandect = o.lib.PLib.get(m.dia.module.id) 
			}else{
				module = m.dataPin.module
				pandect = m.dataPin.pandect
			}
			
			
			offSetX = -135
			
			
			var posO = new core.panel.button.positioner()
			posO.vOff = -50
			posO.btWidth = 18		

			brass = new core.panel.major.brass.typeA(o, this, posO, pandect.name+" | "+o.cfg.lang.plugin, "")
			posO.vStart = posO.v
			
				

			slideMenu = this.attachMovie("TwSlideMenu", slideMenu, this.getNextHighestDepth(), {_x:-50, _y:-100});							
			
			slideMenu.opMax = 5
			slideMenu.opSelected = 3
			
			slideMenu.dat[0] = {text1:o.cfg.lang.exit, text2:"", icon:"sp_a_cancel", snd:"cancel", fn:"DN"}

			
			slideMenu.dat[1] = {id:"_pluginChecklist", xPos:offSetX, yPos:-150, text1:"", text2:"", base:"oba_a_bw", icon:pandect.plugin[i].i}
			
			
			
			for (var i=0; i < pandect.plugin.length; i++){
				slideMenu.dat.push({id:"_pluginPromo", plug:pandect.plugin[i],  xPos:offSetX, yPos:-150, text1:"", text2:"", base:pandect.plugin[i]["b"], icon:pandect.plugin[i].i}) 
			}			


			slideMenu.viY[0] = 10
			slideMenu.viY[1] = -75
			slideMenu.viY[2] = -175
			slideMenu.viY[3] = -300
			slideMenu.viY[4] = -425
			slideMenu.viY[5] = -525
			slideMenu.viY[6] = -590
			
			slideMenu.viScale[0] = 110
			slideMenu.viScale[1] = 130
			slideMenu.viScale[2] = 160
			slideMenu.viScale[3] = 230
			slideMenu.viScale[4] = 160
			slideMenu.viScale[5] = 130
		    slideMenu.viScale[6] = 110
			
			slideMenu.menuStyle = "TwSlide_A"
			

			
			slideMenu.create()
			displayMenu = this.attachMovie(slideMenu.hov.dat.id, displayMenu, this.getNextHighestDepth(), {o:o, m:m, dia:m.dia, _x:-140, _y:-100, dat:slideMenu.hov.dat, pandect:pandect, module:module});
			
			}
			
			
		public function rollDisplay(){
			displayMenu.removeMovieClip()
			displayMenu = this.attachMovie(slideMenu.hov.dat.id, displayMenu, this.getNextHighestDepth(), {o:o, m:m, dia:m.dia, _x:-140, _y:-100, dat:slideMenu.hov.dat, pandect:pandect, module:module});
		}
		
		public function DY() : Void{
			if(slideMenu.hov.dat.fn){
			o.xplat.sysoi("shiftm")
			this[slideMenu.hov.dat.fn]()
			}
		}
		
		public function DU() : Void{ 
		if (lock == false){
			lock = true
			slideMenu.SlideUp()
			rollDisplay()
			var time = new Time({fn:unlock, scope:this}, 300)
			
		}
		
		}
 
		public function DD() : Void	{
		if (lock == false){
			lock = true
			slideMenu.SlideDown()			
			rollDisplay()
			var time = new Time({fn:unlock, scope:this}, 300)
		}
		}
		
		public function DN() : Void	{
			o.xplat.sysoi("menuback")
			m.escape()
		}

		
		
		public function unlock(){lock = false}
		
		
}