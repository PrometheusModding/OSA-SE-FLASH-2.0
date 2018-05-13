

class EquipmentSlotFull extends MovieClip
{
	
public var o
public var dia
public var actra
public var proDat
public var profileMode
public var horizon
var yLoc
var hPad

var typeVal
var typeVar
var maxHeight

			public function EquipmentSlotFull(){	
				
			}
			
			public function buildFull(){
			
				maxHeight = 0
				yLoc = -11
				hPad = 20
				horizon -= 25
				makeOverlay()				
			
			}
		
			
			function makeOverlay(){
			
				
				var yTop = yLoc
				var horizonShift = 225
				
				typeVar = new TextFormat();
				typeVar.letterSpacing = 1.1
				typeVar.font = o.fonts.l
				typeVar.size = 11
				
				typeVal = new TextFormat();
				typeVal.letterSpacing = 1.1
				typeVal.font = o.fonts.m
				typeVal.size = 8
				
				var cur
				
						
				
				
				var yShift = -34
				var yShiftHead = -32
				
				var countTotal = 0
				var rowTotal = 0
				
				
				
				for (var i=0; i <= 30; i++){
					
					if(actra.equip.attire.item[i].exists){
						
					countTotal++
					rowTotal++
					maxHeight+= yShift
					
					if(rowTotal > 10){
					yLoc = yTop
					rowTotal=0
					horizon -= horizonShift
					}
						cur = makePairA(i+30, typeVal, hPad, horizon, yLoc)
						refineItemDisplay(cur, i, horizon, yLoc, yShift, hPad)
						cur.setTextFormat(typeVal);
						cur.autoSize = "right";
							
						yLoc += yShift
					}
				}
				
				
				for (var i=0; i <= 1; i++){
					if(actra.equip.armament.hand[i].exists){
						
					countTotal++
					rowTotal++
					maxHeight+= yShift
					
					if(rowTotal > 10){
					yLoc = yTop
					rowTotal=0
					horizon -= horizonShift
					}
					if(i==0){cur = makePairA("RH", typeVal, hPad, horizon, yLoc)}
					else if(i==1){cur = makePairA("LH", typeVal, hPad, horizon, yLoc)}
						refineWeaponDisplay(cur, i, horizon, yLoc, yShift, hPad)
						cur.setTextFormat(typeVal);
						cur.autoSize = "right";
							
						yLoc += yShift
					}
				}
				
				
				
				
			}


			function refineItemDisplay(textBox, index, xlo, ylo, shift, pad){
				textBox.htmlText = actra.equip.attire.item[index].name
				if(actra.equip.attire.item[index].exists){
					textBox.htmlText = actra.equip.attire.item[index].name
					if(actra.equip.attire.item[index].name == ""){textBox.htmlText = "???"}
					
					var nameLength = actra.equip.attire.item[index].name.length
					if(nameLength > 15){
						var adjustedType = new TextFormat();
						adjustedType.size = 6
				
						if(nameLength > 20){
							adjustedType.size = 5
							
							if(nameLength > 25){
								adjustedType.size = 4
							
								if(nameLength > 32){
									
									textBox.htmlText = (actra.equip.attire.item[index].name).substr(0,31)+".."
								}
							}
						}
					textBox.setTextFormat(adjustedType);
					}
					
					
					var form = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:xlo-pad, _y:ylo+11}).val	
					
					
					form.htmlText = core.util.func.HEX8((Number(actra.equip.attire.item[index].id).toString(16)).toUpperCase())
					form.setTextFormat(typeVal);
					form.autoSize = "right";
					
					var esgType = o.cfg.esg.getEsg(index, actra.gender)
					var icon = this.attachMovie("aesg_classic_"+esgType, icon, this.getNextHighestDepth(), {_x:xlo+17, _y:ylo});
					icon._xscale = 60
					icon._yscale = 60
				}				
				
			}
			
			
			
				function refineWeaponDisplay(textBox, index, xlo, ylo, shift, pad){
				textBox.htmlText = actra.equip.armament.hand[index].name
				if(actra.equip.armament.hand[index].exists){
					textBox.htmlText = actra.equip.armament.hand[index].name
					if(actra.equip.armament.hand[index].name == ""){textBox.htmlText = "???"}
					
					var nameLength = actra.equip.armament.hand[index].name.length
					if(nameLength > 15){
						var adjustedType = new TextFormat();
						adjustedType.size = 6
				
						if(nameLength > 20){
							adjustedType.size = 5
							
							if(nameLength > 25){
								adjustedType.size = 4
							
								if(nameLength > 32){
									
									textBox.htmlText = (actra.equip.armament.hand[index].name).substr(0,31)+".."
								}
							}
						}
					textBox.setTextFormat(adjustedType);
					}
					
					
					var form = this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:xlo-pad, _y:ylo+11}).val	
					
					
										
					form.htmlText = core.util.func.HEX8((Number(actra.equip.armament.hand[index].id).toString(16)).toUpperCase())
					form.setTextFormat(typeVal);
					form.autoSize = "right";
					
					var esgType = "weapon"
					var icon = this.attachMovie("aesg_classic_"+esgType, icon, this.getNextHighestDepth(), {_x:xlo+17, _y:ylo});
					icon._xscale = 60
					icon._yscale = 60
				}				
				
			}
			
			function makePairA(entryName, typeFace, hPadding, xLoc, yLocation){
				var valBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:xLoc, _y:yLocation}).val					
				valBox.htmlText = entryName
				valBox.setTextFormat(typeVar);
				valBox.autoSize = "right";
				

				return this.attachMovie("genericText", "nameVaL", this.getNextHighestDepth(), {_x:xLoc-hPadding, _y:yLocation-4}).val					
			}
			
				function createHeader(headerTitle, xLocation, yLocation){
				
				var typeHead = new TextFormat();
				typeHead.letterSpacing = 1.2
				typeHead.font = o.fonts.l
				typeHead.color = 0xcccccc
				typeHead.size = 9.5
				
				var header = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:xLocation, _y:yLocation})	
				
				
				
				header.val.htmlText = headerTitle.toUpperCase() 
				header.val.setTextFormat(typeHead);
				header.val.autoSize = "right";

				header.lineStyle(1, 0xcccccc, 100, true, "none", "round", "miter", 0.25);
				header.moveTo(0, header.val._y+18);
				header.lineTo(0-125, header.val._y+18);
			}
				
				
			

}