

class core.util.circuit {

	
			public static function analyzeNav(o, m, x){
				var analyze = {op:"go", reasons:[]}
				
					for (var i=0; i < x.cond.length; i++){
						core.audit.analyzer.doCondition(analyze, o, m.dia, x.cond[i])
					}
			
					return analyze
			}
			
			public static function hasPanel(m, panel, level, def){
			 if(level[panel]){return m.frame+"_"+level[panel]}
			 else{return m.frame+"_"+def}
			}
			
			
			public static function loadDefaults(o, module, nav, prop){
			    if(nav.defaults[0][prop]){return nav.defaults[0][prop]}
				else if(module.nav[0].np2[0].onav[0][prop]){return module.nav[0].np2[0].onav[0][prop]}
				else{return ""}	
			}
			
			public static function hasCustom(m, level, custom, def){
			 if(level[custom]){return level[custom]}
			 else{return def}
			}
		
}