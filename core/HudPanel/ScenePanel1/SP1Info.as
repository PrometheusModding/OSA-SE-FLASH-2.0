

class SP1Info extends MovieClip
{

public var o
public var m
public var dia

var slideMenu
var displayMenu
var lock = false

var header

var offSetX
var moreOptions

			public function SP1Info(){			
			var StartV = 0
			var H = 0
			
			offSetX = -125
			header = this.attachMovie("SP1TierHead", "Head", this.getNextHighestDepth(), {_x:0,_y:-60});
			header["Tx"].autoSize = "right";
			header["Tx"].htmlText = o.cfg.lang.info.toUpperCase()
			lineStyle(1, 0xffffff, 100, true, "none", "round", "miter", 1);
			
			moveTo(0, -50);
			lineTo(H-(header["Tx"]._width), -50);
			
				
					
			slideMenu = this.attachMovie("TwSlideMenu", slideMenu, this.getNextHighestDepth(), {_x:-50, _y:-100});							
			
			slideMenu.opMax = 4
			slideMenu.opSelected = 2
			
			slideMenu.dat[0] = {txt:o.cfg.lang.plugin.toUpperCase(), yes:true, id:"SP1PluginInfoOverview", fn:"adv", out:"SP1InfoPlugin", xPos:offSetX, yPos:offSetX, out:""} 
			slideMenu.dat[1] = {txt:o.cfg.lang.module.toUpperCase(),  id:"SP1InfoModule", xPos:offSetX, yPos:offSetX, out:""}
			slideMenu.dat[2] = {txt:o.cfg.lang.character.toUpperCase(), xml:dia.actra[m.tabActra].profile.profileData.overview[0], yes:true, fn:"adv", id:"proshell"+dia.actra[m.tabActra].profile.profileData.overview[0].type, out:"SP1InfoActra", xPos:offSetX, yPos:offSetX}
			slideMenu.dat[3] = {txt:o.cfg.lang.scene.toUpperCase(), id:"SP1InfoScene", xPos:offSetX, yPos:offSetX, out:""}			
			slideMenu.dat[4] = {txt:o.cfg.lang.exit.toUpperCase(), fn:"DN", out:""}


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
			
			displayMenu = this.attachMovie(slideMenu.hov.dat.id, displayMenu, this.getNextHighestDepth(), {o:o, dia:dia, dat:slideMenu.hov.dat, xml:slideMenu.hov.dat.xml, actra:dia.actra[m.tabActra]});
			popMoreOptions()
			
			}
			
			
		public function rollDisplay(){
			displayMenu.removeMovieClip()
			displayMenu = this.attachMovie(slideMenu.hov.dat.id, displayMenu, this.getNextHighestDepth(), {o:o, dia:dia, dat:slideMenu.hov.dat, xml:slideMenu.hov.dat.xml, actra:dia.actra[m.tabActra]});
		}
		
		public function DY() : Void{
			if(slideMenu.hov.dat.fn){
			this[slideMenu.hov.dat.fn]()
			}
		}
		
		public function adv(){
			o.sys.playInputSound(slideMenu.hov.dat.snd)
			m.advancePanelFade(slideMenu.hov.dat.out)
		}
		
		public function DU() : Void{
		if (lock == false){
			lock = true
			if(moreOptions){moreOptions.removeMovieClip()}		
						
			slideMenu.SlideUp()
			rollDisplay()
			popMoreOptions()
			var time = new Time({fn:unlock, scope:this}, 300)
			
			
		}
		
		}
 
		public function DD() : Void	{
		if (lock == false){
			lock = true
			if(moreOptions){moreOptions.removeMovieClip()}			
			
			slideMenu.SlideDown()			
			rollDisplay()
			popMoreOptions()
			var time = new Time({fn:unlock, scope:this}, 300)
		}
		}
		
		
		function popMoreOptions(){
			if(slideMenu.hov.dat.yes==true)
			{moreOptions = this.attachMovie("SP1MoreOptions", "yesMenu", this.getNextHighestDepth(), {o:o, _x:-100, _y:-192});			
			}
		}
		
		public function DN() : Void	{
			o.xplat.sysoi("menuback")
			m.Escape()
		}

		
		
		public function unlock(){
			lock = false
			}
		
		
		
		public function DT() : Void	{
			o.sys.playInputSound("shift")
			m.pushTabActra()
			
		}
		
		public function newActraTab(){
			displayMenu.removeMovieClip()
			displayMenu = this.attachMovie(slideMenu.hov.dat.id, displayMenu, this.getNextHighestDepth(), {o:o, dia:dia, dat:slideMenu.hov.dat, xml:slideMenu.hov.dat.xml, actra:dia.actra[m.tabActra]});
		}


}