import mx.utils.Delegate;

class core.dias.os2.animengine.union
{

var o
var dia
var scene
var agent
var unit

var curAnim 

var time




		public function union(core, diasa, scena, animAgent){
		o = core
		dia = diasa		
		scene = scena
		agent = animAgent		
		
		}
		
		function startAnimation(unitInc){
			
			
				unit = unitInc
			
				selectAnimation()
				playAnimation()
				
				restart()
			
		}
		
		
		function loop(){
			
			playAnimation()
			restart()
		}
		
		function restart(){			
		if(agent.activated){
			time = new Time({fn:loop, scope:this}, curAnim.l*1000)
		}
		}
		
		
		function selectAnimation(){
			if (unit.xml.speed[0]){
				
				scene.setAnimSpeed()				
				
				speedChange()
												
				agent.speedable[unit.xml.speed[0].ix] = this
				//o.debugOutput(scene.scene.speeddata[0].speedevent[speedIx].actor)
			}else{
				curAnim = unit.xml.unim[0]
			}
		}
		
		function speedChange(){
			
				
				var speedIx = unit.xml.speed[0].ix
				curAnim = unit.xml.speed[scene.speed[scene.scene.speeddata[0].speedevent[speedIx].actor]].unim[0]		
				
				
				
				dia.menuNav.updateSpeedText(unit.xml.speed[scene.scene.speeddata[0].speedevent[speedIx].actor])
				
		}
		
		function playAnimation(){
			
				
			if(agent.activated){				
				for (var i=0; i < unit.role.length; i++) {				
					o.skyString("0SAA"+dia.actra[unit.role[i]].id+"_Animate", String(curAnim.anim[i].id))	
					
				}
			}
		}
}