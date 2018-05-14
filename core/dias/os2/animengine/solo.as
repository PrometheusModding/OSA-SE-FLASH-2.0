import mx.utils.Delegate;

class core.dias.os2.animengine.solo
{

var o
var dia
var scene
var agent
var unit

var curAnim 
var curStep

var time





		



		public function solo(core, diasa, scena, animAgent){
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
			exploreAnim()
			playAnimation()
			restart()
		}
		
		function restart(){			
		if(agent.activated){
			time = new Time({fn:loop, scope:this}, curAnim.l*1000)
		}
		}
		
		function exploreAnim(){
			if(curStep.anim[1]){
				
			}else{
				curAnim = curStep.anim[0]
			}
			
			
		}
		
		function selectAnimation(){
			if (unit.xml.speed[0]){
				
				scene.setAnimSpeed()				
				speedChange()
												
				agent.speedable[unit.xml.speed[0].ix] = this
	
			}else{
				curStep = unit.xml
				exploreAnim()
			}
		}
		
		function speedChange(){				
				var speedIx = unit.xml.speed[0].ix
				
				curStep = unit.xml.speed[scene.speed[scene.scene.speeddata[0].speedevent[speedIx].actor]]
				exploreAnim()
				
				dia.menuNav.updateSpeedText(unit.xml.speed[scene.scene.speeddata[0].speedevent[speedIx].actor])				
		}
		
		function playAnimation(){
			
				
			if(agent.activated){				
				for (var i=0; i < unit.role.length; i++) {				
					o.skyString("0SAA"+dia.actra[unit.role[i]].id+"_Animate", String(curAnim.id))	
					
				}
			}
		}
}
