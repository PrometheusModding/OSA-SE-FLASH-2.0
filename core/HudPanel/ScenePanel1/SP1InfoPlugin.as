

class SP1InfoPlugin extends MovieClip
{

public var o
public var m
public var dia

var slideMenu
var displayMenu
var lock = false

var header
var offSetX
			public function SP1InfoPlugin(){			
			var StartV = 0
			var H = 0


			offSetX = -135
			header = this.attachMovie("SP1TierHead", "Head", this.getNextHighestDepth(), {_x:0,_y:-60});
			header["Tx"].autoSize = "right";
			header["Tx"].htmlText = o.cfg.lang.characterInfo.toUpperCase()
			lineStyle(1, 0xffffff, 100, true, "none", "round", "miter", 1);
			
			moveTo(0, -50);
			lineTo(H-(header["Tx"]._width), -50);
			
				

			slideMenu = this.attachMovie("TwSlideMenu", slideMenu, this.getNextHighestDepth(), {_x:-50, _y:-100});							
			
			slideMenu.opMax = 5
			slideMenu.opSelected = 3
			
			slideMenu.dat[0] = {text1:o.cfg.lang.exit, text2:"Return to Info Menu", icon:"sp_a_cancel", snd:"cancel", fn:"DN"}
			
			slideMenu.dat[1] = {id:"SP1PluginInfoOverview", xPos:offSetX, yPos:-150, text1:"", text2:"", base:"a_ci_bb", icon:pandectData.plugin[i].i}
			
			var pandectData = o.lib.PLib.get(dia.module.id) 
			
			for (var i=0; i < pandectData.plugin.length; i++){
				slideMenu.dat.push({id:"PluginPromo", plug:pandectData.plugin[i],  xPos:offSetX, yPos:-150, text1:"", text2:"", base:pandectData.plugin[i]["b"], icon:pandectData.plugin[i].i}) 
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
			displayMenu = this.attachMovie(slideMenu.hov.dat.id, displayMenu, this.getNextHighestDepth(), {o:o, dia:dia, dat:slideMenu.hov.dat, actra:dia.actra[m.tabActra]});
			
			}
			
			
		public function rollDisplay(){
			displayMenu.removeMovieClip()
			displayMenu = this.attachMovie(slideMenu.hov.dat.id, displayMenu, this.getNextHighestDepth(), {o:o, dia:dia, dat:slideMenu.hov.dat, actra:dia.actra[m.tabActra]});
		}
		
		public function DY() : Void{
			if(slideMenu.hov.dat.fn){
			o.sys.playInputSound(slideMenu.hov.dat.snd)
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
			m.Escape()
		}

		
		
		public function unlock(){lock = false}
		
		
		
		public function DT() : Void	{
			o.sys.playInputSound("shift")
			m.pushTabActra()
			
		}
		
		public function newActraTab(){
			displayMenu.removeMovieClip()
			displayMenu = this.attachMovie(slideMenu.hov.dat.id, displayMenu, this.getNextHighestDepth(), {o:o, dia:dia, dat:slideMenu.hov.dat, actra:dia.actra[m.tabActra]});
		}


}