
class core.dias.util.calcTags
{


		
		public static function analyzeTags(tag){
		
		return calcGroupList(tag)
		}
		
		public static function calcGroupList(tag){
		var category = tag.dat["c_"+tag.category][0]
		var categoryList = []
			for (var i=0; i < category.group.length; i++){
				categoryList.push(category.group[i].id)
			}
		return assembleGroup(categoryList, tag)  
		}
		
		public static function assembleGroup(categoryList, tag){
			var possibilities = []
			for (var j=0; j < categoryList.length; j++){
				for (var k=0; k < tag.dat[categoryList[j]].length; k++){
				possibilities.push(tag.dat[categoryList[j]][k].id)
				}
			}
			return possibilities[core.util.func.RNG(0, possibilities.length-1)]
		}
}	


