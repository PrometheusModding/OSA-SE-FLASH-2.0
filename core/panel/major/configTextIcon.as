

class core.panel.major.configTextIcon extends MovieClip {


public var o
public var m



var buildO
var posO

var buttonFont

var description
var brass
var display

		function configTextIcon(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 7
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.textAndIconDisplay+" | "+o.cfg.lang.config, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		dataO.push({cmd:{fn:"use"}, bool:{prop:"smallNavigationIcons", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_texticonNavSmall"}, tx:{desc:o.cfg.lang.SmallNavigationIcons.toUpperCase(), ini:o.cfg.lang.SmallNavigationIconsEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"textOptUi", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_textui"}, tx:{desc:o.cfg.lang.textOptUi.toUpperCase(), ini:o.cfg.lang.textOptUiEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"dynamicIconDisplay", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_uidisplayplus"}, tx:{desc:o.cfg.lang.dynamicIconDisplayTog.toUpperCase(), ini:o.cfg.lang.dynamicIconDisplayTogEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"skinToneDisplay", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_personpaint"}, tx:{desc:o.cfg.lang.skinToneDisplayTog.toUpperCase(), ini:o.cfg.lang.skinToneDisplayTogEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"iconShading", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_shading"}, tx:{desc:o.cfg.lang.iconShading.toUpperCase(), ini:o.cfg.lang.iconShadingEx}})

		dataO.push({cmd:{fn:"use"}, bool:{prop:"largeMenuDescriptions", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_texticonlargedesc"}, tx:{desc:o.cfg.lang.largeMenuDescriptions.toUpperCase(), ini:o.cfg.lang.largeMenuDescriptionsEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"dropShadowLightText", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_texticondslight"}, tx:{desc:o.cfg.lang.dropShadowLightText.toUpperCase(), ini:o.cfg.lang.dropShadowLightTextEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"glowLightText", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_texticonglowlight"}, tx:{desc:o.cfg.lang.glowLightText.toUpperCase(), ini:o.cfg.lang.glowLightTextEx}})

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