import skse; 


class Cast
{


var o
var dia
var cast
var caster
var target
var castType
var castUnit 


		public function Cast(sceneUnit, unit){			

			o = sceneUnit.o
			dia = sceneUnit.dia
			castUnit = unit.cast[0]
			castType = castUnit.id
			caster = sceneUnit.actra[castUnit.cast]
			target = sceneUnit.actra[castUnit.targ]

			trace("CASTTYPE: "+castType)
			trace("CASTER: "+caster.name)
			trace("TARGET: "+target.name)
			beginCast()
			
			
		}

		
		function beginCast(){
			if(!caster.formBound){
				if(!caster.dat.personaData){
				var scout = new Scout(o)
				var sourceBack = {fn:getCast, scope:this}
				scout.retrieveActraData("persona", caster, sourceBack)
				}else{caster.formBind()
				getCast()
				}
			}else{getCast()}
		}
			
		
		public function getCast(){
			trace("CAST GOT HERE")
			var longEx = {fn:castIsLoaded, scope:this}
			o.lib.getMotifData(longEx, "sorcery", "cast", "_OWiz", castType)			
		}
		
		public function castIsLoaded(){
			cast = o.lib.getMotif("sorcery", "cast", "_OWiz", castType)
		 	spellFX()
		}
				
				
		
		
		function sendSpellsingle(chosenCast){
			if(chosenCast){
				if(chosenCast.fo == "O")
				
					var cnode = core.util.func.TIERper(castUnit.cnode).id
					var tnode = core.util.func.TIERper(castUnit.tnode).id			
					var spellString = o.cin.convert("spell", chosenCast.id)+","+castUnit.cast+","+core.util.func.sceneNodeKey(dia, target, cnode)+","+castUnit.targ+","+core.util.func.sceneNodeKey(dia, target, tnode)
					skse.SendModEvent("0SAO"+dia.id+"_OSpell", String(spellString))

				}
			
		}
		
		
		
		function spellFX(){			
				
					var chosenCast = core.util.func.TIERper(cast[castUnit.ty+castUnit.sy][0].spell)
					trace("THIS IS THE CHOSENSPELL: "+chosenCast.id)
					trace("THIS IS THE CHOSENSPELL: "+castUnit.ty+castUnit.sy)
					this["sendSpell"+castUnit.ty](chosenCast)
			
		}
	


}






