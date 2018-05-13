

class core.panel.major.esgMap extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description
var brass
var display

var gen

var unsavedChanges
var popup
var helpText

		function esgMap(){
			
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 8
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		
		
		unsavedChanges = false
		popup = false
		
		gen = m.dataPin.gen
		if(gen==1){brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.esg+" | "+o.cfg.lang.female+" | "+o.cfg.lang.config.toUpperCase(), "")}
		else{brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.esg+" | "+o.cfg.lang.male+" | "+o.cfg.lang.config.toUpperCase(), "")}
		posO.vStart = posO.v
		
		var dataO = []
				
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		var esgType
		var description
		for (var i=0; i < 32; i++){
		esgType = o.cfg.esg.getEsg(i, gen)
		if(esgType){description=o.cfg.esg.getEsgName(esgType, gen)+" | "+o.cfg.lang.slot+" "+(Number(i)+Number(30))}
		else{description = o.cfg.lang.noEsgAssigned+" | "+o.cfg.lang.slot+" "+(Number(i)+Number(30))}
		
		dataO.push({cmd:{fn:"setEsg", fnTog:"exc"}, esg:{slot:i, gen:gen, type:esgType}, bt:{sy:"oconMiniCircleESG"}, tx:{desc:description}})			
		}
		
		dataO.push({cmd:{fn:"save", out:"esgMapExclude"}, bt:{sy:"oconMiniCircle", b:"omu_floppydisk"}, tx:{desc:o.cfg.lang.saveSettings.toUpperCase()}})
		dataO.push({cmd:{fn:"clearESG", out:"esgMapExclude"}, bt:{sy:"oconMiniCircle", b:"omu_bomb"}, tx:{desc:o.cfg.lang.clearAll.toUpperCase()}})
		dataO.push({cmd:{fn:"setDef", out:"esgMapExclude"}, bt:{sy:"oconMiniCircle", b:"omu_default"}, tx:{desc:o.cfg.lang.restoreToDefaults.toUpperCase()}})
				
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
		
		helpText = this.attachMovie("helpTogTo", "helper", this.getNextHighestDepth(), {_x:20,_y:-535});
		helpText.setTitle(o.cfg.lang.exclude.toUpperCase())
		helpText.setDesc(o.cfg.lang.togToExcludeSlot)
	}	
	
	
	function clearESG(){
		for (var i=1; i < 33; i++){
			buildO.buttons[i].setAll()
		}

		unsavedChanges = true
	}
	
	function setDef(){
		clearESG()
		
		var esgData
		if(!o.cfg.xconfig.esg[0].defaultMap[gen].v){
		esgData = "helmet,x,cuirass,gloves,x,necklace,rings,boots,x,shield,x,x,x,earrings,glasses,intlow,pants,x,miscup,miscmid,x,x,x,misclow,stockings,x,inthigh,cape,x,miscarms,x,x"
		esgData = esgData.split(",")
		}else{
		var esgData = o.cfg.xconfig.esg[0].defaultMap[gen].v.split(",")
		}
		
		var esgExclude 
		if(!o.cfg.xconfig.esg[0].defaultExclude[gen].v){
		esgExclude = "61"
		esgExclude = esgExclude.split(",")
		}else{
		esgExclude = o.cfg.xconfig.esg[0].defaultExclude[gen].v.split(",")
		}
		
		
		for (var i=1; i < 33; i++){
				if(esgData[i-1]!="x"){
				buildO.buttons[i].setESG(esgData[i-1])
				}
		}

		for (var i=0; i < esgExclude.length; i++){
			buildO.buttons[esgExclude[i]-29].setExclude()
		}
	}
	
	function DY(){
	   if(!popup){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	   }else{
		  o.xplat.sysoi("menuback")
		  popup=false 
		  o.hud.specialPanel.removeMovieClip()
	   }
	}
	
	function DT(){
	   if(!popup){
	   this[buildO.buttons[buildO.point].dataO.cmd.fnTog]()
	   }else{
		 o.xplat.sysoi("bigyes")
		o.hud.specialPanel.removeMovieClip()
		save()
		exitMenu()
	   }
	}
	
	function DN(){
		if(!popup){
		   if(unsavedChanges){
			popup=true
			core.util.specialPanel.saveChanges(o, o.cfg.lang.unsavedChanges, o.cfg.lang.unsavedChangesEx)
		   }else{exitMenu()}
		}else{
			o.xplat.sysoi("bigno")
		   o.hud.specialPanel.removeMovieClip()
		   exitMenu()
		}
	}
	
	function exitMenu(){
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	
	function esc(){DN()}
	
	function adv(){
	o.xplat.sysoi("menuforward")
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function exc(){	   
	  o.xplat.sysoi("confirml")
	   unsavedChanges = true
	   buildO.buttons[buildO.point].setExclude()
	}
	
	function setEsg(){
	o.xplat.sysoi("confirmm")
	m.dataPin={gen:gen, btRef:buildO.buttons[buildO.point], panel:this}
	m.advancePanelFade("majorEsgSelect")
	}
	
	function save(){
		o.xplat.sysoi("aware")
		core.util.specialPanel.onotice(o,"settingsSaved",true,true)
		var saveString = ""
		
		for (var i=1; i < 33; i++){
			if(buildO.buttons[i].esgVal){
				saveString += ","+buildO.buttons[i].esgVal
			}else{
				saveString += ",x"
			}
		}
		saveString += "!"
		for (var i=1; i < 33; i++){
			if(buildO.buttons[i].exclude){
				saveString += Number(i+29)+","
			}
		}
		
		saveString = saveString.substring(1, saveString.length-1)
		
		o.cfg.config.saveESG(saveString, gen)
		unsavedChanges = false
		
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