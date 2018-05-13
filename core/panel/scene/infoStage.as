

class core.panel.scene.infoStage extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description

var display
var brass

var papyActro
var helper

	function infoStage(){

		papyActro = "Actro has not been scanned yet..."+"\n"+"Press YES to scan the Papyrus _oActro script for this stage..."	
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 8
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.stage+" | "+o.cfg.lang.info.toUpperCase(), "")

		posO.vStart = posO.v
		
		var dataO = []	
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu", sy:"oconMiniCircle"}, noHelper:true, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 	
		
		dataO.push({cmd:{fn:"printLog", log:"full"}, bt:{b:"omu_logall", sy:"oconMiniCircle"}, hud:{panel:"_majorLongText"}, tx:{desc:o.cfg.lang.full+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:m.dia.log.full}})
		dataO.push({cmd:{fn:"printLog", log:"boot"}, bt:{b:"omu_logboot", sy:"oconMiniCircle"}, hud:{panel:"_majorLongText"}, tx:{desc:o.cfg.lang.bootup+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:m.dia.log.boot}})
		dataO.push({cmd:{fn:"printLog", log:"run"}, bt:{b:"omu_logrun", sy:"oconMiniCircle"}, hud:{panel:"_majorLongText"}, tx:{desc:o.cfg.lang.process+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:m.dia.log.run}})
		dataO.push({cmd:{fn:"printLog", log:"nav"}, bt:{b:"omu_lognav", sy:"oconMiniCircle"}, hud:{panel:"_majorLongText"}, tx:{desc:o.cfg.lang.navigation+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:m.dia.log.nav}})
		dataO.push({cmd:{fn:"printLog", log:"anav"}, bt:{b:"omu_logroulette", sy:"oconMiniCircle"}, hud:{panel:"_majorLongText"}, tx:{desc:o.cfg.lang.autonavigation+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:m.dia.log.anav}})
		dataO.push({cmd:{fn:"printLog", log:"mnu"}, bt:{b:"omu_logmenu", sy:"oconMiniCircle"}, hud:{panel:"_majorLongText"}, tx:{desc:o.cfg.lang.menu+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:m.dia.log.mnu}})
		dataO.push({cmd:{fn:"printOLog", log:"stg"}, bt:{b:"omu_logstage", sy:"oconMiniCircle"}, hud:{panel:"_majorLongText"}, tx:{desc:o.cfg.lang.stage+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:o.log.stg+"\nNOTICE: This log is a global OSA log not imbeded in the stage."}})
		
		dataO.push({cmd:{fn:""}, bt:{b:"omu_flag", sy:"oconMiniCircle"}, hud:{panel:"_SceneInfoStageFlags"}, noHelper:true, tx:{desc:o.cfg.lang.flags.toUpperCase()}})
		dataO.push({cmd:{fn:""}, bt:{b:"omu_puzzlep00", sy:"oconMiniCircle"}, hud:{panel:"_SceneInfoStageMisc"}, noHelper:true, tx:{desc:o.cfg.lang.misc.toUpperCase()}})
		dataO.push({cmd:{fn:"papyAO"}, bt:{b:"omu_scrollroll", sy:"oconMiniCircle"}, hud:{panel:"_majorLongText"}, noHelper:true, tx:{desc:o.cfg.lang.papyrusActro.toUpperCase(), long:papyActro}})
		
			
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].bt.sy, "option", this.getNextHighestDepth(), {o:o, _x:posO.h, _y:posO.v, dia:m.dia, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
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
		
		helper = this.attachMovie("multiInfoPoper", "helper", this.getNextHighestDepth(), {_x:-165,_y:-630});
		helper.build()
	}	
	
	function printLog(){
	o.xplat.sysoi("hello")
	m.dia.log.printLog(buildO.buttons[buildO.point].dataO.cmd.log)
	}
	
	function printOLog(){
	o.xplat.sysoi("hello")
	o.log.printLog(buildO.buttons[buildO.point].dataO.cmd.log)
	}
	
	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	}
	
	function DN(){
	   o.papyActro.playInputSound("cancel")
	   m.escape()
	}
	function esc(){DN()}
	
	function adv(){
	o.papyActro.playInputSound("advance")
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function papyAO(){
		o.papyActro.playInputSound("shift")
		o.ctr.globalPause = true
		o.beacon._cbReportArr = {fn:cbPapyAO, scope:this}
		o.sky("0SAO"+m.dia.id+"_Report")
	}
	
	function cbPapyAO(){
	var papyActroArr = o.beacon.dataPinArr
	o.beacon.dataPinArr = undefined
	
	
	papyActro	= ""
			papyActro +="\n Begin PapyActro Analysis..."
			papyActro +="\n ------------------------"
			papyActro	+="\n General Analysis..."
			papyActro +="\n Stage ID: "+papyActroArr[1]
			papyActro +="\n Glyph: "+papyActroArr[2]
			papyActro +="\n Password: "+papyActroArr[3]		
			
			papyActro +="\n"
			papyActro	+="\n Begin PapyActro Actor Analysis..."
			papyActro +="\n ------------------------"
			papyActro	+="\n Total Actors: "+papyActroArr[9]
			papyActro +="\n"
			
			for (var i=0; i < 10; i++) {
				papyActro	+="\n Actra"+i+": "+papyActroArr[Number(10+i)]
			}
			
			for (var i=0; i < 10; i++) {
				
				papyActro	+="\n ActraID "+i+": "+papyActroArr[Number(20+i)]
			}
			
			papyActro +="\n"
			papyActro	+="\n PapyActro Scan Complete..."
			
	display.removeMovieClip()
	display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO, longText:papyActro, iniText:buildO.buttons[buildO.point].dataO.tx.ini})
	display._y-=72
	display._x+= (posO.h - 42)
	buildO.buttons[buildO.point].dataO.tx.long = papyActro
	o.ctr.globalPause = false
	
	}
	
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		
		if(buildO.buttons[buildO.point].dataO.noHelper){
			helper.vanish()
		}else{
			helper.reveal()
		}
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
		makeDisplay()
	}
	
	function revisit(){
			core.panel.util.fx.PIFXback_basic(buildO.buttons)
	}
	
	function makeDisplay(){
		display.removeMovieClip()
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "displayPanel", this.getNextHighestDepth(), {o:o, actra:m.actra, dia:m.dia, horizon:posO, isLog:buildO.buttons[buildO.point].dataO.tx.isLog, longText:buildO.buttons[buildO.point].dataO.tx.long, iniText:buildO.buttons[buildO.point].dataO.tx.ini})
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