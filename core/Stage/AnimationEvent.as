
class AnimationEvent
{
var o
var sceneUnit

	function AnimationEvent(core, scu){
			o = core
			sceneUnit = scu
	}

	function spark(AE){
		this[sceneUnit.scena.animation.ae[AE].evty](sceneUnit.scena.animation.ae[AE])
	}
	
	function sexThrustR(eventUnit){
		sceneUnit.actra[eventUnit.tar].body.makeSound("ibo", eventUnit.sound+"dry", eventUnit.soundpow)
		sceneUnit.scena.motif[eventUnit.tar].reaction()
		
	}
	
	function cockSuckG(eventUnit){
		//sceneUnit.scena.motif[eventUnit.whodid].reaction()
		sceneUnit.actra[eventUnit.whodid].voice.say("ivos", eventUnit.sound, eventUnit.soundpow, true)
	}


}