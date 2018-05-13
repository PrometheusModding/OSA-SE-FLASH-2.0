

class core.panel.major.control extends MovieClip {


public var o
public var m

var Engaged = false


		public function DY() : Void{
			trace("DY")
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