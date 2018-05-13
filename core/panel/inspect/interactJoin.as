

class core.panel.inspect.interactJoin extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass


var checkFrequency

	function onFrame(){
		checkFrequency++
		if(checkFrequency==30){
			checkFrequency=0
		}
	}



	function interactJoin(){
	    checkFrequency = 0
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.interact.toUpperCase())
		
		posO.vStart = posO.v
		
		var dataO = []
		var visitorData
		var joinData
		var allow
		var hasBT
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		

		
			if(m.actra.stageStatus.scene.invite){
				
				
				for (var i=0; i < m.actra.stageStatus.scene.invite.length; i++){
				visitorData = o.lib.PLib.get(m.actra.stageStatus.module.id).visitor[m.actra.stageStatus.scene.invite[i].visitorix]
				joinData = visitorData.join[m.actra.stageStatus.scene.invite[i].joinix]
				
				
				allow = true
				hasBT = false
					for (var j=0; j < visitorData.check.length; j++){
						if(!OCheck.makeCheck(o, m.actra.stageStatus, visitorData.check[j])){
						   allow = false
						}
					}
						if(allow){
						dataO.push({cmd:{fn:"adv", out:"inspectInteractJoinTarg"}, dat:{visitor:visitorData, join:joinData}, bt:{sy:"oconMiniCircle", b:visitorData.i}, tx:{desc:o.cfg.lang.joinScene.toUpperCase()+": "+o.lib.translate(visitorData.name, m.actra.stageStatus.module.id, "P").toUpperCase()+" | "+o.lib.translate(joinData.name, m.actra.stageStatus.module.id, "P").toUpperCase()}})	
						hasBT = true
						}
				}
				
				if(!hasBT){
					dataO.push({cmd:{fn:""}, bt:{sy:"oconMiniCircle", b:"omu_stickfigno"}, tx:{desc:o.cfg.lang.cannotSeamlessJoinFromHere.toUpperCase()}})
				}
				
			}else{
			dataO.push({cmd:{fn:""}, bt:{sy:"oconMiniCircle", b:"omu_stickfigno"}, tx:{desc:o.cfg.lang.cannotSeamlessJoinFromHere.toUpperCase()}})
			}
			
			
			var joinData = o.lib.PLib.get(m.actra.stageStatus.module.id).visitor
			
			for (var i=0; i < joinData.length; i++){		
			
			allow = true
			hasBT = false
				
						for (var j=0; j < joinData.check.length; j++){
							if(!OCheck.makeCheck(o, m.actra.stageStatus, joinData[i].check[j])){
							   allow = false
							}
						}
							if(allow){
							dataO.push({cmd:{fn:"advCo", out:"inspectInteractJoinCoord", dat:joinData[i]}, bt:{sy:"oconMiniCircle", b:joinData[i].bt}, tx:{desc:o.cfg.lang.coordinate.toUpperCase()+": "+o.lib.translate(joinData[i].name, m.actra.stageStatus.module.id, "P").toUpperCase()}})
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
	
	function adv(){
	o.xplat.sysoi("menuforward")
	m.dataPin = {visitor:buildO.buttons[buildO.point].dataO.dat.visitor, join:buildO.buttons[buildO.point].dataO.dat.join, quick:0}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function advCo(){
	o.xplat.sysoi("menuforward")
	m.dataPin = {visitor:buildO.buttons[buildO.point].dataO.cmd.dat}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}

	
	function observe(){
	o.xplat.sysoi("confirmm")
	o.viewStage = m.actra.stageStatus
	o.viewStage.enterObserver()
	}
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
	}
	
	function revisit(){
			core.panel.util.fx.PIFXback_basic(buildO.buttons)
	}
	
	
	function appear(){
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}

}