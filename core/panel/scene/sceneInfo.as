

class core.panel.scene.sceneInfo extends MovieClip {


public var o
public var m


var buttonFont

var description

var helpText

var actraMenu
var cur

var display

		function info(){
	
			actraMenu = []
			cur = 0
			for (var i=0; i < m.dia.actra.length; i++){
				actraMenu[i] = this.createEmptyMovieClip("am", this.getNextHighestDepth(), {posO:undefined, buildO:undefined, brass:undefined, dataO:undefined}); 
				//actraMenu[i] = {posO:undefined, buildO:undefined, brass:undefined, dataO:undefined}
				buildActraMenu(i, actraMenu[i])
				actraMenu[i]._visible = false
			}
			
			helpText = this.attachMovie("helpTogTo", "helper", this.getNextHighestDepth(), {_x:-130,_y:-635});
			helpText.setTitle((m.actra.name).toUpperCase())
			helpText.setDesc(o.cfg.lang.togToChangeActra)
			
			processShift()
			actraMenu[cur]._visible = true
			
		}
		
		function buildActraMenu(ix, amu){
		
		var actra = m.dia.actra[ix]
		
		amu.buildO = new core.panel.button.builder4D()
		amu.buildO.maxCol = 7
		
		amu.posO = new core.panel.button.positioner()
		amu.posO.vOff = -50
		amu.posO.hOff = -50
		amu.posO.btWidth = 18		


		amu.brass = new core.panel.major.brass.typeA(o, amu, amu.posO, o.cfg.lang.equipment.toUpperCase(), "")
		amu.posO.vStart = amu.posO.v
		
		amu.dataO = []
		
		amu.dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		amu.dataO.push({cmd:{fn:"adv" out:"panel"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.overview.toUpperCase()}})
		amu.dataO.push({cmd:{fn:"adv" out:"panel"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.profile.toUpperCase()}})
		amu.dataO.push({cmd:{fn:"adv" out:"panel"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.biography.toUpperCase()}})
		
		
		
		
		
		slideMenu.dat.push({txt:o.cfg.lang.overview.toUpperCase(), id:"SP1ActraInfoOverview", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.profile.toUpperCase(), out:""})
			slideMenu.dat.push({txt:o.cfg.lang.biography.toUpperCase(), id:"SP1ActraInfoBio", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.sounds.toUpperCase(), id:"SP1ActraInfoSounds", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.equipment.toUpperCase(), id:"SP1ActraInfoEquipment", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.reaction.toUpperCase(), id:"SP1ActraInfoReaction", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.personaClass.toUpperCase(), id:"SP1ActraInfoPersonaClass", xPos:offSetX, yPos:-150, out:""})			
			slideMenu.dat.push({txt:o.cfg.lang.naturalScale.toUpperCase(), id:"SP1ActraInfoProportions", xPos:offSetX, yPos:-150, cmd:"orig"})
			slideMenu.dat.push({txt:o.cfg.lang.currentScale.toUpperCase(), id:"SP1ActraInfoProportions", xPos:offSetX, yPos:-150, cmd:"current"})
			slideMenu.dat.push({txt:o.cfg.lang.technical.toUpperCase(), id:"SP1ActraInfoTechnical", xPos:offSetX, yPos:-150, out:""})
			slideMenu.dat.push({txt:o.cfg.lang.exit.toUpperCase(), fn:"DN", out:""})
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < amu.dataO.length; i++){
			if(amu.buildO.col < amu.buildO.maxCol){
			amu.buildO.buttons[i] = amu.attachMovie(amu.dataO[i].hud.sy, "option", amu.getNextHighestDepth(), {o:o, m:m, actra:actra, _x:amu.posO.h, _y:amu.posO.v, posO:amu.posO, dataO:amu.dataO[i], btGlobal:btGlobal})
			amu.posO.v += amu.posO.vOff
			amu.buildO.col++
			}else{
			amu.buildO.row++
			amu.buildO.col=0
			amu.posO.v = amu.posO.vStart
			amu.posO.h += amu.posO.hOff
			i--
			}
			
		}
		
		
		amu.buildO.concludeSetup()

	}	
	
	
	function DY(){
	   this[actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.cmd.fn]()
	}
	
	function DN(){
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	
	function esc(){DN()}
	
	function adv(){
	o.xplat.sysoi("menuforward")
	m.advancePanelFade(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.cmd.out)
	}
	
	
	function DT(){
		o.xplat.sysoi("shifta")
		m.pushActra()
	}
	
	
		
	function reparse(){
			var newPoint = actraMenu[cur].buildO.point
			actraMenu[cur].removeMovieClip()
			actraMenu[cur] = this.createEmptyMovieClip("am", this.getNextHighestDepth(), {posO:undefined, buildO:undefined, brass:undefined, dataO:undefined}); 
			buildActraMenu(cur, actraMenu[cur])
			actraMenu[cur].buildO.jumpPoint(newPoint)
			processShift()
	}
	
	function DU(){actraMenu[cur].buildO.DU();processShift()}
	
	function DD(){actraMenu[cur].buildO.DD();processShift()}
	
	function DL(){actraMenu[cur].buildO.DL();processShift()}
	
	function DR(){actraMenu[cur].buildO.DR();processShift()}
	

	function newActra(pointer){
			actraMenu[cur]._visible = false			
			var point = actraMenu[cur].buildO.point
			cur = m.tabActra
			actraMenu[cur].buildO.jumpPoint(point)
			actraMenu[cur]._visible = true			
			helpText.setTitle((m.actra.name).toUpperCase())
			processShift()
	}
	
	function revisit(){
		if(cur!=m.tabActra){newActra()}
	}
	function processShift(){
		actraMenu[cur].brass.setDescription(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.tx.desc.toUpperCase())
		makeDisplay()
	}
	
	function makeDisplay(){
		display.removeMovieClip()
		display = this.attachMovie(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].amu.dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:m.actra, _x:actraMenu[cur].posO.h, horizon:actraMenu[cur].posO, iniText:actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.tx.ini})
		display._y-=72
		display._x-=42
		display.buildFull()
	}

}