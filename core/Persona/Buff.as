import skse; 
import mx.utils.Delegate;

class Buff
{


var o
var dia
var cast
var targ
var buffType
var buff
var buffUnit 


		public function Buff(sceneUnit, caster, target, unit){			
			o = sceneUnit.o
			dia = sceneUnit.dia
			buffUnit = unit
			buffType = buffUnit.id
			cast = caster
			targ = target

			trace(buffType)
			beginBuff()
			
			
		}

		
		function beginBuff(){
			if(!cast.formBound){
				if(!cast.dat.personaData){
				var scout = new Scout(o)
				var sourceBack = {fn:getBuff, scope:this}
				scout.retrieveActraData("persona", cast, sourceBack)
				}else{cast.formBind()
				getBuff()
				}
			}else{getBuff()}
		}
			
		
		public function getBuff(){
			var longEx = {fn:buffIsLoaded, scope:this}
			o.lib.getMotifData(longEx, "sorcery", "buff", "_OWiz", buffType)			
		}
		
		public function buffIsLoaded(){
			buff = o.lib.getMotif("sorcery", "buff", "_OWiz", buffType)
		 	makeBuff()
		}
				
		
		
		
		
		
		
var shader
var spell
var activated = false


		public function makeBuff(){
		shader = []
		spell = []
		setupBuff()
		}
		
		function setupBuff(){
			activated = true
			
			if(buff.buffshader){		
				for (var i=0; i < buff.buffshader.length; i++){
					var L = shader.push(buff.buffshader[i])
					shaderFX(L-1)
				}
			}
				for (var i=0; i < buff.buffspell.length; i++){
					var L = spell.push(buff.buffspell[i])
					spellFX(L-1)
				}
		}
		
		
		function shaderFX(index){
			if(activated){
				trace("NEW SHADER")
				trace(shader[index].per)
				if(core.util.func.RNG(0, 100) < shader[index].per){				
					var chosenShader = core.util.func.TIERper(shader[index].shader)	
					sendShader(index, chosenShader)
				} else {
					var timeStorage = []
					timeStorage[0] = index
					var time = new OTime({fn:shaderFX, scope:this}, core.util.func.PAN(shader[index].ti, shader[index].tipan)*1000, timeStorage)
				}
			}
		}
		
		function sendShader(index, selectedShader){
			if(selectedShader){
				if(selectedShader.fo == "O")
					trace("WE GOT HERE")
					var shaderString = o.cin.convert("shader", selectedShader.id)+","+selectedShader.chan+","+selectedShader.dur
					skse.SendModEvent("0SAA"+targ.id+"_OShader", String(shaderString))
					trace("0SAA"+targ.id+"_OShader")
					trace(shaderString)
				}
				
				var timeStorage = []
				timeStorage[0] = index
				var time = new OTime({fn:shaderFX, scope:this}, core.util.func.PAN(shader[index].ti, shader[index].tipan)*1000, timeStorage)
				
		}
		
		function sendSpell(index, selectedCast, selectedSpell){
			if(selectedSpell){
				if(selectedSpell.fo == "O")
					var cnode = core.util.func.TIERper(selectedCast.cnode).id
					var tnode = core.util.func.TIERper(selectedCast.tnode).id
			
					var spellString = o.cin.convert("spell", selectedSpell.id)+","+selectedCast.cast+","+core.util.func.sceneNodeKey(dia, targ, cnode)+","+selectedCast.targ+","+core.util.func.sceneNodeKey(dia, targ, tnode)
					skse.SendModEvent("0SAO"+dia.id+"_OSpell", String(spellString))
				}
				
				
				var timeStorage = []
				timeStorage[0] = index
				var time = new OTime({fn:spellFX, scope:this}, core.util.func.PAN(spell[index].ti, spell[index].tipan)*1000, timeStorage)
			
		}
		
		
		
		function spellFX(index){
			if(activated){
				if(core.util.func.RNG(0, 100) < spell[index].per){				
					var chosenCast = core.util.func.TIERper(spell[index].cast)
					var chosenSpell = core.util.func.TIERper(chosenCast.spell)
					trace("THIS IS THE CHOSENSPELL: "+chosenSpell.id)
					sendSpell(index, chosenCast, chosenSpell)
				}else{
					var timeStorage = []
					timeStorage[0] = index
					var time = new OTime({fn:spellFX, scope:this}, core.util.func.PAN(spell[index].ti, spell[index].tipan)*1000, timeStorage)
				}
			}
		}
		
		function endBuff(){
			activated = false
			trace("BUFF ENDING SEND")
		}
		



}






