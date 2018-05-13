
class core.util.extrasUtil
{
	

		public static function readyExtras(o, actra){			
				
				var raceTag = actra.skyRace.toLowerCase()
				var raceTag = raceTag.split(" ").join("")
				
				actra.profile.exRace = raceTag
				
				readyExtrasSection(o, actra, "gfx")
				readyExtrasSection(o, actra, "names")
				readyExtrasSection(o, actra, "equip")
				
				
				
				if(!actra.profile.autoNameAttempted&&o.cfg.customizer.namesHas&&o.cfg.config.renameNpc=="1"){
				actra.profile.autoNameAttempted = true
				var actraName = actra.name.toLowerCase()
				
						for (var i=0; i < o.cfg.customizer.names.genericNPC.length; i++){
							if(o.cfg.customizer.names.genericNPC[i].v.toLowerCase()==actraName){
								if(o.cfg.config.logging){actra.log.addLog("pro", "This actor is valid for receiving a name...")}
								makeName(o, actra)
							}
						}
						
						makeTitle(o, actra)
				}
				
				
		}
		
		
		public static function makeName(o, actra){
			//Realname NickName
							//Get RealName
							
							//if ONLY==1
							//Send Name

							
							//If Last or LastPer 
							
							var defineName = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.names.map[0], "first", "names")					
							defineName = defineName[core.util.func.RNG(0, defineName.length-1)]
							
							if(o.cfg.config.logging){actra.log.addLog("pro", "First Name: "+defineName.v)}
							
							core.util.extrasUtil.extrasSingle(o, actra, o.cfg.customizer.names.map[0], "fuck", "names")
							//o.debugOutput(core.util.extrasUtil.extrasSingle(o, actra, o.cfg.customizer.names.map[0], "fuck", "names"))
							actra.name = defineName.v
							
							if(o.cfg.config.renameInGame=="1"){
							o.skyAll("0SC_ChangeName", defineName.v, 0, actra.trueID)
							}
		}
		
		public static function makeTitle(o, actra){
			var failed = false
			
			var newTitle = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.names.map[0], "title", "names") 
			newTitle = newTitle[core.util.func.RNG(0, newTitle.length-1)]
			
			if(newTitle.v=="$combo"){
					if(o.cfg.config.logging){actra.log.addLog("pro", "Actor's title is being created as a COMBO, combo id: "+newTitle.id)}
					var comboBlock = o.cfg.customizer.names.combos[0][newTitle.id][0]
					
					newTitle = comboBlock.format.toString()
					
					var varCount = 0
					var titleBuilder = ""
					var ix = 0
					
					while (newTitle.indexOf("$#") != -1) {
						
						ix = newTitle.indexOf("$#")
						
						titleBuilder = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.names.map[0], comboBlock["var"][varCount].id, "names")
						titleBuilder = titleBuilder[core.util.func.RNG(0, titleBuilder.length-1)]
						newTitle = newTitle.substring(0, ix)+titleBuilder.v+newTitle.substring(ix+2)
						varCount++
					}
				

										
			}
			
								
			if(o.cfg.config.logging){actra.log.addLog("pro", "Title Created: "+newTitle)}
			return newTitle
						
		}

		
		
		public static function readyExtrasSection(o, actra, type){
			
				for (var i=0; i < o.cfg.customizer[type].raceClass.length; i++){
						if(o.cfg.customizer[type].raceClass[i].race.toLowerCase()==actra.profile.exRace.toLowerCase()){
							actra.profile.exRaceType[type]=o.cfg.customizer[type].raceClass[i]["class"].toUpperCase()

										for (var j=0; j < o.cfg.customizer[type].raceClass[i].subClass.length; j++){ 											
											if(o.cfg.customizer[type].raceClass[i].subClass[j].per){													
												if(core.util.func.RNG(0, 99)<=Number(o.cfg.customizer[type].raceClass[i].subClass[j].per)){
													if(o.cfg.customizer[type].raceClass[i].subClass[j].perRep){
														actra.profile.exRaceType[type+"Sub"].push(String(o.cfg.customizer[type].raceClass[i].subClass[j].perRep.toUpperCase()+""))
										 			    if(o.cfg.config.logging){actra.log.addLog("pro", "SubClass replaced after losing the % roll: "+type+" | "+o.cfg.customizer[type].raceClass[i].subClass[j].v +" was replaced by "+o.cfg.customizer[type].raceClass[i].subClass[j].perRep)}
													}else{
														if(o.cfg.config.logging){actra.log.addLog("pro", "SubClass denied by % roll :"+type+" | "+o.cfg.customizer[type].raceClass[i].subClass[j].v)}
													}
												}else{
													actra.profile.exRaceType[type+"Sub"].push(String(o.cfg.customizer[type].raceClass[i].subClass[j].v.toUpperCase()+""))
										   			if(o.cfg.config.logging){actra.log.addLog("pro", "SubClass won a % roll and was registered: "+type+" | "+actra.profile.exRaceType[type+"Sub"][j])}
												}
											}else{
											actra.profile.exRaceType[type+"Sub"].push(String(o.cfg.customizer[type].raceClass[i].subClass[j].v.toUpperCase()+""))
										    if(o.cfg.config.logging){actra.log.addLog("pro", "SubClass registered: "+type+" | "+actra.profile.exRaceType[type+"Sub"][j])}
											}
										}
						}
					}
					
				if(o.cfg.config.logging){actra.log.addLog("pro", "ExRace Output: "+type+" set to: :"+actra.profile.exRaceType[type])}
				actra.profile.exReady[type] = true
		}
		
		
		public static function AutoIntimates(o, actra){
								
		}
		
		public static function clothingSetRGB(o, actra){
			if(o.cfg.config.logging){actra.log.addLog("gfx", "Using customizer_gfx.xml to assign IconRGB clothinSet colors...")}
			
			
			if(!actra.profile.exReady.gfx){core.util.extrasUtil.readyExtras(o, actra)}			
				
					var attireHue = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.gfx.map[0], "clothingSetRGB", "gfx")
					
					var attireHue = attireHue[core.util.func.RNG(0, attireHue.length-1)]
					
					if(attireHue){
						if(o.cfg.config.logging){actra.log.addLog("gfx", "customizer_equip has attireGfx RGB sets...")}
						
						var per = raceGenPer(o,actra, o.cfg.customizer.gfx.map[0], "clothingSetPer")
						
							if(per){
							if(o.cfg.config.logging){actra.log.addLog("gfx", "Clothing Set Percentage found: "+per+"%...")}
								
								if(core.util.func.RNG(0,99)<=per){
								if(o.cfg.config.logging){actra.log.addLog("gfx", "Clothing Set GFX won the roll...")}
								clothingSetApplyRGB(o, actra, attireHue)
								
								}else{
								if(o.cfg.config.logging){actra.log.addLog("gfx", "Clothing SetGFX lost the roll...")}
								
								clothingApplyRBG(o,actra)								
								}
							
							}else{
							if(o.cfg.config.logging){actra.log.addLog("gfx", "No clothing Set Percentage, using sets 100%...")}   
							
							
							clothingSetApplyRGB(o, actra, attireHue)
							}
					
					}else{
					if(o.cfg.config.logging){actra.log.addLog("gfx", "customizer.xml has no sets, using single piece RGBs instead...")}
					
					clothingApplyRBG(o,actra)
					
					}
					
		}
		
		
		public static function clothingApplyRBG(o, actra){
					core.actor.util.func.assignRGB(o, actra, "c_intlow", "intlow", actra.gfx.gfxData.attireIntLowRGB[0].v)
					core.actor.util.func.assignRGB(o, actra, "c_pants", "pants", actra.gfx.gfxData.attirePantsRGB[0].v)
					core.actor.util.func.assignRGB(o, actra, "c_shirt", "shirt", actra.gfx.gfxData.attireShirtRGB[0].v)
					core.actor.util.func.assignRGB(o, actra, "c_socks", "socks", actra.gfx.gfxData.attireSocksRGB[0].v)
		}
		
		public static function clothingSetApplyRGB(o, actra, attireHue){						
						clothingSetProcessRGB(o,actra, attireHue, "c_shirt","shirt",actra.gfx.gfxData.attireShirtRGB[0].v)						
						clothingSetProcessRGB(o,actra, attireHue, "c_pants","pants",actra.gfx.gfxData.attirePantsRGB[0].v)
						clothingSetProcessRGB(o,actra, attireHue, "c_intlow","intlow",actra.gfx.gfxData.attireIntLowRGB[0].v)
						clothingSetProcessRGB(o,actra, attireHue, "c_socks","socks", actra.gfx.gfxData.attireSocksRGB[0].v)
			
		}
		
		public static function clothingSetProcessRGB(o, actra, attireHue, prop, type, val){
						actra.gfx["c_"+type+"RGB"] = new flash.geom.ColorTransform
						
						if(!attireHue[type]||attireHue[type]=="!"){
						
						core.actor.util.func.assignRGB(o, actra, prop, type, val)
						
						}else{
						actra.gfx["c_"+type+"RGB"].rgb = "0x"+attireHue[type]
						actra.gfx["c_"+type+"RGB"].from = "customizer.xml"
						}
		}
		
		public static function bodyRGB(o, actra){
			
			if(o.cfg.config.logging){actra.log.addLog("gfx", "Using customizer_gfx.xml to assign IconRGB body colors...")}
			
			if(o.cfg.customizer.gfxHas){if(!actra.profile.exReady.gfx){core.util.extrasUtil.readyExtras(o, actra)}				
					
					var bodyHue = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.gfx.map[0], "bodyRGB", "gfx")
					
										
					var bodyHue = bodyHue[core.util.func.RNG(0, bodyHue.length-1)]
					
						actra.gfx.skRGB = new flash.geom.ColorTransform
						actra.gfx.skRGB.rgb = "0x"+bodyHue.skin
						actra.gfx.skRGB.from = "customizer.xml"
						
						
						actra.gfx.niRGB = new flash.geom.ColorTransform
						actra.gfx.niRGB.rgb = "0x"+bodyHue.tender
						actra.gfx.niRGB.from = "customizer.xml"
						
						actra.gfx.mgRGB = new flash.geom.ColorTransform
						actra.gfx.mgRGB.rgb = "0x"+bodyHue.skin
						actra.gfx.mgRGB.from = "customizer.xml"
						actra.gfx.mgRGB.redMultiplier = .05
						actra.gfx.mgRGB.greenMultiplier = -.025
						actra.gfx.mgRGB.blueMultiplier = -.025
						
						actra.gfx.fgRGB = new flash.geom.ColorTransform
						actra.gfx.fgRGB.rgb = "0x"+bodyHue.tender
						actra.gfx.fgRGB.from = "customizer.xml"
						
						actra.gfx.niRGB = new flash.geom.ColorTransform
						actra.gfx.niRGB.rgb = "0x"+bodyHue.tender
						actra.gfx.niRGB.from = "customizer.xml"
						
						core.actor.util.func.assignMinorRGB(o, actra)	
					
			}else{
						actra.gfx.skRGB = new flash.geom.ColorTransform
						actra.gfx.skRGB.rgb = "0x"+o.cfg.xconfig.gfxConfig[0].skRGB[0][actra.gender]
						actra.gfx.skRGB.from = "config.xml"
						
						actra.gfx.niRGB = new flash.geom.ColorTransform
						actra.gfx.niRGB.rgb = "0x"+o.cfg.xconfig.gfxConfig[0].niRGB[0][actra.gender]
						actra.gfx.niRGB.from = "config.xml"
						
						actra.gfx.mgRGB = new flash.geom.ColorTransform
						actra.gfx.mgRGB.rgb = "0x"+o.cfg.xconfig.gfxConfig[0].mgRGB[0][actra.gender]
						actra.gfx.mgRGB.from = "config.xml"
						
						actra.gfx.fgRGB = new flash.geom.ColorTransform
						actra.gfx.fgRGB.rgb = "0x"+o.cfg.xconfig.gfxConfig[0].fgRGB[0][actra.gender]
						actra.gfx.fgRGB.from = "config.xml"
						
						core.actor.util.func.assignMinorRGB(o, actra)
			}
		}
		
		public static function getExtraRGB(o, actra, id, prop){
			if(o.cfg.customizer.gfxHas){if(!actra.profile.exReady.gfx){core.util.extrasUtil.readyExtras(o, actra)}	
				
				
				var validRGB = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.gfx.map[0], prop+"RGB", "gfx")
				if(validRGB[0]){
				var validRGB = validRGB[core.util.func.RNG(0, validRGB.length-1)]
				
				
					if(core.actor.util.func.rgbCmd(o,actra,id,prop,validRGB.v,"customizer.xml")){
						
					}else{
					actra.gfx[id+"RGB"] = new flash.geom.ColorTransform
					
					actra.gfx[id+"RGB"].rgb = "0x"+validRGB.v
					actra.gfx[id+"RGB"].from = "customizer.xml"
					}
				}else{
				core.actor.util.func.getDefaultsRGB(o,actra,id)
				}
			}else{
			core.actor.util.func.getDefaultsRGB(o,actra,id)				
			}
		}
		
		
		
		
		public static function raceGenPer(o, actra, exCat, prop){
				var gender = actra.genderF.toLowerCase()
				
				var per
				
				per = exCat[gender][0][actra.profile.exRace][0][prop]
				if(!per){per = exCat.bothGenders[0][actra.profile.exRace][0][prop]}
				else if(!per){per = exCat[gender][0].allRace[0][prop]}
				else if(!per){per = exCat.bothGenders[0].allRace[0][prop]}
				else if(!per){per = exCat[gender][0].noneRace[0][prop]}
				else if(!per){per = exCat.bothGenders[0].noneRace[0][prop]}

			return per
		}
		

		
		public static function extrasConcat(o, actra, exCat, prop, type){
				var gender = actra.genderF.toLowerCase()
				
				var thisSearch = []
				
				for (var i=0; i < exCat.bothGenders[0].allRace[0][prop].length; i++){
				thisSearch.push(exCat.bothGenders[0].allRace[0][prop][i])
				}
				for (var i=0; i < exCat.bothGenders[0]["allRace"+actra.profile.exRaceType[type]][0][prop].length; i++){
				thisSearch.push(exCat.bothGenders[0]["allRace"+actra.profile.exRaceType[type]][0][prop][i])
				}
				

				if(actra.profile.exRaceType[type+"Sub"][0]){	
					
					for (var j=0; j < actra.profile.exRaceType[type+"Sub"].length; j++){
						for (var i=0; i < exCat.bothGenders[0]["allRace"+actra.profile.exRaceType[type+"Sub"][j]][0][prop].length; i++){
						thisSearch.push(exCat.bothGenders[0]["allRace"+actra.profile.exRaceType[type+"Sub"][j]][0][prop][i])
						}
					}
					
				}
				
				if(exCat.bothGenders[0][actra.profile.exRace][0]){
					for (var i=0; i < exCat.bothGenders[0][actra.profile.exRace][0][prop].length; i++){
					thisSearch.push(exCat.bothGenders[0][actra.profile.exRace][0][prop][i])
					}
				}else{
					for (var i=0; i < exCat.bothGenders[0].noneRace[0][prop].length; i++){
					thisSearch.push(exCat.bothGenders[0].noneRace[0][prop][i])
					}
				}
				
								
				for (var i=0; i < exCat[gender][0].allRace[0][prop].length; i++){
				thisSearch.push(exCat[gender][0].allRace[0][prop][i])
				}
				for (var i=0; i < exCat[gender][0]["allRace"+actra.profile.exRaceType[type]][0][prop].length; i++){
				thisSearch.push(exCat[gender][0]["allRace"+actra.profile.exRaceType[type]][0][prop][i])
				}
				
				if(actra.profile.exRaceType[type+"Sub"][0]){					
					for (var j=0; j < actra.profile.exRaceType[type+"Sub"].length; j++){
						for (var i=0; i < exCat[gender][0]["allRace"+actra.profile.exRaceType[type+"Sub"][j]][0][prop].length; i++){
						thisSearch.push(exCat[gender][0]["allRace"+actra.profile.exRaceType[type+"Sub"][j]][0][prop][i])
						}
					}
					
				}
				
				if(exCat[gender][0][actra.profile.exRace][0]){
					for (var i=0; i < exCat[gender][0][actra.profile.exRace][0][prop].length; i++){
					thisSearch.push(exCat[gender][0][actra.profile.exRace][0][prop][i])
					}
				}else{
					for (var i=0; i < exCat[gender][0].noneRace[0][prop].length; i++){
					thisSearch.push(exCat[gender][0].noneRace[0][prop][i])
					}
				}				

			return thisSearch
		}
		
		
		public static function extrasSingle(o, actra, exCat, prop, type){
				var gender = actra.genderF.toLowerCase()
				
				var thisSearch = []
				
				
				if(o.cfg.customizer.names.parse[0].singlesGroupRaceFirst==1){
					
					if(exCat[gender][0][actra.profile.exRace][0][prop]){
					return exCat[gender][0][actra.profile.exRace][0][prop]
					
					}else if(exCat.bothGenders[0][actra.profile.exRace][0][prop]){
					return exCat.bothGenders[0][actra.profile.exRace][0][prop]					
					
					}else if(exCat[gender][0]["allRace"+actra.profile.exRaceType[type]][0][prop]){
					return exCat[gender][0]["allRace"+actra.profile.exRaceType[type]][0][prop]
					
					}else if(exCat.bothGenders[0]["allRace"+actra.profile.exRaceType[type]][0][prop]){
					return exCat.bothGenders[0]["allRace"+actra.profile.exRaceType[type]][0][prop]
					
					}else if(exCat[gender][0].allRace[0][prop]){
					return exCat[gender][0].allRace[0][prop]
					
					}else if(exCat.bothGenders[0].allRace[0][prop]){
					return exCat.bothGenders[0].allRace[0][prop]
					
					}else if(exCat[gender][0].noneRace[0][prop]){
					return exCat[gender][0].noneRace[0][prop]
										
					}else if(exCat.bothGenders[0].noneRace[0][prop]){
					return exCat.bothGenders[0].noneRace[0][prop]
					}
					
				}else{				
					if(exCat[gender][0][actra.profile.exRace][0][prop]){
					return exCat[gender][0][actra.profile.exRace][0][prop]
					
					}else if(exCat[gender][0]["allRace"+actra.profile.exRaceType[type]][0][prop]){
					return exCat[gender][0]["allRace"+actra.profile.exRaceType[type]][0][prop]
					
					}else if(exCat[gender][0].allRace[0][prop]){
					return exCat[gender][0].allRace[0][prop]
					
					}else if(exCat[gender][0].noneRace[0][prop]){
					return exCat[gender][0].noneRace[0][prop]
					
					}else if(exCat.bothGenders[0][actra.profile.exRace][0][prop]){
					return exCat.bothGenders[0][actra.profile.exRace][0][prop]
										
					}else if(exCat.bothGenders[0]["allRace"+actra.profile.exRaceType[type]][0][prop]){
					return exCat.bothGenders[0]["allRace"+actra.profile.exRaceType[type]][0][prop]
					
					}else if(exCat.bothGenders[0].allRace[0][prop]){
					return exCat.bothGenders[0].allRace[0][prop]
					
					}else if(exCat.bothGenders[0].noneRace[0][prop]){
					return exCat.bothGenders[0].noneRace[0][prop]
					}
				}
		}

}


