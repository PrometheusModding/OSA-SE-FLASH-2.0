

class SP1Equip extends MovieClip
{
	
public var o
public var m
public var dia

var slideMenu
var displayMenu
var lock = false

var header
var active

var helpText
var offSetX


			public function SP1Equip(){			
			slideMenu = []
			displayMenu = []
			var StartV = 0
			var H = 0
			
			offSetX = -130
			header = this.attachMovie("SP1TierHead", "Head", this.getNextHighestDepth(), {_x:0,_y:-60});
			header["Tx"].autoSize = "right";
			header["Tx"].htmlText = o.cfg.lang.equipment.toUpperCase()
			lineStyle(1, 0xffffff, 100, true, "none", "round", "miter", 1);
			
			moveTo(0, -50);
			lineTo(H-(header["Tx"]._width), -50);
			
			
				for (var a=0; a < dia.actra.length; a++){
					
				slideMenu[a] = this.attachMovie("TwSlideMenu", slideMenu[a], this.getNextHighestDepth(), {_x:-50, _y:-100});
				buildMenu(slideMenu[a], dia.actra[a])
				}
			
			light(slideMenu[m.tabActra])
			active = m.tabActra
			helpText = this.attachMovie("helpTogTo", "helper", this.getNextHighestDepth(), {_x:-130,_y:-635});
			helpText.setTitle((dia.actra[m.tabActra].name).toUpperCase())
			helpText.setDesc(o.cfg.lang.togToChangeActra)
			}
			
			
			
			public function buildMenu(menuBuilder, actra){

						
			menuBuilder.dat = []
			menuBuilder.opMax = 5
			menuBuilder.opSelected = 3
			

			menuBuilder.dat.push({text1:o.cfg.lang.exit, text2:"Return to Scene Menu", icon:"sp_a_cancel", snd:"cancel", fn:"DN", menuStyle:"TwSlide_A"})			
			
				
			for (var i=0; i < actra.equip.attire.esg.list.length; i++){
				menuBuilder.dat.push({esgList:i, actra:actra, snd:"confirm", fn:"esgOp"})
			}
			if(actra.equip.armament.hand[0].exists || actra.equip.armament.hand[1].exists){
				menuBuilder.dat.push({esgList:"weapon", actra:actra, snd:"confirm", fn:"wepOp"})
			}

			menuBuilder.dat.push({text1:o.cfg.lang.outfits, base:"aesg_classic_b", icon:"aesg_classic_outfit", text2:"Manage "+actra.name+"'s outfits", snd:"advance", menuStyle:"TwSlide_A"})
			menuBuilder.dat.push({text1:"", text2:"", base:"oba_a_bw", id:"SP1ActraInfoEquipment", xPos:offSetX, yPos:-150, menuStyle:"TwSlide_A"})
			menuBuilder.dat.push({text1:o.cfg.lang.equipmentSlots, base:"oba_a_bw", text2:"Manage equipment by specific slots", snd:"advance", menuStyle:"TwSlide_A"})
			menuBuilder.dat.push({text1:o.cfg.lang.redressAll, base:"oba_a_bw", text2:"Put all of "+actra.name+"'s clothing on", snd:"confirm", out:"redress", fn:"attire", menuStyle:"TwSlide_A"})			
			menuBuilder.dat.push({text1:o.cfg.lang.undressAll, base:"aesg_classic_b", icon:"a_osxc_pantypeelrear01_f", text2:"Remove all of "+actra.name+"'s clothing", snd:"confirm", out:"undress", fn:"attire", menuStyle:"TwSlide_A"})
			
			
			
			
			
			menuBuilder.o = o
			menuBuilder.dia = dia
			menuBuilder.inject = "custom"
			
			menuBuilder.viY[0] = 10
			menuBuilder.viY[1] = -75
			menuBuilder.viY[2] = -175
			menuBuilder.viY[3] = -300
			menuBuilder.viY[4] = -425
			menuBuilder.viY[5] = -525
			menuBuilder.viY[6] = -590
			
			menuBuilder.viScale[0] = 100
			menuBuilder.viScale[1] = 120
			menuBuilder.viScale[2] = 140
			menuBuilder.viScale[3] = 180
			menuBuilder.viScale[4] = 140
			menuBuilder.viScale[5] = 120
		    menuBuilder.viScale[6] = 100
			
			menuBuilder.menuStyle = "TwSlide_AEsg"
			

			
			menuBuilder.create()
			dim(menuBuilder)
			
			
			}
			
			
		public function dim(menu){
			menu._alpha = 0
		}
		
		public function light(menu){
			menu._alpha = 100
		}
		
		public function DY() : Void{
			if(slideMenu[m.tabActra].hov.dat.fn){
			o.sys.playInputSound(slideMenu[m.tabActra].hov.dat.snd)
			this[slideMenu[m.tabActra].hov.dat.fn](slideMenu[m.tabActra].hov.dat.out)
			}
		}
		
		public function adv(){
			m.advancePanelFade(slideMenu[m.tabActra].hov.dat.out)
		}

		function rollDisplay(){
			if(displayMenu[m.tabActra]){
			displayMenu[m.tabActra].removeMovieClip()
			}
			if(slideMenu[m.tabActra].hov.dat.id){
			displayMenu[m.tabActra] = this.attachMovie(slideMenu[m.tabActra].hov.dat.id, "displayMenu", this.getNextHighestDepth(), {o:o, dia:dia, dat:slideMenu[m.tabActra].hov.dat, actra:dia.actra[m.tabActra]});
			}
		}

		public function anav(){
			trace("nav go ok")
		}
		
		function attire(command){
			dia.actra[m.tabActra].equip.attire[command]()
		}
		
		function esgOp(command){
			trace(slideMenu[m.tabActra].hov.decideEsg())
			dia.actra[m.tabActra].equip.attire[slideMenu[m.tabActra].hov.decideEsg()](slideMenu[m.tabActra].hov.esgType)
		}
		
		function wepOp(command){
			dia.actra[m.tabActra].equip.attire[slideMenu[m.tabActra].hov.decideWep()](slideMenu[m.tabActra].hov.esgType)
		}
		
		public function DU() : Void{
		if (lock == false){
			lock = true
			slideMenu[m.tabActra].SlideUp()
			rollDisplay()
			var time = new Time({fn:unlock, scope:this}, 300)
			
		}
		}
 
		public function DD() : Void	{
		if (lock == false){
			lock = true
			slideMenu[m.tabActra].SlideDown()			
			rollDisplay()
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
			
		}

		
		public function unlock(){lock = false}
		
		public function newActraTab(){
			dim(slideMenu[active])
			
			
			if(displayMenu[active]){
			displayMenu[active].removeMovieClip()
			}
			if(slideMenu[m.tabActra].hov.dat.id){
			displayMenu[m.tabActra] = this.attachMovie(slideMenu[m.tabActra].hov.dat.id, "displayMenu", this.getNextHighestDepth(), {o:o, dia:dia, dat:slideMenu[m.tabActra].hov.dat, actra:dia.actra[m.tabActra]});
			}
			
			light(slideMenu[m.tabActra])
			active = m.tabActra
			
			
			helpText.setTitle((dia.actra[m.tabActra].name).toUpperCase())
			
		}

}