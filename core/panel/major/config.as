

class core.panel.major.config extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description
var brass
var display

		function config(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 8
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.config, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		dataO.push({cmd:{fn:"adv", out:"majorConfigGeneral"}, bt:{sy:"oconMiniCircle", b:"omu_gears"}, tx:{desc:o.cfg.lang.general.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"majorConfigTextIcon"}, bt:{sy:"oconMiniCircle", b:"omu_texticon"}, tx:{desc:o.cfg.lang.textAndIconDisplay.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"majorESG"}, bt:{sy:"oconMiniCircle", b:"omu_shirtgear"}, tx:{desc:o.cfg.lang.esgFull.toUpperCase()}})
		
		//dataO.push({cmd:{fn:"adv", out:"majorConfigMyOSA"}, bt:{sy:"oconMiniCircle", b:"omu_myosa"}, tx:{desc:o.cfg.lang.myOSA.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"majorConfigLanguage"}, bt:{sy:"oconMiniCircle", b:"omu_idkchinese"}, tx:{desc:o.cfg.lang.language.toUpperCase()}})
		//dataO.push({cmd:{fn:"startScene"}, bt:{style:"oconMiniCircle", b:"omu_shirt"}, tx:{desc:o.cfg.lang.esgFull.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"majorkeybind"}, bt:{sy:"oconMiniCircle", b:"omu_keybind"}, tx:{desc:o.cfg.lang.keybind.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"majorConfigTemp"}, bt:{sy:"oconMiniCircle", b:"omu_gearhalf"}, tx:{desc:o.cfg.lang.temporary.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"majorScSettings"}, bt:{sy:"oconMiniCircle", b:"omu_flag"}, tx:{desc:o.cfg.lang.sceneSettings.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"majorConfigColor"}, hud:{panel:"_majorIniText"}, prop:"themeColor", color:o.cfg.config.themeColorHex, bt:{sy:"oconMiniCircleColor"}, tx:{desc:o.cfg.lang.themeColor.toUpperCase(), ini:o.cfg.lang.themeColorEx}})
		dataO.push({cmd:{fn:"adv", out:"majorConfigColor"}, hud:{panel:"_majorIniText"}, prop:"subColor", color:o.cfg.config.subColorHex, bt:{sy:"oconMiniCircleColor"}, tx:{desc:o.cfg.lang.subColor.toUpperCase(), ini:o.cfg.lang.subColorEx}})
		dataO.push({cmd:{fn:"adv", out:"majorSettingsData"}, bt:{sy:"oconMiniCircle", b:"omu_floppydisk"}, tx:{desc:o.cfg.lang.saveLoadSettings.toUpperCase()}})		
		//dataO.push({cmd:{fn:"adv", out:"majorConfigDebug"}, bt:{sy:"oconMiniCircle", b:"omu_virus"}, tx:{desc:o.cfg.lang.debug.toUpperCase()}})
	
				
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
	m.dataPin={bt:buildO.buttons[buildO.point], prop:buildO.buttons[buildO.point].dataO.prop}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "displayPanel", this.getNextHighestDepth(), {o:o, actra:m.actra, _x:posO.h, horizon:posO, iniText:buildO.buttons[buildO.point].dataO.tx.ini})
		display._y-=72
		display._x-=42
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