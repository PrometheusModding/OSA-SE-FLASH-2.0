
class SP1Lights extends MovieClip
{
	
public var o
public var m
public var dia

var slideMenu
var lock = false

var header

var helpText

			public function SP1Lights(){			

			
			var StartV = 0
			var H = 0

			header = this.attachMovie("SP1TierHead", "Head", this.getNextHighestDepth(), {_x:0,_y:-60});
			header["Tx"].autoSize = "right";
			header["Tx"].htmlText = o.cfg.lang.lights.toUpperCase()
			lineStyle(1, 0xffffff, 100, true, "none", "round", "miter", 1);
			
			moveTo(0, -50);
			lineTo(H-(header["Tx"]._width), -50);
			
					
			slideMenu = this.attachMovie("TwSlideMenu", slideMenu, this.getNextHighestDepth(), {o:o, _x:-50, _y:-100});							
			
			
			slideMenu.opMax = 5
			slideMenu.opSelected = 3
			
			
			
			slideMenu.dat.push({text1:o.cfg.lang.rearLight+" | "+o.cfg.lang.bright, text2:"Light the target's's rear with a bright light", base:"oba_r_bw", icon:"sp_a_lightb", out:"AssBright", snd:"confirm", fn:"lightFxActor"}) 
			slideMenu.dat.push({text1:o.cfg.lang.removeLight, text2:"Remove all lights from the target", base:"oba_r_bw", out:"Remove", snd:"confirm", fn:"lightFxActor"})
			slideMenu.dat.push({text1:o.cfg.lang.exit, text2:"Return to Scene Menu", icon:"sp_a_cancel", snd:"cancel", fn:"DN"})			
			slideMenu.dat.push({text1:o.cfg.lang.faceLight+" | "+o.cfg.lang.dim, text2:"Light the target's's face with a dim light",  base:"oba_r_bw", icon:"sp_a_flightd_f", out:"FaceDim", snd:"confirm", fn:"lightFxActor"})
			slideMenu.dat.push({text1:o.cfg.lang.faceLight+" | "+o.cfg.lang.bright, text2:"Light the target's's face with a bright light", base:"oba_r_bw", icon:"sp_a_flightb_f", out:"FaceBright", snd:"confirm", fn:"lightFxActor"})
			slideMenu.dat.push({text1:o.cfg.lang.rearLight+" | "+o.cfg.lang.dim, text2:"Light the target's's rear with a dim light", base:"oba_r_bw", icon:"sp_a_lightd", out:"AssDim", snd:"confirm", fn:"lightFxActor"}) 
			
			


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

			helpText = this.attachMovie("helpTogTo", "helper", this.getNextHighestDepth(), {_x:-130,_y:-635});
			helpText.setTitle((dia.actra[m.tabActra].name).toUpperCase())
			helpText.setDesc(o.cfg.lang.togToChangeActra)
			}
			
		
		public function lightFxActor(){
			dia.actra[m.tabActra].lightFx(slideMenu.hov.dat.out)
		}

		public function DY() : Void{
			o.sys.playInputSound(slideMenu.hov.dat.snd)
			this[slideMenu.hov.dat.fn]()
		}
		
		public function adv(){
			m.advancePanelFade(slideMenu.hov.dat.out)
		}
		
		
		public function anav(){

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
		
		public function DT() : Void	{
			o.sys.playInputSound("shift")
			m.pushTabActra()
			helpText.setTitle((dia.actra[m.tabActra].name).toUpperCase())
		}

		
		public function unlock(){lock = false}


}