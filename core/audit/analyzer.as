
class core.audit.analyzer
{


		
		public static function doCondition(analyze, o, dia, cond){		
		core.audit.analyzer[cond.cmd.toLowerCase()](analyze, o, dia, cond)	
		}
		
		public static function esgworn(analyze, o, dia, cond){
			if(o.cfg.config.hideUnwornESG == 1){
					if(!dia.actra[cond.a].equip.attire.hasEsg(cond.esg)){
					analyze.op = "deny"
					analyze.reasons.push(o.cfg.lang.cndExConfigHideUnwornESG+" "+dia.actra[(cond.a)]+" "+o.cfg.lang.cndExNoEsgWorn+" "+o.cfg.lang.esg[(cond.esg)])
					}
			}
		}
		
		public static function esgwepworn(o, dia, cond){
			if(o.cfg.config.hideUnwornESG == 1){
		    return dia.actra[cond.a].equip.armament.wornWeapon()					
			}else{
			return true	
			}
		}
		
		public static function plugin(analyze, o, dia, cond){
			
			if(!o.scan.hasPlugin(dia.module.id, cond.id)){
				analyze.op = "deny"
				
				analyze.reasons.push(o.cfg.lang.cndExNoPlugin+": "+cond.id)
			}			
					
		}
		
}	


