

class core.panel.inspect.interactJoinTargL extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass

	function interactJoinTargL(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -100
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.joinScene.toUpperCase()+" | "+o.lib.translate(m.dataPin.visitor.name, m.actra.stageStatus.module.id, "P").toUpperCase())
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		for (var i=0; i < o.targ.all.length; i++) {		
		dataO.push({cmd:{fn:"select"}, dat:{targ:o.targ.all[i]}, bt:{sy:"oconTarget"}, tx:{desc:o.targ.all[i].name, gender:o.targ.all[i].gender}})
		}
		
		
		
		var _font = new TextFormat();
		_font.letterSpacing = 1.0
		_font.font = o.fonts.l
		_font.size = 10

		
		
		var btGlobal = {xs:60, hxs:75, toff:-27, menuPanel:m, _font:_font, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].bt.sy, "option", this.getNextHighestDepth(), {o:o, _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
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
	m.dataPin.currentBT.update(buildO.buttons[buildO.point].dataO.dat.targ)
	m.escape()
	}
	
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
	}

}