import gfx.io.GameDelegate;
import gfx.controls.Button;
import skyui.widgets.WidgetBase;


class NP1PageControl extends MovieClip
{
	
public var m

public var Minu
public var BSel = 0
public var actraCur
public var XPack

	 	public function NP1PageControl(){
	
		}
		
		public function Init(){
		Minu["BT"+BSel].light()	
		}
		
		public function DY() : Void
		{
		m.ctr.GridOK(Minu["BT"+BSel].opDest())
		}


		public function DU() : Void {

				if (BSel < Minu.BCount-1) { 
				Minu["BT"+BSel].dim()
				BSel += 1;
				Minu["BT"+BSel].light()		
		
				
				m.ctr.updateDesc()
				GameDelegate.call("PlaySound", ["UIMenuFocus"]);
				}			
				else {XPack[1].pushXMenu("U")}

		}

		public function DD() : Void	{

				if (BSel > 0) { 
				Minu["BT"+BSel].dim()
				BSel -= 1;
				Minu["BT"+BSel].light()		
				
				m.ctr.updateDesc()
				GameDelegate.call("PlaySound", ["UIMenuFocus"]);
				}			
				else {XPack[1].pushXMenu("D")}
		}
	
		public function DR() : Void	{

				if (BSel < Minu.BCount-6){
				Minu["BT"+BSel].dim()
				BSel += m.MaxV-1;
				Minu["BT"+BSel].light()		
				
				
				m.ctr.updateDesc()
				GameDelegate.call("PlaySound", ["UIMenuFocus"]);
				
				
				} else {
					m.ctr.pushPage("R")
				}

		}
	
		public function DL() : Void{

				
					if (BSel> m.MaxV){
					Minu["BT"+BSel].dim()
					BSel += m.MaxV-1;
					Minu["BT"+BSel].light()					
					
					m.ctr.updateDesc()
					GameDelegate.call("PlaySound", ["UIMenuFocus"]);					
					
					} else {
						m.ctr.pushPage("L")
					}
			
		}
		
		public function DT() : Void{
			m.ctr.pushActra("R")			
		}
			
		public function Exit(): Void{
			Minu["BT"+BSel].dim()
		}
		
		public function Enter(): Void{
			m.ctr.updateDesc()
			Minu["BT"+BSel].light()
		}
			

}