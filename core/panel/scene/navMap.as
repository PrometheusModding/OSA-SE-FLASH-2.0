

class core.panel.scene.navMap extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description
var brass

var warpMode
var helpText

var display

var burstPanel
var burstIcoPin

var burstPanelText
var currentIco

var pandectMenu

	function navMap(){
				if(!o.lib.TLib.get(m.dia.module.id)){
					var scout = new Scout(o)
					var sourceBack = {fn:outTags, scope:this}
					scout.checkTags(m.dia.module.id, sourceBack)
				
				}else{outTags()}
	}
		
	function outTags(){
		warpMode = false
		burstPanel = this.attachMovie("bursterBox", "burster", this.getNextHighestDepth(), {o:o, offX:-170})
		

		burstIcoPin = this.createEmptyMovieClip("bursterPin", this.getNextHighestDepth())
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 7
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		


		brass = new core.panel.major.brass.typeA(o, this, posO, m.dataPin.name, "")

		posO.vStart = posO.v
		
		var dataO = []
		
			pandectMenu = m.dataPin.menuBlock
		
			
			dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
			
			var t1
			var t2
			var t3
			for (var i=0; i < pandectMenu.l0.length; i++){  		
				
				if(core.util.circuit.analyzeNav(o, m,  pandectMenu.l0[i]).op=="go"){	
						
				t1 = core.util.syntax.SynDesc(o, o.lib.translate(pandectMenu.l0[i].text, m.dia.module.id, "P"), pandectMenu.l0[i], o.lib.langP[m.dia.module.id], m.dia.actra)
				t2 = core.util.syntax.SynDesc(o, o.lib.translate(pandectMenu.l0[i].ex[0].text, m.dia.module.id, "P"), pandectMenu.l0[i].ex[0], o.lib.langP[m.dia.module.id], m.dia.actra)
				t3 = core.util.syntax.SynDesc(o, o.lib.translate(pandectMenu.l0[i].subtext, m.dia.module.id, "P"), pandectMenu.l0[i], o.lib.langP[m.dia.module.id], m.dia.actra)
				if(t3){
				t1 = t3+" | "+t1   
				}
				if(pandectMenu.l0[i].dynamicIcon[0]){
					dataO.push({cmd:{fn:pandectMenu.l0[i].fn}, hud:{panel:"_majorNavText"}, bt:{sy:"oconMiniDyna"}, data:pandectMenu.l0[i], tx:{desc:t1.toUpperCase(), ini:t2}, tag:{snd:"confirm", fn:pandectMenu.l0[i].fn, category:pandectMenu.l0[i].category}}) 	
				
				}else{
				dataO.push({cmd:{fn:pandectMenu.l0[i].fn}, hud:{panel:"_majorNavText"}, bt:{sy:"oconMiniCircle", b:pandectMenu.l0[i].i}, tx:{desc:t1.toUpperCase(), ini:t2}, tag:{snd:"confirm", fn:pandectMenu.l0[i].fn, category:pandectMenu.l0[i].category}}) 	
				}
				}
			}			
		
			
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].bt.sy, "option", this.getNextHighestDepth(), {o:o, _x:posO.h, _y:posO.v, posO:posO, homePanel:this, data:dataO[i].data, m:m, dataO:dataO[i], btGlobal:btGlobal})
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
		
		burstPanelText = this.createEmptyMovieClip("burstPanelText", this.getNextHighestDepth())
		burstPanel.offX = posO.h-70
		burstPanel.init()
			//helpText = this.attachMovie("helpTogTo", "helper", this.getNextHighestDepth(), {_x:20,_y:-435});
			//helpText.setTitle(o.cfg.lang.travel.toUpperCase())
			//helpText.setDesc(o.cfg.lang.togToChangeNav)

		buildO.concludeSetup()
		processShift()
	}	
	
	
	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn](0)
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
	
	public function anav(cmdIx){
			if(!m.dia.chore.autoNav.navAgenda[0]){
				if(buildO.buttons[buildO.point].cmd[cmdIx]=="warp"){
				    m.dia.menuSelection(buildO.buttons[buildO.point].cmdOut[cmdIx])
				}else if(buildO.buttons[buildO.point].cmd[cmdIx]=="travel"){
					m.dia.chore.autoNav.newAgenda(buildO.buttons[buildO.point].cmdOut[cmdIx])
					m.FullEscape()
				}
			}
	}

	
	public function navtag(cmdIx){
			var tag = {category:buildO.buttons[buildO.point].tags[0], dat:o.lib.TLib.get(m.dia.module.id)}
			if(buildO.buttons[buildO.point].cmd[cmdIx]=="warp"){
			
			var tagsOut = core.dias.util.calcTags.analyzeTags(tag)
			m.dia.menuSelection(tagsOut)
			}else if(buildO.buttons[buildO.point].cmd[cmdIx]=="travel"){				
			m.dia.chore.autoNav.newAgenda(core.dias.util.calcTags.analyzeTags(tag))
			m.FullEscape()
			}
	}
	
	
	
	
	function DT(){
		this[buildO.buttons[buildO.point].dataO.cmd.fn](1)
	}
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
		if(buildO.buttons[buildO.point].dataO.cmd.fn=="esc"){
			burstPanel._visible = false
			burstIcoPin._visible = false
			burstPanelText._visible = false
		}else{
			burstPanel._visible = true
			burstIcoPin._visible = true
			burstPanelText._visible = true
		}
	}
	


}