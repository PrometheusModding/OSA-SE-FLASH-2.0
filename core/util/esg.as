
class core.util.esg {

		
			public static function pantsFromCuirass(o, actra){
				if(o.cfg.config["cuirassHasPants"+actra.gender]=="1"&&actra.equip.attire.cuirassMulti!=1){
					return true
				}else{
					return false
				}
			}

		
}