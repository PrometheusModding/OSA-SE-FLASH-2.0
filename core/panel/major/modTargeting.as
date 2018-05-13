

class core.panel.major.modTargeting extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont
var module
var pandect
var description
var brass
var display

		function modTargeting(){

		module = m.dataPin.module
		pandect = m.dataPin.pandect
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -100
		posO.btWidth = 18	

		var roleDesc
		
		if(o.lib.lang[module.id].user[m.dataPin.role.name]){roleDesc = o.lib.lang[module.id].user[m.dataPin.role.name]}
		else{roleDesc = o.lib.lang[module.id]["default"][m.dataPin.role.name]}
		
		brass = new core.panel.major.brass.typeA(o, this, posO, pandect.name+" | "+roleDesc+" | "+o.cfg.lang.selectActors)
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		for (var i=0; i < o.targ.all.length; i++) {		
			if(!o.targ.all[i].isOnStage()){
			dataO.push({cmd:{fn:"select"}, dat:{targ:o.targ.all[i]}, bt:{sy:"oconTarget"}, tx:{desc:o.targ.all[i].name, gender:o.targ.all[i].gender}})
			}
		}
		
		
		
		var _font = new TextFormat();
		_font.letterSpacing = 1.0
		_font.font = o.fonts.l
		_font.size = 10
		
		var btGlobal = {xs:60, hxs:75, toff:-27, menuPanel:m, _font:_font, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
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
	

	function targ(){

	}
	
	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	}
	
	function DN(){
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	function esc(){DN()}
	
	function select(){
	o.xplat.sysoi("menuforward")
	m.targets[m.dataPin.roleIndex] = buildO.buttons[buildO.point].dataO.dat.targ
	m.dataPin.startMod.update()
	m.escape()
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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "displayPanel", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO.h-55})
		display._y-=72
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