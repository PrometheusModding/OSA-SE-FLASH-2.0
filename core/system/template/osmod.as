class core.system.template.osmod
{
	
var id
var index
var actors
var library
var name
var desc
var plug
var button

		public function fill(modData){						
		id		= modData[0]
		library = modData[1]
		name	= modData[2]
		desc	= modData[3]		
		button	= modData[4]		
		plug	= new Object
		}

}