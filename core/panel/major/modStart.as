

class core.panel.major.modStart extends MovieClip {


public var o
public var m


var module
var pandect

var buildO
var posO

var buttonFont

var description
var brass
var display

		function modStart(){

		
		module = m.dataPin.module
		pandect = m.dataPin.pandect

		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 11
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, pandect.name+" | "+o.cfg.lang.selectActors, "")
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{style:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		dataO.push({cmd:{fn:"startScene"}, bt:{style:"oconMiniCircle", b:"omu_poweron"}, tx:{desc:o.cfg.lang.startScene.toUpperCase()}})
		dataO.push({cmd:{fn:"targ", out:"CrossHair"}, bt:{style:"oconMiniCircle", b:"omu_plus"}, tx:{desc:o.cfg.lang.getCrosshairTarget.toUpperCase()}})
		dataO.push({cmd:{fn:"targ", out:"ScanCell"}, bt:{style:"oconMiniCircle", b:"omu_multipeople"}, tx:{desc:o.cfg.lang.getAllInVicinity.toUpperCase()}})
		
		var roleDesc
		for (var i=0; i < module.actors; i++){
		
		if(o.lib.lang[module.id].user[module.role[i].name]){roleDesc = o.lib.lang[module.id].user[module.role[i].name]}
		else{roleDesc = o.lib.lang[module.id]["default"][module.role[i].name]}
		
		dataO.push({cmd:{fn:"selectActor"}, bt:{style:"oconMiniCircleRoleTarget"}, tx:{desc:roleDesc.toUpperCase()}, role:module.role[i], roleIndex:i})
		}
		
		
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].bt.style, "option", this.getNextHighestDepth(), {o:o, m:m, _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
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
	
	function update(){
		for (var i=0; i < buildO.buttons.length; i++){
				buildO.buttons[i].checkTarget()
		}
	}
	
	function startScene(){
		o.log.addLog("stg", "Starting scene from Major Menu | Library...")
		var spotsFilled = true
			for (var i=0; i < module.actors; i++){
				if(m.targets==undefined){
					spotsFilled = false
				}
			}	
		if(!spotsFilled){o.log.addLog("stg", "All required roles have not been filled, CANCELING START")}
		else{checkDuplicity()}
	}
	
	function checkDuplicity(){		
		var noDupes = true
			for (var i=0; i < module.actors; i++){
				for (var j=0; j < module.actors; j++){
					if(m.targets[i].id==m.targets[j].id){
						if(i!=j){
						noDupes = false
						}
					}
				}	
			}	
		
		if(!noDupes){o.log.addLog("stg", "A single actor is occupying multiple scene roles, CANCELING START")}
		else{triggerScene()}
	}
	
	function triggerScene(){
		var trigString = module.id
			for (var i=0; i < module.actors; i++){
				trigString += ","+m.targets[i].trueID
			}	
		o.log.addLog("stg", "STAGE ACCEPTED: sending start event...")
		o.log.addLog("stg", "Trigger String: "+trigString)
		
		o.skyString("0SA_StartModuleUI", trigString)
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
	
	function targ(){
	o.xplat.sysoi("confirmm")
	o.skyString("0SA_Targeting", buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function selectActor(){
	o.xplat.sysoi("confirmm")
	m.dataPin={module:module, pandect:pandect, startMod:this, role:buildO.buttons[buildO.point].dataO.role, roleIndex:buildO.buttons[buildO.point].dataO.roleIndex}
	m.advancePanelFade("majorModTargeting")
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