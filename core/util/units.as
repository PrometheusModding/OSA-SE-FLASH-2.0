class core.util.units
{


			public static function heightSkyToMetric(OHeight, Ratio, sign):String{
				var metricHeight = String(OHeight*Ratio)
				if(sign){return metricHeight.substr(0, 5)+" M"}
				else{return metricHeight.substr(0, 5)}
			}
			
			
			public static function heightSkyToUSA(OHeight, Ratio, sign):String{
				var usaHeight = String((OHeight*Ratio)*39.370)
				
				if(sign){
					var totalFeet = Math.floor(usaHeight/12)
					var inches = Math.floor(usaHeight - (totalFeet*12))  
					   if(inches != 0 && inches !=  1){return totalFeet+" feet "+inches+" inches"}
					   else if(inches == 1){return totalFeet+" feet "+inches+" inch"}
					   else if(inches == 0){return totalFeet+" feet"}
				}
				else{return totalFeet+"' "+inches+"\""}
			}
			
			
			public static function inchesToMeters(inches){
				return inches/39.370
			}
			
			public static function inchesToFeet(usaHeight){
					var totalFeet = Math.floor(usaHeight/12)
					var inches = Math.floor(usaHeight - (totalFeet*12))  
					   if(inches != 0 && inches !=  1){return totalFeet+" feet "+inches+" inches"}
					   else if(inches == 1){return totalFeet+" feet "+inches+" inch"}
					   else if(inches == 0){return totalFeet+" feet"}
			}
			
			
			public static function weightSkyToUSA(bodyThickness, scale, o, gender):String{
				
				//80 1.0 0
				
				var heightUSA = (scale*o.cfg.units.height[gender].ratioVirtualToEarth)*39.370
				
				//70.0786
				
				var heightModifier = (heightUSA - 60) * o.cfg.units.weight[gender].perInch
				
				//38.29868
				var thicknessModifier = bodyThickness * o.cfg.units.weight[gender].perThickness
										
				//.272
				
				var baseThick = Number(o.cfg.units.weight[gender].base) + (o.cfg.units.weight[gender].base * thicknessModifier)
				
				//146.28

				var additionalThick = heightModifier + (heightModifier * thicknessModifier)

				//125.417
				
				
				
				var totalWeight = Number(baseThick)+(additionalThick)
				
				//231
				
				return String(totalWeight)
			}
			
			public static function weightSkyToUSA2(bodyThickness, oheight, units, gender):String{
				
				var heightUSA = (oheight*units.heightSkyToEarthRatio)*39.370
				var heightModifier = (heightUSA - 60) * units["modifierWeightPerInch"+gender]
				
				var thicknessModifier = bodyThickness * units["modifierBodyThickness"+gender]
										 
				var baseThick = units["modifierWeightBase"+gender] + (units["modifierWeightBase"+gender] * thicknessModifier)
				var additionalThick = heightModifier + (heightModifier * thicknessModifier)

				
				var totalWeight = baseThick+additionalThick
				return String(totalWeight)
			}
			
			
			public static function weightUSAtoMetric(weight):Number{				
				return weight/2.2046
			}
			
			


}