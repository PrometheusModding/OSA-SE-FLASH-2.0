

class SP1ActraInfoReaction extends MovieClip
{
	
public var o
public var dat
public var dia
public var actra

var panel
var menuTitle

var purityMode

var topBrass
var reactionClass
var horizon
var profileMode
var proDat

			public function SP1ActraInfoReaction(){	
				_x = dat.xPos
				_y = dat.yPos
				panel = this
				
				if(!actra.profile.has){profileMode = false}
				else{profileMode = true}
				
				
				proDat = actra.profile.profileData 

				horizon =-10
				
				makeOverlay()

			
			}
			
			function makeOverlay(){
				topBrass = this.attachMovie("ProfileBrass", topBrass, this.getNextHighestDepth(), {_y:-270});				
				topBrass.horizon = horizon
				topBrass.o = o
				topBrass.dia = dia
				topBrass.actra = actra
				topBrass.proDat = proDat
				topBrass.profileMod = profileMode
				topBrass.buildShort()
				

				reactionClass = this.attachMovie("_profileReaction", reactionClass, this.getNextHighestDepth(), {});				
				reactionClass.horizon = horizon
				reactionClass.o = o
				reactionClass.dia = dia
				reactionClass.actra = actra
				reactionClass.proDat = proDat
				reactionClass.profileMod = profileMode
				reactionClass.buildFull()

				OADraw.OLine(this, 0, 0, 0, -270, "0xFFFFFF", .25)			
				
				
			}
			
			public function makeProportions(){	
				var panelType = "SP1ActraInfoPersonaClassWinSex"
				menuTitle = o.cfg.lang.menuNaturalProportions
				if(purityMode){
				panelType = "SP1ActraInfoPersonaClassWinPurity"
				}

				if(dat.cmd=="current"){
					menuTitle = o.cfg.lang.menuCurrentProportions
				}
				panel = this.attachMovie(panelType, panel, this.getNextHighestDepth());
				
				sharedTitles()
				sharedValues()
				
				if(!purityMode){					
				sexTitles()
				sexValues()
				}
				
			}


			
			public function sharedTitles(){
				
				panel.boxTitle.htmlText = menuTitle

				panel.W.htmlText = o.cfg.lang.menuWeight
				panel.WM.htmlText = o.cfg.lang.menuMetric
				panel.WS.htmlText = o.cfg.lang.menuSkyWeight
			}
			
			public function sexTitles(){

				
				panel.boxTitle.htmlText = o.cfg.lang.menuPersonaClass
				
				panel.mot.htmlText = o.cfg.lang.oclass
				panel.titleMotif.htmlText = o.cfg.lang.motif
				panel.titleMien.htmlText = o.cfg.lang.mien
				panel.titleEmo.htmlText = o.cfg.lang.emo
				panel.titleReact.htmlText = o.cfg.lang.reaction
				
				panel.mienex.htmlText = o.cfg.lang.expression
				panel.mienvo.htmlText = o.cfg.lang.voice
				
				panel.emoex.htmlText = o.cfg.lang.expression
				panel.emovo.htmlText = o.cfg.lang.voice
				
				
				panel.reactKiss.htmlText = o.cfg.lang.kiss
				panel.reactEmb.htmlText = o.cfg.lang.embrace
				panel.reactSpank.htmlText = o.cfg.lang.spank
				panel.reactClothes.htmlText = o.cfg.lang.clothing
				panel.reactExposure.htmlText = o.cfg.lang.exposure
				panel.reactHair.htmlText = o.cfg.lang.hair
				
				panel.reactPus.htmlText = o.cfg.lang.pussy
				panel.reactAnal.htmlText = o.cfg.lang.anal
				panel.reactMouth.htmlText = o.cfg.lang.mouth
				panel.reactPenPus.htmlText = o.cfg.lang.penPussy
				panel.reactPenAnal.htmlText = o.cfg.lang.penAnal
				panel.reactPenMouth.htmlText = o.cfg.lang.penMouth
				
				panel.reactGentle.htmlText = o.cfg.lang.gentle
				panel.reactPhys.htmlText = o.cfg.lang.physical
				panel.reactRough.htmlText = o.cfg.lang.rough
				panel.reactAbuse.htmlText = o.cfg.lang.abuse
				
				panel.mgenShaft.htmlText = o.cfg.lang.menuMGenShaft
				panel.mgenScrotum.htmlText = o.cfg.lang.menuMGenScrotum
				panel.mgenMicroShaft.htmlText = o.cfg.lang.menuMicroShaft
				
			}
			
			
			
			public function sharedValues(){
				
				panel.name.htmlText = actra.name
				
				
				
			}
			
			public function sexValues(){
				panel.motVal.htmlText = actra.persona.intimate.motif
				panel.mienexVal.htmlText = actra.persona.intimate.mien.expression
				panel.mienvoVal.htmlText = actra.persona.intimate.mien.voice
				panel.emoexVal.htmlText = actra.persona.intimate.emo.expression
				panel.emovoVal.htmlText = actra.persona.intimate.emo.voice
				
				

				
				panel.reactKissVal.htmlText = actra.persona.intimate.reaction.kiss
				panel.reactEmbVal.htmlText = actra.persona.intimate.reaction.emb
				panel.reactSpankVal.htmlText = actra.persona.intimate.reaction.spank
				panel.reactClothesVal.htmlText = actra.persona.intimate.reaction.clothes
				panel.reactExposureVal.htmlText = actra.persona.intimate.reaction.expo
				panel.reactHairVal.htmlText = actra.persona.intimate.reaction.hair
				
				panel.reactPusVal.htmlText = actra.persona.intimate.reaction.inpus
				panel.reactAnalVal.htmlText = actra.persona.intimate.reaction.inanal
				panel.reactMouthVal.htmlText = actra.persona.intimate.reaction.inmo
				panel.reactPenPusVal.htmlText = actra.persona.intimate.reaction.pnpus
				panel.reactPenAnalVal.htmlText = actra.persona.intimate.reaction.pnanal
				panel.reactPenMouthVal.htmlText = actra.persona.intimate.reaction.pnmo
				
				panel.reactGentleVal.htmlText = actra.persona.intimate.reaction.gentle
				panel.reactPhysVal.htmlText = actra.persona.intimate.reaction.phys
				panel.reactRoughVal.htmlText = actra.persona.intimate.reaction.rough
				panel.reactAbuseVal.htmlText = actra.persona.intimate.reaction.abuse
			}
}