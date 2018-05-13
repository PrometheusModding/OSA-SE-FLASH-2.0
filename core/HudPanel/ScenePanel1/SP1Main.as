

class SP1Main extends MovieClip
{

public var o
public var m
public var dia

var slideMenu
var lock = false

var header

			public function SP1Main(){			
			var StartV = 0
			var H = 0

					
			slideMenu = this.attachMovie("TwSlideMenu", slideMenu, this.getNextHighestDepth(), {_x:-50, _y:-100});							
			
			slideMenu.opMax = 5 
			slideMenu.opSelected = 2
			
			slideMenu.dat.push({txt:o.cfg.lang.navigate.toUpperCase(), fn:"nextMenu", snd:"advance", out:"SP1Nav"}) 
			slideMenu.dat.push({txt:o.cfg.lang.roulette.toUpperCase(), fn:"nextMenu", snd:"advance", out:"SP1Roulette"}) 
			slideMenu.dat.push({txt:o.cfg.lang.arrange.toUpperCase(), fn:"arrangeActors", snd:"confirm", out:""})
			slideMenu.dat.push({txt:o.cfg.lang.equipment.toUpperCase(), fn:"nextMenu", snd:"advance", out:"SP1Equip"}) 
			slideMenu.dat.push({txt:o.cfg.lang.lights.toUpperCase(), fn:"nextMenu", snd:"advance", out:"SP1Lights"})
			slideMenu.dat.push({txt:o.cfg.lang.info.toUpperCase(), fn:"nextMenu", snd:"advance", out:"SP1Info"}) 
			//slideMenu.dat.push({txt:"STATS", out:""}) 
			//slideMenu.dat.push({txt:"RECORDS", out:""}) 
			//slideMenu.dat.push({txt:"DEV", fn:"nextMenu", out:""})
			//slideMenu.dat.push({txt:"MAIN MENU", fn:"nextMenu", out:""})
			
			slideMenu.viY[0] = 0
			slideMenu.viY[1] = -45
			slideMenu.viY[2] = -90
			slideMenu.viY[3] = -135
			slideMenu.viY[4] = -180
			slideMenu.viY[5] = -225
			slideMenu.viY[6] = -270
		    slideMenu.viY[7] = -315
			slideMenu.viY[8] = -360
			
			slideMenu.viScale[0] = 100
			slideMenu.viScale[1] = 100
			slideMenu.viScale[2] = 130
			slideMenu.viScale[3] = 100
			slideMenu.viScale[4] = 100
			slideMenu.viScale[5] = 100
		    slideMenu.viScale[6] = 100
			
			slideMenu.menuStyle = "TwSlide_Text"
			

			
			slideMenu.create()
			
			}
			
			
		
		public function DY() : Void{
			if(slideMenu.hov.dat.fn){
			o.sys.playInputSound(slideMenu.hov.dat.snd)
			this[slideMenu.hov.dat.fn]()
			}
			
		}
		
		public function arrangeActors(){
			o.sys.playInputSound("shift")
			dia.arrangeActra()
		}
		
		public function nextMenu(){
			analyzePandect()
		}
		
		function analyzePandect(){
			if(!o.lib.PLib.get(dia.module.id)){
				var scout = new Scout(o)
				var sourceBack = {fn:outPandect, scope:this}
				scout.checkPandect(dia.module.id, sourceBack)
				
			}else{outPandect()}
		}
		public function outPandect(){			
			m.advancePanelFade(slideMenu.hov.dat.out)
		}
		
		public function DU() : Void{
		if (lock == false){
			lock = true
			slideMenu.SlideUp()
			var time = new Time({fn:unlock, scope:this}, 300)
			
		}
		}
 
		public function DD() : Void	{
		if (lock == false){
			lock = true
			slideMenu.SlideDown()			
			var time = new Time({fn:unlock, scope:this}, 300)
		}
		}
		
		public function DN() : Void	{
			o.xplat.sysoi("menuback")
			m.Escape()
		}

		
		public function unlock(){lock = false}


}