import mx.utils.Delegate;

class core.dias.os2.anim
{

var o
var dia
var scene
var animXML
var solo
var union
var activated
var agent

var speedable


		public function anim(core, diasa, scena, aXML){
		o = core
		dia = diasa
		scene = scena
		animXML = aXML
		union = []
		solo = []		
		activated = true
		speedable = []			
			
		}
		
		
		function init(){
			for (var i=0; i < animXML.animrole.length; i++) {
				this["animType_"+animXML.animrole[i].type.toUpperCase()](i, animXML.animrole[i])				
			}
			
			begin()
		}
		
		function begin(){
			
			for (var i=0; i < union.length; i++) {
				if(union[i].boss){
					union[i].boss.startAnimation(union[i])
				}
			}
			
			for (var i=0; i < solo.length; i++) {
					solo[i].boss.startAnimation(solo[i])
			}
			
		}
		
		
		function animType_UNION(acRole, anRole){
			if(!union[anRole.ix]){
				
				union[anRole.ix] = {role:[], xml:animXML.union[anRole.ix].animplan[0], boss:new core.dias.os2.animengine.union(o, dia, scene, this)}
			}
				union[anRole.ix].role.push(acRole)	
		}
		
		function animType_SOLO(acRole, anRole){
			
			 solo.push({role:[], xml:anRole.animplan[0], boss:new core.dias.os2.animengine.solo(o, dia, scene, this)})
			
				solo[solo.length-1].role.push(acRole)	
		}
		
		
		public function speedChange(ix){
			speedable[ix].speedChange()
		}
		
		public function End(){
			activated = false			
		}
}