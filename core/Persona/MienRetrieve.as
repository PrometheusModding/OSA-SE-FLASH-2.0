
class MienRetrieve
{
	
var o
var callBack

		public function MienRetrieve(core, mienDrive, mienClass, mienId, cB){
		o = core
		callBack = cB
		var longEx = {fn:exMien, scope:this}
		o.lib.getMotifData(longEx, mienDrive, "mien", mienClass, mienId)		
		}				
		
		function exMien(){
		
		
		}

		
}