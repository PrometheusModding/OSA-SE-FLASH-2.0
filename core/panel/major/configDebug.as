

class core.panel.major.configDebug extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description
var brass
var display

		function configDebug(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 9
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.debug, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 		
		dataO.push({cmd:{fn:"report", out:"1"}, hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_virussky"}, tx:{desc:o.cfg.lang.systemReport.toUpperCase(), long:o.log.sys}})
		dataO.push({hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_logall"}, tx:{desc:o.cfg.lang.full+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:o.log.full}})
		dataO.push({hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_logrun"}, tx:{desc:o.cfg.lang.process+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:o.log.run}})
		dataO.push({hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_logboot"}, tx:{desc:o.cfg.lang.bootup+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:o.log.boot}})
		
		//dataO.push({cmd:{fn:"report", out:"2"}, hud:{panel:"_majorDebug"}, bt:{sy:"oconMiniCircle", b:"omu_virussky"}, tx:{desc:o.cfg.lang.actorReport.toUpperCase(), long:o.log.sys}})
		//dataO.push({cmd:{fn:"reset", out:"1"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_virus"}, tx:{desc:o.cfg.lang.clearAllWorldOSA.toUpperCase(), ini:o.cfg.lang.clearAllWorldOSAEx}})
		//dataO.push({cmd:{fn:"reset", out:"2"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_virus"}, tx:{desc:o.cfg.lang.cleanCharacter.toUpperCase(), ini:o.cfg.lang.cleanCharacterEx}})
		//dataO.push({cmd:{fn:"reset", out:"3"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_virus"}, tx:{desc:o.cfg.lang.resetOSA.toUpperCase(), ini:o.cfg.lang.resetOSAEx}})
		
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
	m.dataPin={bt:buildO.buttons[buildO.point]}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function outputLog(){
		o.log.printLog()
	}
	
	function use(){
	o.xplat.sysoi("confirmm")
	buildO.buttons[buildO.point].use()
	}
	
	function report(){
	o.xplat.sysoi("hello")
	o.ctr.globalPause = true
	o.log.callBack = {fn:systemReportOut, scope:this}
	o.skyAll("0SA_Report", "", buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function systemReportOut(){
	o.log.callBack = undefined
	display.removeMovieClip()
	display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO, longText:o.log.sys, iniText:buildO.buttons[buildO.point].dataO.tx.ini})
	display._y-=72
	display._x-=42
	buildO.buttons[buildO.point].dataO.tx.long = o.log.sys
	o.ctr.globalPause = false
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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "displayPanel", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO, longText:buildO.buttons[buildO.point].dataO.tx.long, isLog:buildO.buttons[buildO.point].dataO.tx.isLog, iniText:buildO.buttons[buildO.point].dataO.tx.ini})
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