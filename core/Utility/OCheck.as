
class OCheck
{


		
		public static function makeCheck(o, dia, checkUnit){
		
		return OCheck[checkUnit.id](o, dia, checkUnit)	
		}
		
		public static function esgOn(o, dia, checkUnit){
			if(o.cfg.config.hideUnwornESG == 1){
		
			return dia.actra[checkUnit.a].equip.attire.hasEsg(checkUnit.esg)					
			}else{
			return true	
			}
		}
		
		public static function wepOn(o, dia, checkUnit){
			if(o.cfg.config.hideUnwornESG == 1){
		    return dia.actra[checkUnit.a].equip.armament.wornWeapon()					
			}else{
			return true	
			}
		}
		
		public static function plugin(o, dia, checkUnit){
		    return o.scan.hasPlugin(dia.module.id, checkUnit.plugin)					
					
		}
		
}	


