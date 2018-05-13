import skse;

class core.actor.equip.autoIntimates{


var o
var actra
var item

var hasCuirass
var hasPants
var hasIntH
var hasIntL

var ready
var cuirassStyle




var intlow
var inthigh


var anyValid
var processed
var activated

		public function autoIntimates(ocore, act, itemList){
			o = ocore
			actra = act
			ready = false
			activated = true
			item = itemList
			initilize()			
		}
		
		function initilize(){		
			hasCuirass = false
			hasPants = false
			hasIntL = false
			hasIntH = false
			anyValid = false
	
			intlow  = {block:undefined, name:"",mod:"",id:"",slot:"",worn:false,apply:false,exists:false,faux:true,esg:"intlow",valid:false,accepted:false,onePiece:false,color:undefined}
			inthigh = {block:undefined, name:"",mod:"",id:"",slot:"",worn:false,apply:false,exists:false,faux:true,esg:"inthigh",valid:false,accepted:false,onePiece:false,color:undefined}
			
			
			core.util.autoIntUtil.analyzeAutoInt(o, actra, this)
			
			actra.fullyLoaded()
		}
		
		function finalize(){
			
			
			if(intlow.block){
				if(intlow.block.clRGB){
					core.actor.util.func.replaceRGB(actra, "c_intlow", Number("0x"+intlow.block.clRGB), "AutoIntimates")
				}
			}
			
			if(inthigh.block){
				if(inthigh.block.clRGB){
					core.actor.util.func.replaceRGB(actra, "c_shirt", Number("0x"+inthigh.block.clRGB), "AutoIntimates")
				}
			}
		}
		
		
		
		function getCuirassStyle(styleReport){
			cuirassStyle = styleReport[1]	
			actra.equip.attire.cuirassMulti = cuirassStyle
			
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Cuirass-Style report received, Value = "+styleReport[1])}
			core.util.autoIntUtil.processAutoInt(o, actra, this)
		}
		
				
		
		
		function toggleEquip(fItem){
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) Toggling: "+fItem.name+" | "+fItem.esg+"...")}
			
			if(fItem.worn&&fItem.apply){
			
			var sendString = "1,"+fItem.mod+","+fItem.id
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) "+fItem.name+" IS Worn and IS Applied, Visually removing article...")}	
			o.skyAll("0SC_EqXConsole", sendString, 0, actra.trueID)
			if(o.cfg.config.logging){actra.log.addLog("esg", "Unequipping "+fItem.esg+" | mod: "+fItem.mod+" form: "+fItem.id+" | ActraTID: "+actra.trueID)}
			fItem.worn=false
			
			
			}else if(fItem.worn&&!fItem.apply){
			
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) "+fItem.name+" IS Worn but NOT Applied, Setting WORN to false...")}
			fItem.worn=false			
			
			}else if(!fItem.worn&&fItem.apply){
			
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) "+fItem.name+" is NOT worn but IS Applied, Visually equiping article...")}
			var sendString = "1,"+fItem.mod+","+fItem.id
			o.skyAll("0SC_EqOConsole", sendString, 0, actra.trueID)
			if(o.cfg.config.logging){actra.log.addLog("esg", "Equipping "+fItem.esg+" | mod: "+fItem.mod+" form: "+fItem.id+" | ActraTID: "+actra.trueID)}
			fItem.worn=true			
			
			}else if(!fItem.worn&&!fItem.apply){
			
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) "+fItem.name+" is NOT worn and is NOT Applied, setting WORN to true...")}
			fItem.worn=true
			
			}
		}
		
		function unequip(fauxItem){
			fauxItem.worn = false
			var sendString = "1,"+fauxItem.mod+","+fauxItem.id
			o.skyAll("0SC_EqOffConsole", sendString, 0, actra.trueID)			
		}
		
		function onCuirassOff(slot){
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI)Checking if AutoIntimates is effected by removal of the cuirass...")}
			
			if((intlow.worn&&!intlow.apply)||(inthigh.worn&&!inthigh.apply)){
			var sent = false
			
				if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) AutoIntimates is effected...")}
				if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) -Deciding- Style: "+cuirassStyle+" | hasIntL: "+hasIntL+" | isWearingPants: "+actra.equip.attire.hasEsg("pants"))}	
					
					if(cuirassStyle==0&&!hasIntL&&!item[o.cfg.esg.getEsg("pants", actra.gender)].worn){
						
						
						if(intlow.worn){
						core.util.autoIntUtil.autoIntEqOffSend(o, actra, intlow, slot, "Intimates-Low")
						sent = true
						}
						intlow.apply = true
						if(inthigh.worn){
						core.util.autoIntUtil.autoIntEqOffSend(o, actra, inthigh, slot, "Intimates-High")
						sent = true
						}
						inthigh.apply = true
						return sent
							
					}else{
						
						if(inthigh.worn){
						core.util.autoIntUtil.autoIntEqOffSend(o, actra, inthigh, slot, "Intimates-High")
						sent = true
						}
						inthigh.apply = true
						return sent
					}
			}else{
				if(cuirassStyle==0&&!hasIntL&&!item[o.cfg.esg.getEsg("pants", actra.gender)].worn){
				intlow.apply = true
				inthigh.apply = true
				}else{
				inthigh.apply = true
				}
				return false
			}
		}
		
		
		
		function onPantsOff(slot){
			if(o.cfg.config.logging){actra.log.addLog("esg", "(AI)Checking if AutoIntimates is effected by removal of pants...")}
			
			if(intlow.worn&&!intlow.apply&&intlow.exists){
			var sent = false
			
				if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) AutoIntimates is effected...")}
					
						
						if(intlow.worn){
						core.util.autoIntUtil.autoIntEqOffSend(o, actra, intlow, slot, "Intimates-Low")
						sent = true
						}
						intlow.apply = true
						return sent
					
			}else{
				intlow.apply = true
			
				return false
			}
		}
		
		function onCuirassOn(formID){
			if(intlow.apply||inthigh.apply){
				
				if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) AutoIntimates are being checked upon dressing of the Cuirass...")}
				if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) -Deciding- Style: "+cuirassStyle+" | hasIntL: "+hasIntL+" | isWearingPants: "+actra.equip.attire.hasEsg("pants"))}	
					
					if(cuirassStyle==0&&!hasIntL&&!item[o.cfg.esg.getEsg("pants", actra.gender)].worn){
						core.util.autoIntUtil.autoIntEqOnSend(o, actra, intlow, formID, "Intimates-Low")
						core.util.autoIntUtil.autoIntEqOnSend(o, actra, inthigh, formID, "Intimates-High")
						return true
							
					}else{
						core.util.autoIntUtil.autoIntEqOnSend(o, actra, inthigh, formID, "Intimates-High")
						return true
					}
			}else{
				if(cuirassStyle==0&&!hasIntL&&!item[o.cfg.esg.getEsg("pants", actra.gender)].worn){
						intlow.apply = false
						inthigh.apply = false
						}else{
						inthigh.apply = false
					}
				return false
			}
			
			
		}
		
		function onPantsOn(formID){
			if(intlow.apply&&intlow.exists){
				
				if(o.cfg.config.logging){actra.log.addLog("esg", "(AI) AutoIntimates are being checked upon dressing of pants...")}

						core.util.autoIntUtil.autoIntEqOnSend(o, actra, intlow, formID, "Intimates-Low")
						return true
			}else{
						intlow.apply = false
				return false
			}
			
			
		}
		
}