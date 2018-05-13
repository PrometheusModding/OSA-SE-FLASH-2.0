
class core.util.autoIntUtil
{
	

			public static function autoIntEqOffSend(o, actra, autoIntEsg, slot, clName){
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Revealing "+clName+"...")
			actra.log.addLog("esg", "(AI) "+clName+" - CMD: "+1+" | RemovingSL: "+String(slot+30)+" | Name: "+autoIntEsg.name+" | Mod: "+autoIntEsg.mod+" | Form: "+autoIntEsg.id)}
			autoIntEsg.apply = true
			
			var sendString = String(slot+30)+","+autoIntEsg.mod+","+autoIntEsg.id
						
			o.skyString("0SAA"+actra.id+"_EqOffAutoInt", String(sendString))
			}
			
			
			public static function autoIntEqOnSend(o, actra, autoIntEsg, formID, clName){
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Hiding "+clName+"...")
			actra.log.addLog("esg", "(AI) "+clName+" - DressingFO: "+String(formID)+" | Name: "+autoIntEsg.name+" | Mod: "+autoIntEsg.mod+" | Form: "+autoIntEsg.id+" | Slot: "+autoIntEsg.slot)}
								
			autoIntEsg.apply = false
			
			var sendString = String(formID)+","+autoIntEsg.mod+","+autoIntEsg.id
						
			o.skyString("0SAA"+actra.id+"_EqOnAutoInt", String(sendString))
			}
		
		
			public static function processNewAutoInt(o, actra, autoInt){
				
			}
			

			
			
			public static function analyzeAutoInt(o, actra, autoInt){

			
			if(o.cfg.config.logging){actra.log.addLog("esg", "AUTO-INTIMATES ||| processing...")}
			
			
			
			var cuirassSlots = o.cfg.esg.getSlots("cuirass", actra.gender)

			autoInt.hasCuirass = checkWornESG(autoInt, cuirassSlots)
			autoInt.hasPants = checkWornESG(autoInt, o.cfg.esg.getSlots("pants", actra.gender))
			
			if(o.cfg.config["AIinthigh"+actra.gender]==1){
				autoInt.inthigh.valid = checkIfOpen(autoInt, o.cfg.esg.getSlots("inthigh", actra.gender))
				if(autoInt.inthigh.valid){
					autoInt.anyValid=true
				}
			}
			if(o.cfg.config["AIintlow"+actra.gender]==1){
				
				
				autoInt.intlow.valid = checkIfOpen(autoInt, o.cfg.esg.getSlots("intlow", actra.gender))
				if(autoInt.intlow.valid){
					autoInt.anyValid=true
				}
			}
			
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Detected: Cuirass: "+autoInt.hasCuirass+" | hasPants: "+autoInt.hasPants+" | IntimatesLowVALID: "+autoInt.intlow.valid+" | IntimatesHighVALID: "+autoInt.inthigh.valid)}
			
				if(autoInt.hasCuirass&&autoInt.anyValid==true){
				
				
				var CuirassSlots = o.cfg.esg.getSlots("cuirass", 1)
				
				
				o.skyStringNum("0SC_EqReadCuirassStyle", actra.id+","+o.cfg.xconfig.esg[0].keywords[0].chestOnly, Number(autoInt.item[cuirassSlots[0]].id))
			
				}else if(autoInt.anyValid==true){
				processAutoInt(o, actra, autoInt)
				}
			
			
			
					if(o.flashDevMode&&autoInt.anyValid==true){
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) WARNING: Developer Mode Bypass Switch Activated")}
						var fakeReport = []
						fakeReport[1] = 0
						autoInt.getCuirassStyle(fakeReport)
					}
			
			}
			
		
		
		public static function checkWornESG(autoInt, checkESG){
				var found = false
				for (var i=0; i < checkESG.length; i++){
					if(autoInt.item[checkESG[i]].exists&&autoInt.item[checkESG[i]].worn){
					found = true	
					}	
				}
				return found
		}
		
		public static function checkIfOpen(autoInt, checkESG){
				var found = true
				for (var i=0; i < checkESG.length; i++){
					if(autoInt.item[checkESG[i]].exists){
					found = false	
					}	
				}
				return found
		}
		
		public static function processAutoInt(o, actra, autoInt){
				
				
				autoInt.processed=true
				var customizerList = {built:false, IntimatesOP:[],IntimatesSet:[],IntimatesH:[],IntimatesL:[]}
				
				var sele
				sele = checkUpperBody(o, actra, autoInt, actra.forms.formsData.AutoIntimates[0], "forms.xml")
				if(!sele.fin||!sele.block){			
					if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) All equipment rejected for UpperBody Intimates from "+"forms.xml"+". Checking customizer.xml...")}
					     
						buildCustomizerList(o,actra, customizerList)
						 sele = checkUpperBody(o, actra, autoInt, customizerList, "customizer.xml")
						 
						 
						 
						if(sele.fin||sele.block){
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Customizer.xml has found valid UpperBody Intimates...")}
						selectedUpper(o, actra, autoInt, sele)
						}else{
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Customizer.xml had no viable UpperBody options for this character...")}
						}
				}else{
					
					selectedUpper(o, actra, autoInt, sele)
				}
				
				if(autoInt.intlow.valid&&!autoInt.intlow.accepted){
					sele = checkLowerBody(o, actra, autoInt, actra.forms.formsData.AutoIntimates[0], "forms.xml")
					if(!sele.fin||!sele.block){		
						
						if(!customizerList.built){
						buildCustomizerList(o,actra,customizerList)
						}
						
						 sele = checkLowerBody(o, actra, autoInt, customizerList, "customizer.xml")
						 
						 
						 
						if(sele.fin||sele.block){
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Customizer.xml has found valid LowerBody Intimates...")}
						autoIntimateEntryWrite(o, actra, autoInt, "intlow", sele.block)
						}else{
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Customizer.xml had no viable LowerBody options for this character...")}
						}
						
					}else{
					autoIntimateEntryWrite(o, actra, autoInt, "intlow", sele.block)
					if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) "+autoInt.intlow.name+" have been selected for "+actra.name+"'s LowerBody attire, simply breathtaking!...")}
					}
					
				}
				
				autoInt.finalize()
					
		}
	
		public static function buildCustomizerList(o,actra,customizerList){
						customizerList.IntimatesOP = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.equip.map[0], "IntimatesOP", "equip")		
						customizerList.IntimatesSet = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.equip.map[0], "IntimatesSet", "equip")	
						customizerList.IntimatesH = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.equip.map[0], "IntimatesH", "equip")	
						customizerList.IntimatesL = core.util.extrasUtil.extrasConcat(o, actra, o.cfg.customizer.equip.map[0], "IntimatesL", "equip")	
		}
		public static function selectedUpper(o, actra, autoInt, sele){
					if(sele.onePiece){
						autoIntimateEntryWrite(o, actra, autoInt, "inthigh", sele.block)
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) "+autoInt.inthigh.name+" has been selected as a One-Piece undergarment for "+actra.name+"', classy!...")}
						
					}else if(sele.hasLower){
						autoIntimateEntryWrite(o, actra, autoInt, "inthigh", sele.block.IntimatesH[0])
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) "+autoInt.inthigh.name+" has been selected for "+actra.name+"'s UpperBody attire, absolutely stunning!...")}
						if(autoInt.intlow.valid){
						autoIntimateEntryWrite(o, actra, autoInt, "intlow", sele.block.IntimatesL[0])
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) "+autoInt.intlow.name+" has been selected for "+actra.name+"'s LowerBody attire, lovely!...")}
						}				
					}else{
						autoIntimateEntryWrite(o, actra, autoInt, "inthigh", sele.block)
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) "+autoInt.inthigh.name+" has been selected for "+actra.name+"'s UpperBody attire, absolutely stunning!...")}
					}
		}

		
		public static function autoIntimateEntryWrite(o, actra, autoInt, autoType, sele){
			autoInt[autoType].name = sele.name
			autoInt[autoType].mod = sele.mod
			autoInt[autoType].id = sele.form
			autoInt[autoType].slot = "" 
			autoInt[autoType].exists = true
			autoInt[autoType].accepted = true
			autoInt[autoType].worn = true
			autoInt[autoType].onePiece = true
			autoInt[autoType].block = sele

		}
		
		
		public static function checkUpperBody(o, actra, autoInt, formsData, searchType){

			var sele
			if(!autoInt.hasCuirass||autoInt.inthigh.accepted||!autoInt.inthigh.valid){
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Actor is not valid for UpperBody intimates...")}
						if(o.cfg.config.logging){actra.log.addLog("esg", "-- HasCuirass: "+autoInt.hasCuirass+" | IntHighAccepeted: "+autoInt.inthigh.accepted+" | intHighValid: "+autoInt.inthigh.valid+"...")}				
			}else{
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Actor is valid for UpperBody Intimates...")}
				
				
							var vs 
							if(autoInt.intlow.valid){
								vs = "Set_Vs_HL"
							}else{
								vs = "Set_Vs_H"
							}
							
							if(autoInt.cuirassStyle=="0"&&autoInt.intlow.valid){
							if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Actor is valid for OnePiece Intimates ("+searchType+")...")}
							sele = useOne(o, actra, formsData, "IntimatesOP", "IntimatesSet", "IntimatesH", "One_Vs_All")	
							}			
							
							if(!sele.fin){
							if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) OnePiece rejected. Checking Sets ("+searchType+")...")}
							sele = useSet(o, actra, formsData, "IntimatesH", "IntimatesSet", vs)
							}							
							if(!sele.fin){			
							if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Sets rejected. Checking Single Pieces ("+searchType+")...")}
							sele = useSingle(o, actra, formsData, "IntimatesH")							
							}					
			}
			
			
			
			return sele
		}
		
		
		
				
		public static function checkLowerBody(o, actra, autoInt, formsData, searchType){

			var sele
			if(autoInt.intlow.accepted||!autoInt.intlow.valid){
						if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Actor is not valid for LowerBody intimates...")}
						if(o.cfg.config.logging){actra.log.addLog("esg", "-- IntLow.Accepeted: "+autoInt.intlow.accepted+" | intLow.Valid: "+autoInt.intlow.valid+"...")}				
			}else{
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Actor is valid for LowerBody Intimates...")}
														
							var vs = "Set_Vs_L" 
							
							if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Checking Sets ("+searchType+")...")}
							sele = useSet(o, actra, formsData, "IntimatesL", "IntimatesSet", "Set_Vs_L")
													
							if(!sele.fin){			
							if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Sets rejected. Checking Single Pieces ("+searchType+")...")}
							sele = useSingle(o, actra, formsData, "IntimatesL")							
							}				
			}
			
			return sele
		}
		
		
		public static function generatorUpperBody(){
			
		}
		
				
		
		public static function useSingle(o, actra, formsData, primary){							
							
							if(formsData[primary][0]){
								var rPack={block:undefined, fin:false, hasLower:false, modifier:0}
								
								if(formsData[primary]){
								rPack.block=core.util.func.TIERperando(formsData[primary])
								rPack.modifier=0
								rPack.fin=true
								rPack.hasLower=false
								}
							}
							return rPack
		}
		
		
		
		
		public static function useOne(o, actra, formsData, primary, sets, singles, setVs){				
				var rPack = {block:undefined, fin:false, hasLower:false, onePiece:false, modifier:0}
				
				

				
				
										
									if(formsData[setVs]&&formsData[primary][0]){	
									
										if(core.util.func.RNG(0,99)<=formsData[setVs]||(!formsData[singles][0]&&!formsData[sets][0])){					
										if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) OnePieces won the % roll...")}
												
												
												rPack.block=core.util.func.TIERperando(formsData[primary])
												rPack.modifier=1
												rPack.fin=true
												rPack.hasLower=true
												rPack.onePiece=true
												return rPack
												
										}else{
										if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) OnePieces lost the % roll...")}

											return rPack
										}
									
									
									}else{
									if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) No % value, randomly selecting based on ratio...")}
											
											var totalL = 0
											var L1 = formsData[sets].length 
											var L2 = formsData[primary].length
											var L3 = formsData[singles].length
											
											if(L1){totalL+L1}
											if(L2){totalL+L2}
											if(L3){totalL+L3}
											
											if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Total length of OnePiece, Sets and IntimatesHigh: "+totalL+"...")}
					
											if(totalL>0&&L1>0){
											   if(core.util.func.RNG(0,99)<= 100/(totalL/Number(L1))){
															if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) OnePieces won the roll...")}
																								
												rPack.block=core.util.func.TIERperando(formsData[primary])
												rPack.modifier=1
												rPack.fin=true
												rPack.onePiece=true
												rPack.hasLower=true
											   }else{
												   if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) OnePieces lost the roll...")}
											   }
											}else{
															 if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) There are no OnePiece entries...")}
															
											}
									}
					return rPack

			}
			
			
		public static function useSet(o, actra, formsData, primary, sets, setVs){				
				var rPack = {block:undefined, fin:false, hasLower:false, modifier:0}
				
				
				if(formsData.SetsCanSolo=="1"&&formsData[primary][0]){
				if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Set pieces are allowed to be used as individual pieces...")}
				
										
									if(formsData[setVs]){	
									
									
										if(core.util.func.RNG(0,99)<=formsData[setVs]||!formsData[primary][0]){					
										if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) SETS won the percentage roll...")}
												
												
												rPack.block=core.util.func.TIERperando(formsData[sets])
												rPack.modifier=1
												rPack.fin=true
												rPack.hasLower=true
												return rPack
												
										}else{
										if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) SETS lost the percentage roll, split High and Low will be used...")}
											
											rPack.block=core.util.func.TIERperando(formsData[primary])
											rPack.modifier=0
											rPack.fin=true
											rPack.hasLower=false
											return rPack
										}
									
									
									}else{
									if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) No percentage, randomly selecting based on ratio...")}
	
											var L1 = formsData[sets].length 
											var L2 = formsData[primary].length
											var totalL = L1+L2
													if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Total length of Sets and IntimatesHigh: "+totalL+"...")}
					
											if(core.util.func.RNG(0,99)<= 100/((totalL)/Number(L1))){
															if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Set Pieces won the roll...")}
																								
												rPack.block=core.util.func.TIERperando(formsData[sets])
												rPack.modifier=1
												rPack.modifier=0
												rPack.fin=true
												rPack.hasLower=true
											return rPack
											}else{
															if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Single Pieces won the roll...")}
												rPack.block=core.util.func.TIERperando(formsData[primary])
												rPack.modifier=0
												rPack.fin=true
												rPack.hasLower=false
											return rPack
											}
									}
				
				
					}else{
					return rPack
					}
			}
				
		
		
		
		public static function areSoloSetsValid(o, autoInt){
			if(o.cfg.config.AIsoloSets&&autoInt.IntimatesSet[0]){
				return true
			}else{
				return false
			}
		}
		
		
		
		
}