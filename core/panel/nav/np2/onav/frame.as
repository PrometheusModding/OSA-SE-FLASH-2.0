import mx.utils.Delegate;

class core.panel.nav.np2.onav.frame extends MovieClip {

public var o
public var m
var tab
var bar
var brass

var dpage
var dpagebar
var dtabbar
var dgrid
var doption
var dbase
var dbrass

var dsn_move
var dsn_shift
var dsn_focus
var dsn_tog
var dsn_blocks
var dsn_blockm
var dsn_blockl
var dsn_blocke
var dsn_confirms
var dsn_confirmm
var dsn_confirml
var dsn_confirme
var dsn_cancel
		
var permX

var noBrassDesc

var tabDisplay


var enterFxPlay

//I have attached an invisible movie clip to this called vanisher to handle the vanishing, don't forget LOL
		function frame(){
		tabDisplay = []
		
	
		enterFxPlay = true
		noBrassDesc = false
		
		dpage = core.util.circuit.loadDefaults(o, m.dia.module, m.xml, "page")
		dpagebar = core.util.circuit.loadDefaults(o, m.dia.module, m.xml, "pagebar")
		dtabbar = core.util.circuit.loadDefaults(o, m.dia.module, m.xml, "tabbar")
		dgrid = core.util.circuit.loadDefaults(o, m.dia.module, m.xml, "grid")
		doption = core.util.circuit.loadDefaults(o, m.dia.module, m.xml, "option")
		dbrass = core.util.circuit.loadDefaults(o, m.dia.module, m.xml, "brass")
		dbase = core.util.circuit.loadDefaults(o, m.dia.module, m.xml, "base")

		m.ctr = m.attachMovie(m.frame+"_control", "ctr", m.getNextHighestDepth(), {o:o,m:m,f:this});
		
		
		buildTab()
		
		permX = _x
		m.ctr.init()
		m.ctr.firstLight()	
		

		if(m.dia.navVirgin==true){openFX();m.dia.navVirgin=false}		
		else{switchFX()}
		

	}	
	
	function inputSnd(type){
		if(!this["dsn_"+type]){
			o.xplat.sysoi(type)
		}
	}
	
	
	function firstLight(){
					m.tab[tab].firstLight()
				}
				
	function buildTab(){
		tab = []
		_y = Stage.height
		_y += -55
		_x += 15
		
		
		
		
		
		
		for (var i=0; i < m.xml.tab.length; i++){				
			
		var __tab
		
			 if(m.xml.tab[i].empty!=1){
			 
			 __tab = this.attachMovie("onav_page"+core.util.circuit.hasCustom(m, m.xml.tab[i], "dpage", dpage), "tog", this.getNextHighestDepth(), {o:o,m:m,f:this,x:m.xml.tab[i]})
			 
			 		
					if(!__tab.empty){
			 		tab.push(__tab)
					}else{
						if(m.xml.tab[i].empty="2"){ tabDisplay[i]=2}
						else{tabDisplay[i]=0}
					}
			 }else{
				 tabDisplay[i]=1
			 }
		}
		
		
		
		var extraTabs = []
		if(m.dia.observed){
			
			var obsTab = "<tab icon=\"sobs\" text=\"^^observer\"><hue n=\"hu\" cmd=\"rgb\" v=\"8BC541\"/><bnhue cmd=\"rgb\" v=\"8BC541\"/><page icon=\"mtri\"><hue n=\"hu\" cmd=\"rgb\" v=\"8BC541\"/><option halo=\"hclarity\" icon=\"osy_observer\" go=\"$ObsExit\" text=\"^^exitObservationMode\"><hhue n=\"hu\" cmd=\"rgb\" v=\"8BC541\"/></option></page></tab>"
			obsTab = o.makeEntry(obsTab)
			tab.push(this.attachMovie("onav_page"+core.util.circuit.hasCustom(m, obsTab.tab[0], "dpage", dpage), "tog", this.getNextHighestDepth(), {o:o,m:m,f:this,x:obsTab.tab[0]}))		 
			extraTabs.push(obsTab.tab[0])
		}
		
		
		
		
				bar = this.attachMovie("onav_signet"+core.util.circuit.hasCustom(m, m.xml, "dtabbar", dtabbar), "bar", this.getNextHighestDepth(), {o:o,m:m,f:this})
				bar.build(m.xml.tab, extraTabs)
				
				for (var i=0; i < tab.length; i++){	
						tab[i]._y += bar.outV
						tab[i].buildEnd()
				}
				
				
		
		
	}
	
	function openFX(){
		enterFxPlay = true
		var alphaTw = new mx.transitions.Tween(this, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, 1.6, true);
		var tabTw = new mx.transitions.Tween(bar, "_x", mx.transitions.easing.Strong.easeIn, -500, bar._x, 1.0, true);
		tab[m.ctr.tab].brass.desc_alpha = 0
		var nameTw = new mx.transitions.Tween(tab[m.ctr.tab].brass, "_x", mx.transitions.easing.Strong.easeIn, -500, tab[m.ctr.tab].brass._x, 1.0, true);
		var pageTw = new mx.transitions.Tween(tab[m.ctr.tab].peg, "_x", mx.transitions.easing.Strong.easeIn, -500, tab[m.ctr.tab].bar._x, 1.3, true);
		var gridTw = new mx.transitions.Tween(tab[m.ctr.tab].arr[tab[m.ctr.tab].cPage], "_x", mx.transitions.easing.Strong.easeIn, -500, tab[m.ctr.tab].arr[tab[m.ctr.tab].cPage]._x, 1.6, true);
		
		gridTw.onMotionFinished = Delegate.create(this, function ():Void {							
								enterFxPlay = false			
					})
	}
	
	
	
	function switchFX(){
		var alphaTw = new mx.transitions.Tween(this, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, 0.8, true);
		var tabTw = new mx.transitions.Tween(bar, "_x", mx.transitions.easing.Strong.easeIn, -200, bar._x, 0.3, true);
		tab[m.ctr.tab].brass.desc_alpha = 0
		var nameTw = new mx.transitions.Tween(tab[m.ctr.tab].brass, "_x", mx.transitions.easing.Strong.easeIn, -200, tab[m.ctr.tab].brass._x, 0.3, true);
		var pageTw = new mx.transitions.Tween(tab[m.ctr.tab].peg, "_x", mx.transitions.easing.Strong.easeIn, -200, tab[m.ctr.tab].bar._x, 0.5, true);
		var gridTw = new mx.transitions.Tween(tab[m.ctr.tab].arr[tab[m.ctr.tab].cPage], "_x", mx.transitions.easing.Strong.easeIn, -200, tab[m.ctr.tab].arr[tab[m.ctr.tab].cPage]._x, 0.7, true);
		
		gridTw.onMotionFinished = Delegate.create(this, function ():Void {							
								enterFxPlay = false			
					})
	}
	
	function updateDesc(newDesc){		
		tab[m.ctr.tab].brass.updateDesc(newDesc)
	}
	
	
	

}