
class Mien
{
	
var o
var actra
var mienEffect
var mien
var drive
var recover = false

		public function Mien(core, act, effect, driveType, mienClass, recoverToggle){
		o = core
		actra = act
		mienEffect = effect
		drive = driveType
		mien = mienClass
		recover = recoverToggle
		
			if(!actra.formBound){
				if(!actra.dat.personaData){
				var scout = new Scout(o)
				var sourceBack = {fn:personaIsLoaded, scope:this}
				scout.retrieveActraData("persona", actra, sourceBack)
				}else{actra.formBind()
				personaIsLoaded()
				}
			}else{personaIsLoaded()}
		
		}				
		
		public function personaIsLoaded(){
			
			var longEx = {fn:exMien, scope:this}
			o.lib.getMotifData(longEx, drive, "mien", actra.persona[drive].mien, mien)
		}
		
		function exMien(){
			var mienUnitEx = o.lib.getMotif(drive, "mien", actra.persona[drive].mien, mien).ex[0]
			for (var i=0; i < mienUnitEx.mien.length; i++){
			actra.expression.mien(mienUnitEx.mien[i])
			}
			
			if(recover){recoverMien(mienUnitEx)}
		}
		
		function recoverMien(mienUnitEx){
			
			for (var i=0; i < mienUnitEx.mien.length; i++){
					if(mienUnitEx.mien[i].re){ 
					var restore = []
					restore[0] = mienUnitEx.mien[i]
					var time = new OTime({fn:exMienOut, scope:this}, mienUnitEx.mien[i].re*1000, restore)
					}
			}
		}
		
		function exMienOut(mienUnit){
			actra.expression.mienEnd(mienUnit.ty, mienUnit.sy)
		}
		
}