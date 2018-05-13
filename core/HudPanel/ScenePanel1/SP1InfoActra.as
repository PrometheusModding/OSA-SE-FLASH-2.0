

class SP1InfoActra extends MovieClip
{

public var o
public var m
public var dia

var slideMenu
var displayMenu
var lock = false

var header
var offSetX
			public function SP1InfoActra(){			
			var StartV = 0
			var H = 0


			offSetX = -125
			header = this.attachMovie("SP1TierHead", "Head", this.getNextHighestDepth(), {_x:0,_y:-60});
			header["Tx"].autoSize = "right";
			header["Tx"].htmlText = o.cfg.lang.characterInfo.toUpperCase()
			lineStyle(1, 0xffffff, 100, true, "none", "round", "miter", 1);
			
			moveTo(0, -50);
			lineTo(H-(header["Tx"]._width), -50);
			
				

			slideMenu = this.attachMovie("TwSlideMenu", slideMenu, this.getNextHighestDepth(), {_x:-50, _y:-100});							
			
			slideMenu.opMax = 6
			slideMenu.opSelected = 3
			
			slideMenu.dat.push({txt:o.cfg.lang.overview.toUpperCase(), id:"SP1ActraInfoOverview", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.profile.toUpperCase(), out:""})
			slideMenu.dat.push({txt:o.cfg.lang.biography.toUpperCase(), id:"SP1ActraInfoBio", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.sounds.toUpperCase(), id:"SP1ActraInfoSounds", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.equipment.toUpperCase(), id:"SP1ActraInfoEquipment", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.reaction.toUpperCase(), id:"SP1ActraInfoReaction", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.personaClass.toUpperCase(), id:"SP1ActraInfoPersonaClass", xPos:offSetX, yPos:-150, out:""})			
			slideMenu.dat.push({txt:o.cfg.lang.naturalScale.toUpperCase(), id:"SP1ActraInfoProportions", xPos:offSetX, yPos:-150, cmd:"orig"})
			slideMenu.dat.push({txt:o.cfg.lang.currentScale.toUpperCase(), id:"SP1ActraInfoProportions", xPos:offSetX, yPos:-150, cmd:"current"})
			slideMenu.dat.push({txt:o.cfg.lang.technical.toUpperCase(), id:"SP1ActraInfoTechnical", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.exit.toUpperCase(), fn:"DN", out:""})


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
			slideMenu.viScale[2] = 100
			slideMenu.viScale[3] = 130
			slideMenu.viScale[4] = 100
			slideMenu.viScale[5] = 100
		    slideMenu.viScale[6] = 100
			slideMenu.viScale[7] = 100
			 slideMenu.viScale[8] = 100
			
			slideMenu.menuStyle = "TwSlide_Text"
			

			
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