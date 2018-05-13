

class core.panel.major.configColor extends MovieClip {


public var o
public var m



var buildO
var posO

var buttonFont

var description
var brass
var display
var colorButton

		function configColor(){
		colorButton = m.dataPin.bt		
		
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 9
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang[m.dataPin.prop]+" | "+o.cfg.lang.config, "")
		posO.vStart = posO.v
		
		var dataO = []
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 		
		

		dataO.push({cmd:{fn:"use"}, bool:{id:"U!"}, custom:1, color:"0x"+o.cfg.xconfig.menuMajor[0].dRGB[0][m.dataPin.prop],  hud:{panel:"_majorIniText"}, bt:{sy:"oconMiniCircleColor"}, tx:{desc:o.cfg.lang.customColor.toUpperCase(), ini:o.cfg.lang.customColorEx}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"op"}, color:"0xE86570", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"OPINK"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"li"}, color:"0xDEBEDB", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"LILY"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"ro"}, color:"0xB9529F", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"ROYAL"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"gr"}, color:"0xA16FAF", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"GRAPE"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"ds"}, color:"0x4365AF", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"DEEP SEA"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"nv"}, color:"0x1C75BC", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"NAVY"}})		
		dataO.push({cmd:{fn:"use"}, bool:{id:"pc"}, color:"0x088A85", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"PEACOCK"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"ic"}, color:"0x19C4BD", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"ICE"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"mi"}, color:"0x7AC798", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"MINT"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"ve"}, color:"0x39B54A", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"VENOM"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"cs"}, color:"0x8DC63F", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"CHARTREUSE"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"sn"}, color:"0xD3B494", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"SAND"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"ch"}, color:"0xE5CC61", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"CHAMPAGNE"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"be"}, color:"0xE2BA59", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"BEE"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"ap"}, color:"0xF7941E", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"APRICOT"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"mv"}, color:"0xB71E53", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"MAUVE"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"bg"}, color:"0x991B1F", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"BURGUNDY"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"sr"}, color:"0xD95D66", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"SOFT RED"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"rc"}, color:"0xEC2127", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"CHERRY"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"sm"}, color:"0xBCBEC0", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"SMOKE"}})
		dataO.push({cmd:{fn:"use"}, bool:{id:"wh"}, color:"0xFFFFFF", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"WHITE"}})		
		dataO.push({cmd:{fn:"use"}, bool:{id:"ab"}, color:"0x2A2A2A", bt:{sy:"oconMiniCircleColor"}, tx:{desc:"ABYSS"}})
		
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
	   	colorButton.base.removeMovieClip()
	colorButton.dataO.color = o.cfg.config[m.dataPin.prop+"Hex"]
	colorButton.build()
	colorButton.dim()
	colorButton.light()
	   m.escape()
	}
	function esc(){DN()}
	
	function adv(){
	o.xplat.sysoi("menuforward")
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function use(){
	o.xplat.sysoi("confirmm")
	o.cfg.config.newColor(m.dataPin.prop, buildO.buttons[buildO.point].dataO.bool.id)
	buildO.buttons[buildO.point].update()
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