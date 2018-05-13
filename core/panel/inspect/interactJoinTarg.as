

class core.panel.inspect.interactJoinTarg extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description
var brass
var target

	function interactJoinTarg(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		if(m.dataPin.quick == 1){
		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.quickJoin.toUpperCase()+" | "+o.lib.translate(m.dataPin.visitor.name, m.actra.stageStatus.module.id, "P").toUpperCase()+" | "+o.lib.translate(m.dataPin.join.name, m.actra.stageStatus.module.id, "P").toUpperCase())
		}else{
		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.joinScene.toUpperCase()+" | "+o.lib.translate(m.dataPin.visitor.name, m.actra.stageStatus.module.id, "P").toUpperCase())
		
		}
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		
		if(m.dataPin.quick == 1){
		dataO.push({cmd:{fn:"joinPlayer"}, bt:{sy:"oconMiniCircle", b:"omu_stickfigpluspow"}, tx:{desc:o.cfg.lang.playerQuickJoin.toUpperCase()}})		
		dataO.push({cmd:{fn:"joinTarget"}, bt:{sy:"oconMiniCircle", b:"omu_pluspluspow"}, tx:{desc:o.cfg.lang.targetQuickJoin.toUpperCase()}})
		}else{
		dataO.push({cmd:{fn:"joinPlayer"}, bt:{sy:"oconMiniCircle", b:"omu_stickfigpluspow"}, tx:{desc:o.cfg.lang.playerJoinScene.toUpperCase()}})		
		dataO.push({cmd:{fn:"joinTarget"}, bt:{sy:"oconMiniCircle", b:"omu_pluspluspow"}, tx:{desc:o.cfg.lang.targetJoinScene.toUpperCase()}})
		}
		
		dataO.push({cmd:{fn:"targ", out:"CrossHair"}, bt:{sy:"oconMiniCircle", b:"omu_plus"}, tx:{desc:o.cfg.lang.getCrosshairTarget.toUpperCase()}})
		
		dataO.push({cmd:{fn:"selectActor"}, bt:{sy:"oconMiniCircleJoinTarget"}, panel:this, tx:{desc:o.lib.translate(m.dataPin.visitor.name, m.actra.stageStatus.module.id, "P").toUpperCase()}})
		
		
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
	}	
	
	function targ(){
	o.xplat.sysoi("confirmm")
	o.skyString("0SA_Targeting", buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function joinPlayer(){
	o.xplat.sysoi("confirmm")
	m.actra.stageStatus.actraInvite("00000007", "20", m.dataPin.join.entry)
	}
	
	function joinTarget(){
	if(target){
		if(!target.isOnStage()){
			o.xplat.sysoi("confirmm")
			m.actra.stageStatus.actraInvite(target.id, target.trueID, m.dataPin.join.entry)
		}
	}
	
	}
	
	function selectActor(){
	o.xplat.sysoi("confirmm")
	m.dataPin = {visitor:m.dataPin.visitor, join:m.dataPin.join, quick:m.dataPin.quick, currentBT:buildO.buttons[buildO.point]}
	m.advancePanelFade("inspectInteractJoinTargL")
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
	m.dataPin = {visitor:m.dataPin.visitor, join:m.dataPin.join, quick:m.dataPin.quick, currentBT:buildO.buttons[buildO.point]}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
	}

}