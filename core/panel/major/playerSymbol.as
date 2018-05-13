

class core.panel.major.playerSymbol extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description
var brass
var display

		function playerSymbol(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 9
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.playerSymbol, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		dataO.push({cmd:{fn:"sym", out:"!dg"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_genders"}, tx:{desc:o.cfg.lang.defaultByGender, ini:o.cfg.lang.defaultByGenderEx+"\ndata/OSA/Persona/pc/female/ | data/OSA/Persona/pc/male/"}})
		dataO.push({cmd:{fn:"sym", out:"!nm"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_name"}, tx:{desc:o.cfg.lang.setByName, ini:o.cfg.lang.setByNameEx+"\ndata/OSA/Persona/pc/*playername/"}})
		dataO.push({cmd:{fn:"sym", out:"omg"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_omega"}, tx:{desc:"OMEGA", ini:o.cfg.lang.symbolPremadeEx+"\ndata/OSA/Persona/pc/omega/"}})
		dataO.push({cmd:{fn:"sym", out:"oct"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_octopus"}, tx:{desc:"OCTOPUS", ini:o.cfg.lang.symbolPremadeEx+"\ndata/OSA/Persona/pc/octopus/"}})
		dataO.push({cmd:{fn:"sym", out:"rab"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_rabbit"}, tx:{desc:"RABBIT", ini:o.cfg.lang.symbolPremadeEx+"\ndata/OSA/Persona/pc/rabbit/"}})
		dataO.push({cmd:{fn:"sym", out:"tst"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_test"}, tx:{desc:"TEST", ini:o.cfg.lang.symbolPremadeEx+"\ndata/OSA/Persona/pc/test/"}})
		dataO.push({cmd:{fn:"sym", out:"dev"}, hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircle", b:"omu_develop"}, tx:{desc:"DEVELOP", ini:o.cfg.lang.symbolPremadeEx+"\ndata/OSA/Persona/pc/develop/"}})
		
		
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
	
	function sym(){
	o.xplat.sysoi("menuforward")
	o.cfg.config.newPlayerSymbol("playerSymbol", buildO.buttons[buildO.point].dataO.cmd.out)
	m.dataPin.bt.dataO.bt.b = buildO.buttons[buildO.point].dataO.bt.b
	m.dataPin.bt.update()
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