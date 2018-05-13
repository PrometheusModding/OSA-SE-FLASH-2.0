import gfx.io.GameDelegate;
import gfx.controls.Button;
import skse; 
import XMLParser;
import mx.utils.Delegate;
import skyui.widgets.WidgetBase;
import ODelegate

class SP1Control extends MovieClip
{
public var o
public var m
public var dia

var Engaged = false

		public function SP1Control(){
			
		}

		public function DY() : Void{
				m.dim()
				ActiveMenu().DY()
		}

		public function DT() : Void{		
				ActiveMenu().DT()
		}
		
		public function DN() : Void{		
				ActiveMenu().DN()
		}
		
		
		public function engage(){
				m.OmniLight()
				Engaged = true
		}
		
		public function disengage(){
				m.OmniDim()
				Engaged = false
		}
		
		public function DU() : Void{
				ActiveMenu().DU()
		}

		public function DD() : Void	{
				ActiveMenu().DD()	
		}
	
		public function DR() : Void
		{
			     ActiveMenu().DR()
		}
	
		public function DL() : Void{
				ActiveMenu().DL()
		}
		
		public function ActiveMenu(){
			return m
		}
		
		

}