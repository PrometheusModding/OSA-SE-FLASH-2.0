class XMSpeedControl extends MovieClip
{


public var o
public var m
public var dia

public var Minu
public var XPack
public var SP
public var CurSpeed 
var BSel = 0

		function XMSpeedControl(){
			}
			
		public function Init(){
			Minu.dimText()
		}
		
		public function DY() : Void	{
			this[Minu.BT[BSel].cmd]()	
		}
		
		public function plus(){
			dia.scena.speedAdjust(1)
		}
		
		public function minus(){
			dia.scena.speedAdjust(-1)
		}
		

		
		public function DR() : Void	{
			if (BSel < Minu.BTCount-1){
				Minu.BT[BSel].dim()
				BSel ++;
				m.TextPanel.updateDescTx(Minu.BT[BSel].desc)
				Minu.BT[BSel].light()
				}
		}
	
		public function DL() : Void{
				if (BSel > 0){
				Minu.BT[BSel].dim()
				BSel --;
				m.TextPanel.updateDescTx(Minu.BT[BSel].desc)
				trace("THIS IS WHAT IT WANTS TO UPDATED: "+m.TextPanel.updateDescTx)
				Minu.BT[BSel].light()
				}
		}

		public function DU() : Void {
				XPack[1].pushXMenu("U")
		}

		public function DD() : Void	{
				XPack[1].pushXMenu("D")
		}
		
		public function DT() : Void{
				m.ctr.pushActra("R")			
		}


		
		public function Exit(): Void{
			Minu.dimText()
			Minu.BT[BSel].dim()
		}
		
		public function Enter(): Void{
			Minu.lightText()
			m.TextPanel.updateDescTx(Minu.BT[BSel].desc)
			Minu.BT[BSel].light()
		}		
		
}