

class core.panel.inspect.interactJoinCoord extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass

	function interactJoinCoord(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.joinScene.toUpperCase()+" | "+o.lib.translate(m.dataPin.visitor.name, m.actra.stageStatus.module.id, "P").toUpperCase())
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		

		
			var visData = m.dataPin.visitor.join
			for (var i=0; i < visData.length; i++){				
			
			
			var allow = true
			var hasBT = false
				
						for (var j=0; j < visData[i].check.length; j++){
							if(!OCheck.makeCheck(o, m.actra.stageStatus, visData[i].check[j])){
							   allow = false
							}
						}
							if(allow){
							dataO.push({cmd:{fn:"requestEntry", togfn:"togadv", togout:"inspectInteractJoinTarg", dat:visData[i]}, bt:{sy:"oconMiniCircle", b:visData[i].i}, tx:{desc:o.cfg.lang.requestEntry+" | "+o.lib.translate(visData[i].name, m.actra.stageStatus.module.id, "P").toUpperCase()}})
							hasBT = true
							}
							
							if(!hasBT){
							dataO.push({cmd:{fn:""}, bt:{sy:"oconMiniCircle", b:"omu_plusno"}, tx:{desc:o.cfg.lang.noScenesCanBeJoined.toUpperCase()}})
							}		
						
			
			}

		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
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
		

		var helpSplash = this.attachMovie("helpIconAndText", "help", this.getNextHighestDepth(), {_x:posO.h-50, _y:posO.vStart})
		helpSplash.basicR(o.cfg.lang.selectWithTOGForQuickJoin, 9, 1.0, o.fonts.m, "obt_t", 40)
	}	
	

	function targ(){

	}
	
	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	}
	
	function DT(){
	   this[buildO.buttons[buildO.point].dataO.cmd.togfn]()
	}
	
	function DN(){
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	function esc(){DN()}
	
	function togadv(){
	o.xplat.sysoi("menuforward")
	m.dataPin = {visitor:m.dataPin.visitor, join:buildO.buttons[buildO.point].dataO.cmd.dat, quick:1}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.togout)
	}
	
	function requestEntry(){
	o.xplat.sysoi("confirmm")
	m.actra.stageStatus.chore.autoNav.newAgenda(buildO.buttons[buildO.point].dataO.cmd.dat.connect)
	}
	
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
	}

}