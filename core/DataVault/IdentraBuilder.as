
class IdentraBuilder
{
	


		public static function primary(o, identra){
		
			for (var i=0; i < identra.length; i++){
				buildIdentityBase(o, identra[i])
			}
		}
		
		public static function buildIdentityBase(o, iData){
			buildLipShape(o, iData.lipshape)
			buildVoiceSuite(o, iData.voicesuite)
			buildIntimacy(o, iData.intimacy[0])
		}
		
		public static function buildLipShape(o, iData){
			//trace("LIP SHAPE TEST"+iData[0].id)
			for (var i=0; i < iData.length; i++){
				if(iData[i].gender == "U"){
					o.lib.codex["MLipShape"].push(iData[i])
					o.lib.codex["FLipShape"].push(iData[i])
				}else{
					o.lib.codex[iData[i].gender+"LipShape"].push(iData[i])
				}
				o.lib.codex.RLipShape[iData[i].id] = new Object
				o.lib.codex.RLipShape[iData[i].id] = iData[i]
			}
		}
		
		public static function buildVoiceSuite(o, iData){
			//trace("LIP SHAPE TEST"+iData[0].id)
			for (var i=0; i < iData.length; i++){
				if(iData[i].gender == "U"){
					o.lib.codex["MVoiceSuite"].push(iData[i])
					o.lib.codex["FVoiceSuit"].push(iData[i])
				}else{
					o.lib.codex[iData[i].gender+"VoiceSuite"].push(iData[i])
				}
				o.lib.codex.RLipShape[iData[i].id] = new Object
				o.lib.codex.RLipShape[iData[i].id] = iData[i]
			}
		}
		
		public static function buildIntimacy(o, iData){
			trace("BUILDING INTIMACY"+iData.motif[0].id)
			buildSubClass(o, "motif", iData)
			buildDubClass(o, "mien", "expression", iData.mien[0])
			buildDubClass(o, "mien", "voice", iData.mien[0])
			buildDubClass(o, "emo", "expression", iData.emo[0])
			buildDubClass(o, "emo", "voice", iData.emo[0])
			buildDubClass(o, "react", "kiss", iData.react[0])
			buildDubClass(o, "react", "emb", iData.react[0])
			buildDubClass(o, "react", "gentle", iData.react[0])
			buildDubClass(o, "react", "phys", iData.react[0])
			buildDubClass(o, "react", "rough", iData.react[0])
			buildDubClass(o, "react", "abuse", iData.react[0])
			buildDubClass(o, "react", "expo", iData.react[0])
			buildDubClass(o, "react", "clothes", iData.react[0])
			buildDubClass(o, "react", "hair", iData.react[0])
			buildDubClass(o, "react", "spank", iData.react[0])
			buildDubClass(o, "react", "inpus", iData.react[0])
			buildDubClass(o, "react", "inmo", iData.react[0])
			buildDubClass(o, "react", "inanal", iData.react[0])
			buildDubClass(o, "react", "pnpus", iData.react[0])
			buildDubClass(o, "react", "pnmo", iData.react[0])
			buildDubClass(o, "react", "pnanal", iData.react[0])
		}
		
		public static function buildSubClass(o, subClass, iData){

			for (var i=0; i < iData[subClass].length; i++){
				if(iData[subClass][i].gender == "U"){
					o.lib.codex["MClas"][subClass].push(iData[subClass][i].id)
					o.lib.codex["FClas"][subClass].push(iData[subClass][i].id)
				}else{
					o.lib.codex[iData[subClass][i].gender+"Clas"][subClass].push(iData[subClass][i].id)
				}
			}
		}
		
		public static function buildDubClass(o, subClass, dubClass, iData){
			
			for (var i=0; i < iData[dubClass].length; i++){
				if(iData[dubClass][i].gender == "U"){
					o.lib.codex["MClas"][subClass][dubClass].push(iData[dubClass][i].id)
					o.lib.codex["FClas"][subClass][dubClass].push(iData[dubClass][i].id)
				}else{
					trace("BUILDING "+subClass+" "+dubClass+" "+iData[dubClass][i].gender)
					o.lib.codex[iData[dubClass][i].gender+"Clas"][subClass][dubClass].push(iData[dubClass][i].id)
				}
			}
		}
}