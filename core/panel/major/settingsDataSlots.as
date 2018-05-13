

class core.panel.major.settingsDataSlots extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description
var brass
var display

		function settingsDataSlots(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 8
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.slots+" | "+o.cfg.lang.saveLoadSettings+" | "+o.cfg.lang.config.toUpperCase(), "")
		posO.vStart = posO.v
		
		
		var dataO = []
		var udesc
		var ufn
		if(m.dataPin.loadsave==0){
		udesc = o.cfg.lang.loadSettings.toUpperCase()
		ufn="loadData"
		}else{
		udesc = o.cfg.lang.saveSettings.toUpperCase()
		ufn="saveData"
		}
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		dataO.push({cmd:{fn:ufn, ix:"0"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_floppydiskr"}, tx:{ini:o.cfg.lang.restoreSettingsEx, desc:udesc}})
		//dataO.push({cmd:{fn:ufn, ix:"1"}, bt:{sy:"oconMiniCircle", b:"omu_floppydisk1"}, tx:{desc:udesc}})
		//dataO.push({cmd:{fn:ufn, ix:"2"}, bt:{sy:"oconMiniCircle", b:"omu_floppydisk2"}, tx:{desc:udesc}})
		//dataO.push({cmd:{fn:ufn, ix:"3"}, bt:{sy:"oconMiniCircle", b:"omu_floppydisk3"}, tx:{desc:udesc}})
		//dataO.push({cmd:{fn:ufn, ix:"4"}, bt:{sy:"oconMiniCircle", b:"omu_floppydisk4"}, tx:{desc:udesc}})
		//dataO.push({cmd:{fn:ufn, ix:"5"}, bt:{sy:"oconMiniCircle", b:"omu_floppydisk5"}, tx:{desc:udesc}})
		
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
	m.dataPin={loadsave:buildO.buttons[buildO.point].dataO.cmd.loadsave}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function loadData(){
	o.xplat.sysoi("hello")
	o.cfg.loadAll(buildO.buttons[buildO.point].dataO.cmd.ix)
	}
	
	function saveData(){
	o.xplat.sysoi("confirmm")
	o.cfg.saveAll(buildO.buttons[buildO.point].dataO.cmd.ix)
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