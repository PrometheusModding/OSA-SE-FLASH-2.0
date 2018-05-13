import gfx.io.GameDelegate;
import gfx.controls.Button;
import skse; 
import XMLParser;
import mx.utils.Delegate;
import skyui.widgets.WidgetBase;
import ODelegate

class NP1Control extends MovieClip
{
public var o
public var m
public var dia

public var LockInput
public var MainText

public var actraMenuTotal

var SelActra
var SelPage
var SelLoc

		public function NP1Control(){
			LockInput = false
			SelActra = 0
			SelPage = 0
			SelLoc = 0
		}

		
		public function Init(){
			if (dia.navStorage){
				for (var i=0; i < dia.actra.length; i++){
					if (m.Panel["AG"+i].actraRole == dia.navStorage.actor){	
					SelActra = i				
					}
				}
			}
			dia.navStorage = undefined
		
		m.Panel["ATab"+SelActra].light()
		m.Panel["AG"+SelActra].light()
		m.Panel["AG"+SelActra]["PG"+SelPage].light()
		m.Panel["AG"+SelActra]["PTab"+SelPage].light()			
		}
		
		public function updateDesc(){
		m.TextPanel.updateDescTx("")
		var ULoc = m.Panel["AG"+SelActra]["PG"+SelPage].ctr.BSel
		if (m.Panel["AG"+SelActra]["PG"+SelPage]["BT"+ULoc].desc){
		m.TextPanel.updateDescTx(m.Panel["AG"+SelActra]["PG"+SelPage]["BT"+ULoc].desc)
		}
		
		}
		
		public function updateActraText(){
			
		m.TextPanel.updateActraTx(m.Panel["ATab"+SelActra].actraName)
		}

		public function DY() : Void{
			if (LockInput != true){
				ActiveMenu().DY()
			}
		}

		public function DT() : Void{		
			if (LockInput != true){
				ActiveMenu().DT()

			}
		}
		
		public function DN() : Void{		
			if (LockInput != true){
				ActiveMenu().DN()

			}
		}
		
		public function pushActra(Side){
			if (Side == "R"){
				m.Panel["ATab"+SelActra].dim()
			m.Panel["AG"+SelActra].dim()
			m.Panel["AG"+SelActra]["PG"+SelPage].dim()
			m.Panel["AG"+SelActra]["PTab"+SelPage].dim()
	
			if (SelActra+1 >= actraMenuTotal) {
			SelActra = 0
			} else {
			SelActra += 1;
			}
			SelPage = 0;
			
			m.Panel["ATab"+SelActra].light()
			m.Panel["AG"+SelActra].light()
			m.Panel["AG"+SelActra]["PG"+SelPage].light()
			m.Panel["AG"+SelActra]["PTab"+SelPage].light()
			
			updateActraText()
			updateDesc()
			GameDelegate.call("PlaySound", ["UIMenuFocus"]);
			}			
		}

			public function pushXMenu(Side){
			if (Side == "U"){

			}			
		}

		public function cmdCurMenu(command){
			m.Panel["AG"+SelActra].XPath(SelActra,SelPage)[command]()
		}

		public function ActiveMenu(){
		return m.Panel["AG"+SelActra].XPath(SelActra,SelPage)	
		}

		public function DU() : Void{
			if (LockInput != true){
				ActiveMenu().DU()
			}
		}

		public function DD() : Void	{
			if (LockInput != true){
				ActiveMenu().DD()	
			}
		}
	
		public function DR() : Void
		{
			if (LockInput != true){
			ActiveMenu().DR()
			}
		}
	
		public function DL() : Void{
			if (LockInput != true){
				ActiveMenu().DL()
			}
		}
		
		public function GridOK(BTSelection){
			LockInput = true
			trace("THIS IS THE SELLOCK: "+BTSelection)
			dia.menuSelection(BTSelection)
		}
		
		public function pushPage(Side): Void{
					if (Side == "R"){
						trace("PageActual"+m.Panel["AG"+SelActra].pageActual+" SELPAGE"+ SelPage)
						m.Panel["AG"+SelActra]["PG"+SelPage].dim()
						m.Panel["AG"+SelActra]["PTab"+SelPage].dim()

						
						if (SelPage >= m.Panel["AG"+SelActra].pageActual-1) {
						SelPage = 0
						} else {
						SelPage += 1
						}

						
						m.Panel["AG"+SelActra]["PG"+SelPage].light()
						m.Panel["AG"+SelActra]["PTab"+SelPage].light()
	
						
						updateDesc()
						GameDelegate.call("PlaySound", ["UIMenuFocus"]);
					}
					else if (Side == "L"){
						m.Panel["AG"+SelActra]["PG"+SelPage].dim()
						m.Panel["AG"+SelActra]["PTab"+SelPage].dim()

						if (SelPage <= 0) {
						SelPage = (m.Panel["AG"+SelActra].pageActual-1)
						} else {
						SelPage -= 1
						}

						
						m.Panel["AG"+SelActra]["PG"+SelPage].light()
						m.Panel["AG"+SelActra]["PTab"+SelPage].light()

						
						updateDesc()
						GameDelegate.call("PlaySound", ["UIMenuFocus"]);
						
					}
		}

}