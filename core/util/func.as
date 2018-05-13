import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;
import flash.filters.BlurFilter;

class core.util.func {

		
			public static function setOrDefault(prop, def){
				if(!prop){
					return def
					}else{
					return prop;
					}
			}

			
			public static function filterDropShadow(textMode, blur, alpha, strength, quality){
					var distance:Number = 0;
					var angleInDegrees:Number = 0;
					var color:Number = 0x000000;
				
					
						var blur = core.util.func.setOrDefault(textMode.dsBlur, blur)					
						var blurX:Number = blur;
						var blurY:Number = blur;

						var alpha:Number = core.util.func.setOrDefault(textMode.dsAlpha, alpha)
						var strength:Number = core.util.func.setOrDefault(textMode.dsStrength, strength)
						var quality:Number = core.util.func.setOrDefault(textMode.dsQuality, quality)
						
					
					
					var inner:Boolean = false;
					var knockout:Boolean = false;
					var hideObject:Boolean = false;
					
					var filter:DropShadowFilter = new DropShadowFilter(distance, 
																		angleInDegrees, 
																		color, 
																		alpha, 
																		blurX, 
																		blurY, 
																		strength, 
																		quality, 
																		inner, 
																		knockout, 
																		hideObject);
					return filter
			}
			
			public static function filterGlow(textMode, blur, alpha, strength, quality){
				var blur = core.util.func.setOrDefault(textMode.gloBlur, blur)					
						var blurX:Number = blur;
						var blurY:Number = blur;

						var alpha:Number = core.util.func.setOrDefault(textMode.gloAlpha, alpha)
						var strength:Number = core.util.func.setOrDefault(textMode.gloStrength, strength)
						var quality:Number = core.util.func.setOrDefault(textMode.gloQuality, quality)
						
					
					var color:Number = 0xFFFFFF;					
					var inner:Boolean = false;
					
					var filter:GlowFilter = new GlowFilter(color,alpha,blurX,blurY,strength,quality,inner);
					return filter
			}
			
			
			
			public static function makeBlur(blurX, blurY, quality){								
					var filter:BlurFilter = new BlurFilter(blurX, blurY, quality);
					return filter
			}
			
			public static function RNGF2(minNum:Number, maxNum:Number):Number 
			{
					var num = (Math.random() * (maxNum - minNum + 1)) + minNum	
					num *= 100;
					num = Math.round(num);
					num /= 100;

					return num
			}
	
			
			public static function minMax(block, truncate){ 
					if(!truncate){
					truncate=""
					}
					if(Number(block.fper)&&RNG(0,100)<=Number(block.fper)){
							if(RNG(0,100)<=Number(block.fmin)){
								return core.util.func["RNGF"+truncate](Number(block.fmin), Number(block.min))
							}else{
								return core.util.func["RNGF"+truncate](Number(block.max), Number(block.fmax))
							}

					}else{
						return core.util.func["RNGF"+truncate](Number(block.min),Number(block.max))
					}
			}
			
			
			public static function RNG(minNum:Number, maxNum:Number):Number 
			{
    		return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
			}
			
			public static function PAN(amount, pan){
			if (pan){
				return Number(amount)+Number(core.util.func.RNG(-pan, pan))
			}else{return amount}			
						
			}
			
			public static function HEX8(hexID:String):String
		{
			if(hexID.length != 8){
						if(hexID.length == 7){hexID = "0"+hexID}
						else if(hexID.length == 6){hexID = "00"+hexID}
						else if(hexID.length == 5){hexID = "000"+hexID}
						else if(hexID.length == 4){hexID = "0000"+hexID}
						else if(hexID.length == 3){hexID = "00000"+hexID}
						else if(hexID.length == 2){hexID = "000000"+hexID}
						else if(hexID.length == 1){hexID = "0000000"+hexID}
						else if(hexID.length == 0){hexID = "00000000"+hexID}
					}
			
    		return hexID
			}
		
			public static function TIERrandotier(tier){
			return tier[core.util.func.RNG(0, tier.length-1)]
			}
		
			public static function TIERper(activeTier){

						var R = core.util.func.RNG(0,99)
						var count = 0
						
						while (R > activeTier[count].per){
						count ++;
						}
						return activeTier[count]
			}
		
			public static function TIERuncapped(tier, desired){
			var desiredTier = tier[desired]
			if(!desiredTier){
			desiredTier = tier[tier.length-1]	
			}
			return desiredTier
			}
			
			public static function TIERperando(randoTier){
			if(randoTier[0].per){
					return TIERper(randoTier)
			}else{
					return TIERrandotier(randoTier)
			}
		}
		
			public static function sceneNodeKey(dia, actra, node){
			if(node.substring(0,1) == "!"){
			return dia.scena.getNodeKey(actra.id, node.substring(1))
			}else{return node}
			}
		
			public static function fontblock(o, _font, fontBlock){				
				if(fontBlock.fstyle){_font.font = o.fonts[fontBlock.fstyle]}				
				if(fontBlock.fcolor){_font.color = "0x"+fontBlock.fcolor}				
				if(fontBlock.fsize){_font.size = fontBlock.fsize}				
				if(fontBlock.fkern){_font.letterSpacing = fontBlock.fkern}				
				if(fontBlock.fleading){_font.leading = fontBlock.fleading}				
				if(fontBlock.findent){_font.indent = fontBlock.findent}				
				if(fontBlock.falign){_font.leading = fontBlock.falign}				
				return _font				
			}
			
			public static function textinsert(v, insert){				
				v = v.split("$$$").join(insert)		
				return v			
			}
			
			
			public static function ampRGB(rgb,r,g,b){
				var newRGB = rgb.toString(16)
					
					var r =  Math.floor(Number("0x"+(newRGB.substr(0,2)))*(1+r))
					if(r>255){r=255}
					if(r<0){r=0}
					
					r = r.toString(16)
					if(r.length==1){
					r = "0"+r
					}
					
					var g = Math.floor(Number("0x"+(newRGB.substr(2,2)))*(1+g))
					if(g>255){g=255}
					if(g<0){g=0}
					
					g = g.toString(16)
					if(g.length==1){
					g = "0"+g
					}
					
					var b =  Math.floor(Number("0x"+(newRGB.substr(4,2)))*(1+b))
					if(b>255){b=255}
					if(b<0){b=0}					
					b = b.toString(16)
					if(b.length==1){
					b = "0"+b
					}
					
					return Number("0x"+r+g+b)
			}
			
			
			
			public static function propApply(obj, prop){
				for (var i=0; i < prop.length; i++){
					obj[prop[i].id] += Number(prop[i].am)
				}
			}
			
			public static function iconAdjust(x, ico){
				if(x.iRot){
					ico._rotation = x.iRot
				}
				if(x.iRevX=="1"){
					ico._xscale = -ico._xscale
				}
			}
		
}