import skse; 

class OSFX
{


var fxu
var osfx
var actra
var role
		public function OSFX(u, act, actRole, command){
			fxu = u
			role = actRole
			actra = act
			osfx = command
			trace("			!!!OSFX")
			this["pre"+osfx.cmd]()
			if (osfx.ti){var time = new Time({fn:this[osfx.cmd], scope:this}, (osfx.ti)*1000)}else{this[osfx.cmd]()} 
		}
		
		
		function preESG_OFF(){
			actra.equip.attire.preUndressESG(osfx.esg)
		}

		
		function REACT(){
			//trace("REACTION HAPPANED")
			//var react = new Reaction(o, actra, osfx.iso[0])
		}
		
		function EVNT(){
			var evnt = new Evnt(fxu.o, actra, osfx.evnt[0])
		}
		
		
		function CAST(){
			trace("CAST HAPPENED")
			var cast = new Cast(fxu, osfx)
		}
		
		function KILL(){
			var killType = ""
			
			if(osfx.ty){
				killType = osfx.ty
			}
			
			if(osfx.whodid){
				skse.SendModEvent(String("0SAA"+actra.id+"_Kill"), String(killType), Number(0), Number(fxu.actra[osfx.whodid].trueID))
				fxu.actra[osfx.whodid].trueID
			}
			skse.SendModEvent(String("0SAA"+actra.id+"_Kill"), String(killType))
		}
		
		function EYE_DEST(){ 
		trace("EYE DEST HAPPANED")
		actra.expression.focusOn(fxu.destination.eyes[role], "primary")
		}
		
		
		function CINEMA(){ 
		trace("EYE DEST HAPPANED")
		actra.expression.focusOn(fxu.destination.eyes[role], "primary")
		}
		
		
		function ACTOR_TEMPSTAT(){
			actra.temp.sourceOFX(osfx)
		}
		
		function SAY(){ 
		trace("SAYA HAPPENED"+osfx.ty)
		actra.voice.say(osfx.fo, osfx.ty, osfx.sy, osfx.nolock)
		}
		
		public function ESG_OFF(){ 
		actra.equip.attire.undressEsg(osfx.esg)
		}
		
		public function ESG_ON(){ 
		actra.equip.attire.dressEsg(osfx.esg)
		}
		
		public function BLS_OGENTLEMAN(){ 
		if(!osfx.suitecmd){
		var suite =  fxu.module.suite[0].gentleman[0][osfx.suite][actra.gender]
		actra.body.scale.blendOCock(suite.shaft, suite.scrotum)
		
		}else if(osfx.suitecmd == "ao"){
			
		 actra.body.scale.restoreOCock("ao", "ao")
		
		}else if(osfx.suitecmd == "df"){			
		
		var suite =  fxu.module.role[role]["scale"][actra.gender]		
		actra.body.scale.blendOCock(suite.shaft, suite.scrotum)		
		
		}
		}
		
		public function BLS_FACE(){ 
		if(!osfx.suitecmd){
		var suite =  fxu.module.suite[0].face[0][osfx.suite][actra.gender]
			for (var i=0; i < suite.adj.length; i++){
				actra.expression.adjust(suite.adj[i].ty, suite.adj[i].sy, suite.adj[i].am)
				trace("FACE GO SEND:"+suite.adj[i].ty)
			}
		}
		else if(osfx.suitecmd == "df"){
		var suite =  fxu.module.role[role].mouth[0][osfx.suite][actra.gender]
			for (var i=0; i < suite.adj.length; i++){
				actra.expression.adjustToDefault(suite.adj[i].ty, suite.adj[i].sy, suite.adj[i].am)
				trace("FACE DEFAULT SEND:"+suite.adj[i].ty)
			}
		}
		}
				

					
		public function BLS_MOUTH(){ 
		if(!osfx.suitecmd){
		var suite =  fxu.module.suite[0].mouth[0][osfx.suite][actra.gender]
		
		var mouthMovement = []
		
			for (var i=0; i < suite.adj.length; i++){
				mouthMovement.push({sy:suite.adj[i].sy, am:suite.adj[i].am})
				trace("MOUTH MOVED:"+mouthMovement)
			}
			actra.expression.expressMouth(mouthMovement, false, false)	
			
		}else if(osfx.suitecmd == "df"){
		var suite =  fxu.module.suite[0].mouth[0][osfx.suite][actra.gender]
			for (var i=0; i < suite.adj.length; i++){
				actra.expression.adjustToDefault(suite.adj[i].ty, suite.adj[i].sy, suite.adj[i].am)
				trace("FACE DEFAULT SEND:"+suite.adj[i].ty)
			}
		}
		}
		


}


