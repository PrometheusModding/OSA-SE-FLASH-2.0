

class core.panel.major.configEsg extends MovieClip {


public var o
public var m



var buildO
var posO

var buttonFont

var description
var brass
var display


		function configEsg(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 9

		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.general+" | "+o.cfg.lang.config, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		dataO.push({cmd:{fn:"use"}, bool:{prop:"hideUnwornESG", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_shirt"}, tx:{desc:o.cfg.lang.hideUnwornEsg.toUpperCase(), ini:o.cfg.lang.hideUnwornEsgEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"clothingAudio", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_clothingaudio"}, tx:{desc:o.cfg.lang.clothingAudio.toUpperCase(), ini:o.cfg.lang.clothingAudioEx}})		
		dataO.push({cmd:{fn:"use"}, bool:{prop:"cuirassHasPants1", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_fulldress1"}, tx:{desc:o.cfg.lang.female.toUpperCase()+" | "+o.cfg.lang.cuirassHasPants.toUpperCase(), ini:o.cfg.lang.cuirassHasPantsEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"cuirassHasPants0", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_fulldress0"}, tx:{desc:o.cfg.lang.male.toUpperCase()+" | "+o.cfg.lang.cuirassHasPants.toUpperCase(), ini:o.cfg.lang.cuirassHasPantsEx}})
		
		dataO.push({cmd:{fn:"xUse"}, bool:{prop:"animRedressPlayer",  fn:"xTog", build:buildO, ix:dataO.length+1}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_redressplayera"}, tx:{desc:o.cfg.lang.animatedRedressing.toUpperCase()+" | "+o.cfg.lang.player.toUpperCase(), ini:o.cfg.lang.animatedRedressingEx}})
		dataO.push({cmd:{fn:"xUse"}, bool:{prop:"instaRedressPlayer", fn:"xTog", build:buildO, ix:dataO.length-1}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_redressplayeri"}, tx:{desc:o.cfg.lang.instantRedressing.toUpperCase()+" | "+o.cfg.lang.player.toUpperCase(), ini:o.cfg.lang.instantRedressingEx}})
		dataO.push({cmd:{fn:"xUse"}, bool:{prop:"animRedressNPC", fn:"xTog", build:buildO, ix:dataO.length+1}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_redressnpca"}, tx:{desc:o.cfg.lang.animatedRedressing.toUpperCase()+" | "+o.cfg.lang.npc.toUpperCase(), ini:o.cfg.lang.animatedRedressingEx}})
		dataO.push({cmd:{fn:"xUse"}, bool:{prop:"instaRedressNPC", fn:"xTog", build:buildO, ix:dataO.length-1}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_redressnpci"}, tx:{desc:o.cfg.lang.instantRedressing.toUpperCase()+" | "+o.cfg.lang.npc.toUpperCase(), ini:o.cfg.lang.instantRedressingEx}})
		
		
		dataO.push({cmd:{fn:"use"}, bool:{prop:"AIintlow1", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_aiintlow1"}, tx:{desc:o.cfg.lang.female.toUpperCase()+" | "+o.cfg.lang.autoIntimatesL.toUpperCase(), ini:o.cfg.lang.autoIntimatesEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"AIinthigh1", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_aiinthigh1"}, tx:{desc:o.cfg.lang.female.toUpperCase()+" | "+o.cfg.lang.autoIntimatesH.toUpperCase(), ini:o.cfg.lang.autoIntimatesEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"AIintlow0", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_aiintlow0"}, tx:{desc:o.cfg.lang.male.toUpperCase()+" | "+o.cfg.lang.autoIntimatesL.toUpperCase(), ini:o.cfg.lang.autoIntimatesEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"AIinthigh0", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_aiinthigh0"}, tx:{desc:o.cfg.lang.male.toUpperCase()+" | "+o.cfg.lang.autoIntimatesH.toUpperCase(), ini:o.cfg.lang.autoIntimatesEx}})
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].bt.sy, "option", this.getNextHighestDepth(), {o:o, m:m, _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
			posO.v += posO.vOff
			buildO.col++
			}else{
			buildO.row++
			buildO.col=0
			posO.v = posO.vStart
			posO.h += posO.hOff
			i--
			}
		}
		

		buildO.concludeSetup()
		processShift()
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
		
		
	}	
	

	
	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	}
	
	function DN(){
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	function esc(){DN()}
	
	function adv(){
	o.xplat.sysoi("menuforward")
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function use(){
	o.xplat.sysoi("confirmm")
	buildO.buttons[buildO.point].use()
	}
	
	function xUse(){
	o.xplat.sysoi("confirmm")
	buildO.buttons[buildO.point].xUse()
	}
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
		makeDisplay()
	}
	
	function revisit(){
			core.panel.util.fx.PIFXback_basic(buildO.buttons)
	}
	
	function makeDisplay(){
		display.removeMovieClip()
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "displayPanel", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO, iniText:buildO.buttons[buildO.point].dataO.tx.ini})
		display._y-=72
		display._x+= (posO.h - 42)
		display.buildFull()
		
		if(display){
		core.panel.util.fx.PFXreveal_basic(display)
		}
	}
	
	
	function appear(){
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}

}