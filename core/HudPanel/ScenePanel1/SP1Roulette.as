
class SP1Roulette extends MovieClip
{
	
public var o
public var m
public var dia

var slideMenu
var lock = false

var header

			public function SP1Roulette(){			

				if(!o.lib.TLib.get(dia.module.id)){
					var scout = new Scout(o)
					var sourceBack = {fn:outTags, scope:this}
					scout.checkTags(dia.module.id, sourceBack)
				
				}else{outTags()}
			}
		
			function outTags(){
			var StartV = 0
			var H = 0
			
			
			header = this.attachMovie("SP1TierHead", "Head", this.getNextHighestDepth(), {_x:0,_y:-60});
			header["Tx"].autoSize = "right";
			header["Tx"].htmlText = o.cfg.lang.roulette.toUpperCase()
			lineStyle(1, 0xffffff, 100, true, "none", "round", "miter", 1);
			
			moveTo(0, -50);
			lineTo(H-(header["Tx"]._width), -50);
			
					
			slideMenu = this.attachMovie("TwSlideMenu", slideMenu, this.getNextHighestDepth(), {_x:-50, _y:-100});							
			
			var pandectData = o.lib.PLib.get(dia.module.id) 
			var pandectMenu = pandectData.roulettemenu[0] 
			
			slideMenu.opMax = 5
			slideMenu.opSelected = 3
			
			slideMenu.dat[0] = {text1:o.cfg.lang.exit, text2:"Return to Scene Menu", icon:"sp_a_cancel", snd:"cancel", fn:"DN"}
			
			
			var t1
			var t2
			
				
				
				
			for (var i=0; i < pandectMenu.l0.length; i++){
				
				if(o.lib.langP[dia.module.id].user[pandectMenu.l0[i].title]){t1 = o.lib.langP[dia.module.id].user[pandectMenu.l0[i].title]}
				else{t1 = o.lib.langP[dia.module.id]["default"][pandectMenu.l0[i].title]}
				
				if(o.lib.langP[dia.module.id].user[pandectMenu.l0[i].subtitle]){t2 = o.lib.langP[dia.module.id].user[pandectMenu.l0[i].subtitle]}
				else{t2 = o.lib.langP[dia.module.id]["default"][pandectMenu.l0[i].subtitle]}
				
				t1 = core.util.syntax.SynDesc(o, t1, pandectMenu.l0[i], o.lib.langP[dia.module.id], dia.actra)
				t2 = core.util.syntax.SynDesc(o, t2, pandectMenu.l0[i], o.lib.langP[dia.module.id], dia.actra)
				
				slideMenu.dat[i+1] = {text1:t1, text2:t2, base:pandectMenu.l0[i]["b"], icon:pandectMenu.l0[i].i, border:pandectMenu.l0[i].br, category:pandectMenu.l0[i].category, snd:"confirm", fn:pandectMenu.l0[i].fn} 
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
			
			
			
			}
			
			

		public function DY() : Void{
			o.sys.playInputSound(slideMenu[m.tabActra].hov.dat.snd)
			this[slideMenu.hov.dat.fn]()
		}
		
		public function adv(){
			m.advancePanelFade(slideMenu.hov.dat.out)
		}
		
		
		public function navtag(){
			var tag = {category:slideMenu.hov.dat.category, dat:o.lib.TLib.get(dia.module.id)}
			dia.chore.autoNav.newAgenda(core.dias.util.calcTags.analyzeTags(tag))
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