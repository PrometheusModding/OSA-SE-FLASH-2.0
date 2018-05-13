

class core.panel.scene.main extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass


	function main(){
		if(!o.lib.PLib.get(m.dia.module.id)){
				var scout = new Scout(o)
				var sourceBack = {fn:buildMenu, scope:this}
				scout.checkPandect(m.dia.module.id, sourceBack)
				
			}else{buildMenu()
			
			}
	}
	
	function buildMenu(){
		
	
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 4
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.sceneMenu.toUpperCase(), "")

		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_btno"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		
		
		dataO.push({cmd:{fn:"adv", out:"majorMain"}, bt:{b:"omu_majormenu"}, tx:{desc:o.cfg.lang.majorMenu.toUpperCase()}}) 	
		
		if(o.lib.PLib.get(m.dia.module.id).navmenu[0]){ 
		dataO.push({cmd:{fn:"adv", out:"sceneNavMap", type:"navigate"}, bt:{b:"omu_nav"}, tx:{desc:o.cfg.lang.navigate.toUpperCase()}}) 		
		}
		
		if(o.lib.PLib.get(m.dia.module.id).roulettemenu[0]){
		dataO.push({cmd:{fn:"adv", out:"sceneNavMap", type:"roulette"}, bt:{b:"omu_spade"}, tx:{desc:o.cfg.lang.roulette.toUpperCase()}})
		}
		
		if(m.dia.actra.length>1){
		dataO.push({cmd:{fn:"adv", out:"sceneArrange"}, bt:{b:"omu_arrange"}, tx:{desc:o.cfg.lang.arrange.toUpperCase()}})
		}
		dataO.push({cmd:{fn:"adv", out:"sceneLights"}, bt:{b:"omu_lightbulb"}, tx:{desc:o.cfg.lang.lights.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"sceneEquip"}, bt:{b:"omu_shirt"}, tx:{desc:o.cfg.lang.equipment.toUpperCase()}})		
		dataO.push({cmd:{fn:"adv", out:"sceneInfo"}, bt:{b:"omu_info"}, tx:{desc:o.cfg.lang.info.toUpperCase()}})
		
			
		if(dataO.length<=6){
			buildO.maxCol = 10
		}
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie("oconMiniCircle", "option", this.getNextHighestDepth(), {o:o, _x:posO.h, _y:posO.v, dia:m.dia, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
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
	

	
	function inspect(){
		if(o.actro.get("00000007")){
		o.ctr.INSPECT("00000007")
		}else{
		o.skyAll("0SC_InspectActraTrue", "", 0.0, "20")	
		}
	}
	
	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	}
	
	function DN(){
	   o.xplat.sysoi("menuback")
	   m.endMenu()
	}
	function esc(){DN()}
	
	function adv(){
	 o.xplat.sysoi("confirms")
	 
			if(buildO.buttons[buildO.point].dataO.cmd.out=="sceneNavMap"){
			
			var pandectData = o.lib.PLib.get(m.dia.module.id) 
				
				if(buildO.buttons[buildO.point].dataO.cmd.type=="roulette"){
				pandectData = pandectData.roulettemenu[0] 
				m.dataPin={type:buildO.buttons[buildO.point].dataO.cmd.type, name:o.cfg.lang.roulette.toUpperCase(), menuBlock:pandectData} 	
				}else{
				pandectData = pandectData.navmenu[0] 
				m.dataPin={type:buildO.buttons[buildO.point].dataO.cmd.type, name:o.cfg.lang.navigation.toUpperCase(), menuBlock:pandectData} 
				}
			}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	
	}
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function revisit(){
			core.panel.util.fx.PIFXback_basic(buildO.buttons)
	}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
	}
	
	function appear(){
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}

}