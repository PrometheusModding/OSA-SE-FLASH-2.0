import mx.utils.Delegate;

class core.panel.nav.np2.onav.control extends MovieClip
{
	
public var o
public var m
public var f

public var LockInput
public var MainText

var tab


var activeMenu

		



		public function control(){
			LockInput = false
			tab = 0
			
		}

		
		public function init(){
			
			core.panel.nav.np2.util.navStorageFunc.pro(o, m, f, m.dia.navStorage)


		f.tab[tab].light()
		f.bar.lit = tab
		f.bar.light(tab)
		
		if(f.tab[tab].noGrids){
			f.tab[tab].activeMenu.openMenu(1)
			
		}else{
		f.tab[tab].arr[f.tab[tab].cPage].light()
		}

		}
		
				
		function firstLight(){		
			f.firstlight()
		}
		
		
		function outputMenuSelection(option, x){
			if(option.dest){
			manageOuts(option, x)
			}
		
		}		
		
		function manageOuts(option, x){
			if(!x.out[0]){
				m.dia.navStorage = {has:true, cmd:[], actor:f.tab[tab].x.actor}
				m.dia.navStorage.cmd.push("$saveactor")
				lockAndGo(option)
			}else{
				
				this["out_"+x.out[0].cmd.toLowerCase()](option, x)
			}
		}
		
		
		
		function out_actionsave(option, x){
			m.dia.navStorage = {has:true, cmd:[], tab:tab, page:f.tab[tab].cPage, option:f.tab[tab].arr[f.tab[tab].cPage].ctr.point}
			m.dia.navStorage.cmd.push("$actionsave")
			lockAndGo(option)
		}
		
		function out_speedsave(option, x){
			m.dia.navStorage = {has:true, cmd:[], tab:tab, page:f.tab[tab].cPage, option:f.tab[tab].arr[f.tab[tab].cPage].ctr.point}
			m.dia.navStorage.cmd.push("$actionsave")
			lockAndGo(option)
		}
		
		function lockAndGo(x){
				LockInput = true
				m.dia.menuSelection(x.dest)
		}

		
		function pressTab(){			
			
			if(f.tab.length > 1){
					f.tab[tab].dim()
					
						if(tab >= f.tab.length-1){
						tab = 0
						}else{tab++}
					
					f.tab[tab].light()
					f.tab[tab].brass.lightTitle()
					f.bar.onTab(tab)
			}
			
		}
		
		
		
		function decideMenu(){
			if(!activeMenu){
				return f.tab[tab]
			}else{
				return activeMenu
			}
		}
		
				
		function DY(){
		if(key()){decideMenu().DY()}		
		}
		
		function DN(){
		if(key()){decideMenu().DN()}				
		}
		
		function DT(){
		if(key()){decideMenu().DT();
				
		}
		}
		
		function goTog(){
			pressTab();
			f.inputSnd("shiftt")
			f.updateDesc(getCursor().desc)
			
		}
		
		function DU(){
		if(key()){decideMenu().DU()}				
		}

		function DD(){
		if(key()){decideMenu().DD()}			
		}
		
		function DL(){
		if(key()){decideMenu().DL()}			
		}
		
		function edgeL(){
			
			if(f.tab[tab].arr.length == 1){decideMenu().wrapL()}
			else{
				if(f.tab[tab].cPage <= 0){
				f.tab[tab].selectPage(f.tab[tab].arr.length-1)
				}else{f.tab[tab].selectPage(f.tab[tab].cPage-1)}
				f.tab[tab].arr[f.tab[tab].cPage].edgeWrap("L")
					//Sound
					f.inputSnd("shiftm")
			}
		}
		
		

		function DR(){
		if(key()){decideMenu().DR()}			
		}
		
		function edgeR(){
			if(f.tab[tab].arr.length == 1){decideMenu().wrapR()}
			else{
				if(f.tab[tab].cPage >= f.tab[tab].arr.length-1){
				f.tab[tab].selectPage(0)
				}else{f.tab[tab].selectPage(f.tab[tab].cPage+1)}
				f.tab[tab].arr[f.tab[tab].cPage].edgeWrap("R")
					//Sound
					f.inputSnd("shiftm")
			}
		}
		
		
		
		function getCursor(){
			return f.tab[tab].arr[f.tab[tab].cPage].arr[f.tab[tab].arr[f.tab[tab].cPage].ctr.point]
			
		}

			function key(){
				if(!LockInput){
				var allow = true		
				allow = f.vanisher.resetVanisher()
				return allow
				}else{return false}
			}

}