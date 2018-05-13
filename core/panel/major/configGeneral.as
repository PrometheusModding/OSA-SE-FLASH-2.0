

class core.panel.major.configGeneral extends MovieClip {


public var o
public var m



var buildO
var posO

var buttonFont

var description
var brass
var display

		function configGeneral(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 7
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.general+" | "+o.cfg.lang.config, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		dataO.push({cmd:{fn:"use"}, bool:{prop:"purityMode", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_purity"}, tx:{desc:o.cfg.lang.purityModeTog.toUpperCase(), ini:o.cfg.lang.purityModeTogEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"sortRoleByAnimGender", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_genders"}, tx:{desc:o.cfg.lang.sortRoleByAnimGenderTog.toUpperCase(), ini:o.cfg.lang.sortRoleByAnimGenderTogEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"allowBodyScaling", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_bodyscale"}, tx:{desc:o.cfg.lang.bodyScalingTog.toUpperCase(), ini:o.cfg.lang.bodyScalingTogEx}})
		if(o.cfg.config.purityMode == 0){
		dataO.push({cmd:{fn:"use"}, bool:{prop:"allowMaleGenitalScaling", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_tophatbowtie"}, tx:{desc:o.cfg.lang.intimateScalingTog.toUpperCase(), ini:o.cfg.lang.intimateScalingTogEx}})
		}
		dataO.push({cmd:{fn:"use"}, bool:{prop:"navVanish", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_suneclipse"}, tx:{desc:o.cfg.lang.navVanishTog.toUpperCase(), ini:o.cfg.lang.navVanishTogEx}})
		
		dataO.push({cmd:{fn:"use"}, bool:{prop:"frostfallException", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_snowflake"}, tx:{desc:o.cfg.lang.frostfallException.toUpperCase(), ini:o.cfg.lang.frostfallExceptionEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"metricMode", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_scale"}, tx:{desc:o.cfg.lang.metricModeTog.toUpperCase(), ini:o.cfg.lang.metricModeTogEx}})
		
		var measurementRatios = "                     "+o.cfg.lang.measurementRatios.toUpperCase()+"\n"+"\n"
		
		measurementRatios += "                     "+o.cfg.lang.male.toUpperCase()+"\n"
		measurementRatios+= (o.cfg.lang.unitsSkyToEarthH+": "+o.cfg.units.height[0].ratioVirtualToEarth+"\n"+"\n")
		measurementRatios+= (o.cfg.lang.unitsModifierWeightBase+": "+o.cfg.units.weight[0].base+"\n")
		measurementRatios+= (o.cfg.lang.unitsModifierWeightPerInch+": "+o.cfg.units.weight[0].perInch+"\n")
		measurementRatios+= (o.cfg.lang.unitsModifierBodyThickness+": "+o.cfg.units.weight[0].perThickness+"\n"+"\n")
		measurementRatios += "                     "+o.cfg.lang.female.toUpperCase()+"\n"
		measurementRatios+= (o.cfg.lang.unitsSkyToEarthH+": "+o.cfg.units.height[1].ratioVirtualToEarth+"\n"+"\n")
		measurementRatios+= (o.cfg.lang.unitsModifierWeightBase+": "+o.cfg.units.weight[1].base+"\n")		
		measurementRatios+= (o.cfg.lang.unitsModifierWeightPerInch+": "+o.cfg.units.weight[1].perInch+"\n")		
		measurementRatios+= (o.cfg.lang.unitsModifierBodyThickness+": "+o.cfg.units.weight[1].perThickness+"\n")
		measurementRatios+="\n"+"*"+o.cfg.lang.unitsSkyToEarthEx
		measurementRatios+="\n"+"*"+o.cfg.lang.unitsWeightBaseEx
		measurementRatios+="\n"+"*"+o.cfg.lang.unitsWeightPerInchEx
		measurementRatios+="\n"+"*"+o.cfg.lang.unitsWeightBodyThicknessEx
							 
		dataO.push({cmd:{fn:""}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_scaleplus"}, tx:{desc:o.cfg.lang.measurementRatios.toUpperCase(), ini:measurementRatios}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"renameNpc", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_writename"}, tx:{desc:o.cfg.lang.renameNpcTog.toUpperCase(), ini:o.cfg.lang.renameNpcTogEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"renameInGame", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_renameskynpc"}, tx:{desc:o.cfg.lang.renameInGameTog.toUpperCase(), ini:o.cfg.lang.renameInGameTogEx}})
		
		dataO.push({cmd:{fn:"use"}, bool:{prop:"helpMode", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_qm"}, tx:{desc:o.cfg.lang.helpModeTog.toUpperCase(), ini:o.cfg.lang.helpModeTogEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"devMode", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_develop"}, tx:{desc:o.cfg.lang.devModeTog.toUpperCase(), ini:o.cfg.lang.devModeTogEx}})
		dataO.push({cmd:{fn:"use"}, bool:{prop:"logging", fn:"tog"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleBool", b:"omu_logconfig"}, tx:{desc:o.cfg.lang.loggingTog.toUpperCase(), ini:o.cfg.lang.loggingTogEx}})

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