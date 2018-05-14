class core.actor.util.func
{
	
	
		public static function assignMinorRGB(o, actra){
			core.actor.util.func.assignRGB(o, actra, "ha", "hair", actra.gfx.gfxData.hairRGB[0].v)			
			core.actor.util.func.assignRGB(o, actra, "li", "lips", actra.gfx.gfxData.lipsRGB[0].v, actra.profileData.properties[0].tenderRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "ey", "eyes", actra.gfx.gfxData.eyesRGB[0].v)
			
			if(!actra.gfx.niRGB){
			core.actor.util.func.assignRGB(o, actra, "ni", "nipple", actra.gfx.gfxData.nippleRGB[0].v, actra.profileData.properties[0].tenderRGB[0].v)
			}
			core.actor.util.func.assignRGB(o, actra, "el", "eyeliner", actra.gfx.gfxData.eyelinerRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "es", "eyeshadow", actra.gfx.gfxData.eyeshadowRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "bs", "blush", actra.gfx.gfxData.blushRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "np", "nailpolish", actra.gfx.gfxData.nailpolishRGB[0].v)
			
			core.actor.util.func.assignRGB(o, actra, "bl", "blood", actra.gfx.gfxData.bloodRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "br", "bruise", actra.gfx.gfxData.bruiseRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "cm", "ejaculate", actra.gfx.gfxData.ejaculaterRGB[0].v)
		}
		
		
		public static function rgbCmd(o, actra, id, prop, v, type){			
			if(v.substr(0,1)=="$"){
				actra.gfx[id+"RGB"] = new flash.geom.ColorTransform
				actra.gfx[id+"RGB"].rgb = actra.gfx[v.substr(1)+"RGB"].rgb
				actra.gfx[id+"RGB"].from = type+" cmd ref: "+v
				return true
			}else{return false}
		}
		

		
		public static function assignRGB(o, actra, id, prop, v, bak){
				
				if(v){								
					
					if(rgbCmd(o,actra,id,prop,v,"gfx.xml")){

					}else if(o.cfg.config.logging){actra.log.addLog("gfx", prop.toUpperCase()+" | "+v)}
					
							actra.gfx[id+"RGB"] = new flash.geom.ColorTransform
							actra.gfx[id+"RGB"].rgb = "0x"+v
							actra.gfx[id+"RGB"].from = "gfx.xml"
					
				}else if(bak){
					if(o.cfg.config.logging){actra.log.addLog("gfx", prop.toUpperCase()+" | (Not Found, using Back-Up): "+bak)}
					
							actra.gfx[id+"RGB"] = new flash.geom.ColorTransform
							actra.gfx[id+"RGB"].rgb = "0x"+bak
							actra.gfx[id+"RGB"].from = "gfx.xml as a (Backup Hue)"
					
				}else{
						if(o.cfg.config.logging){actra.log.addLog("gfx", prop.toUpperCase()+"| Has no gfx.xml entry and no backup. Using customizer.xml...")}
						
							core.util.extrasUtil.getExtraRGB(o, actra, id, prop)
				}
		}
		
		
		public static function replaceRGB(actra, id, color, from){			
			actra.gfx[id+"RGB"] = new flash.geom.ColorTransform
			actra.gfx[id+"RGB"].rgb = color
			if(from){
			actra.gfx[id+"RGB"].from = from
			}else{
			actra.gfx[id+"RGB"].from = "replaceRGB"
			}			
		}
		
		public static function getDefaultsRGB(o, actra, id){
				actra.gfx[id+"RGB"] = new flash.geom.ColorTransform				
				actra.gfx[id+"RGB"].rgb = "0x"+o.cfg.xconfig.gfxConfig[0][id+"RGB"][actra.gender].v
				actra.gfx[id+"RGB"].from = "config.xml"
				
		}
		
		
		public static function expandRGB(o, actra, pro){
			bodyRGB(o, actra, pro)
			attireRGB(o, actra)
		}
		
		public static function bodyRGB(o, actra, data){
			if(o.cfg.config.logging){actra.log.addLog("gfx", "Assigning IconRBG colors to actor...")}
			
			core.actor.util.func.assignRGB(o, actra, "ha", "hair", data.hairRGB[0].v)
			
			
			if(!data.skinRGB[0].v){
			if(o.cfg.config.logging){actra.log.addLog("gfx", "Actor does not have BodyRGB datafile data. Attemping to use customizer.xml...")}
			
			core.util.extrasUtil.bodyRGB(o, actra)
			
			}else{
			if(o.cfg.config.logging){actra.log.addLog("gfx", "Actor has BodyRGB datafile data. Applying...")}
			
			core.actor.util.func.assignRGB(o, actra, "sk", "skin", data.skinRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "tn", "tender", data.tenderRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "li", "lips", data.lipsRGB[0].v, data.tenderRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "ey", "eyes", data.eyesRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "ni", "nipple", data.nippleRGB[0].v, data.tenderRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "mg", "mgen", data.mgenRGB[0].v, data.skinRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "fg", "fgen", data.fgenRGB[0].v, data.skinRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "el", "eyeliner", data.eyelinerRGB[0].v, data.skinRGB[0].v)
			core.actor.util.func.assignRGB(o, actra, "np", "nailpolish", data.nailpolishRGB[0].v)
		
			
			
			if(!data.nailfrenchRGB[0].v){
				if(o.cfg.config.logging){actra.log.addLog("gfx", "Actor is using FrenchNail style graphics...")}
				actra.gfx.frRGB = new flash.geom.ColorTransform
				actra.gfx.frRGB = actra.gfx.npRGB
				actra.gfx.frRGB.from = "Nailpolish (No French)"
			}else{core.actor.util.func.assignRGB(o, actra, "fr", "nailfrench", data.nailfrenchRGB[0].v)}
			}
			
			
		}

		public static function attireRGB(o, actra){
			if(o.cfg.config.logging){actra.log.addLog("gfx", "Assigning Attire RGB...")}
			
			if(!actra.gfx.gfxData.attireOptions[0].disable){
				if(!actra.gfx.gfxData.intlowRGB[0].v&&!actra.gfx.gfxData.shirtRGB[0].v&&!actra.gfx.gfxData.pantsRGB[0].v&&!actra.gfx.gfxData.socksRGB[0].v){
					if(o.cfg.config.logging){actra.log.addLog("gfx", "Actor does not have attire colors in their profile, customizer attireSets are allowed...")}
					core.util.extrasUtil.clothingSetRGB(o,actra)
				}else{
					if(o.cfg.config.logging){actra.log.addLog("gfx", "Actor has some attire colors in their profile, customizer attireSets are not allowed...")}
					core.actor.util.func.assignRGB(o, actra, "c_intlow", "intlow", actra.gfx.gfxData.intlowRGB[0].v)
					core.actor.util.func.assignRGB(o, actra, "c_pants", "pants", actra.gfx.gfxData.pantsRGB[0].v)
					core.actor.util.func.assignRGB(o, actra, "c_shirt", "shirt", actra.gfx.gfxData.shirtRGB[0].v)
					core.actor.util.func.assignRGB(o, actra, "c_socks", "socks", actra.gfx.gfxData.socksRGB[0].v)
				}
			}else{
				if(o.cfg.config.logging){actra.log.addLog("pro", "Attire GFX options have been disabled in actor's profile.xml...")}
			}
		}
		
			public static function expandGFX(o, actra, data){
			if(actra.gender==0 || data.mgenOptions[0].has=="1"){
				if(o.cfg.config.logging){actra.log.addLog("gfx", "Actor has male anatomy...")}
				actra.gfx.hasMGen = true
			}else{
				if(o.cfg.config.logging){actra.log.addLog("gfx", "Actor does not have male anatomy...")}
			}
			
			if(data.mgenOptions[0].size){
				if(o.cfg.config.logging){actra.log.addLog("gfx", "Male Anatomy is size: "+data.mgenOptions[0].size+"...")}
				actra.gfx.mgenSizeGFX = data.mgenOptions[0].size
				}
			else{
				if(o.cfg.config.logging){actra.log.addLog("gfx", "Size of Male Anatomy is not defined...")}
				actra.gfx.mgenSizeGFX = 0
			}
		}
			
}


