

class core.panel.pro.util.procmd
{
	
			
			
			public static function command(o, actra, v){
				return core.panel.pro.util.procmd[v](o, actra, v)
			}
			
			public static function weight(o, actra, arr){
				
				if(!actra.profile.profileData.command[0].weight[0].v){	
					if(o.cfg.config.metricMode==1){
						return Math.floor(core.util.units.weightUSAtoMetric(actra.body.weightEarthOrig))+" kg"								
					}else{
						return Math.floor(actra.body.weightEarthOrig)+" Pounds"
					}
				}else if(actra.profile.profileData.command[0].weight[0].units!="1"){return core.panel.pro.util.profunc.proscan(o, actra, actra.profile.profileData.command[0].weight[0].v)}	
				else{
						if(o.cfg.config.metricMode==1){
							return Math.floor(core.util.units.weightUSAtoMetric(actra.profile.profileData.command[0].weight[0].v))+" kg"								
						}else{
							return Math.floor(actra.profile.profileData.command[0].weight[0].v)+" Pounds"
						}					
				}
				
			}
			
			public static function height(o, actra, arr){
				
				if(!actra.profile.profileData.command[0].height[0].v){	
					if(o.cfg.config.metricMode==1){
						return core.util.units.heightSkyToMetric(actra.body.bodyScale, Number(o.cfg.units.height[actra.gender].ratioVirtualToEarth), true)								
					}else{
						return core.util.units.heightSkyToUSA(actra.body.bodyScale, Number(o.cfg.units.height[actra.gender].ratioVirtualToEarth), true)
					}
				}else if(actra.profile.profileData.command[0].height[0].units!="1"){return core.panel.pro.util.profunc.proscan(o, actra, actra.profile.profileData.command[0].height[0].v)}	
				else{
						if(o.cfg.config.metricMode==1){
							return String(core.util.units.inchesToMeters(actra.profile.profileData.command[0].height[0].v)).substr(0,4)+" m"								
						}else{
							return core.util.units.inchesToFeet(actra.profile.profileData.command[0].height[0].v)
						}
					
				}
			}
			
			public static function race(o, actra, arr){							
					if(!actra.profile.profileData.command[0].race[0].v){return actra.race}					   
					else{return core.panel.pro.util.profunc.proscan(o, actra, actra.profile.profileData.command[0].race[0].v)}		
			}
			
			public static function name(o, actra, arr){				
					if(!actra.profile.profileData.command[0].name[0].v){return actra.name}					   
					else{return core.panel.pro.util.profunc.proscan(o, actra, actra.profile.profileData.command[0].name[0].v)}		
			}
			
			
			
			
}