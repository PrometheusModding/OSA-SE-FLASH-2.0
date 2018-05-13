
class core.actor.scale{

var o
var actra
var id

var index

var body
var belly

var rearL
var rearR
var chestL
var chestR

var cockBase
var cockShaft
var cockScrotum
var cockGen2
var cockGen3
var cockGen4
var cockGen5
var cockGen6

var modeOCock = false

		public function scale(om, act){
		o = om
		actra = act	
		index = []

		body = new core.actor.scalepart(o, act, "NPC Root [Root]")
		index.push(body)
		
		
		belly = new core.actor.scalepart(o, act, "NPC Belly")
		index.push(belly)

		rearL = new core.actor.scalepart(o, act, "NPC L Butt")
		index.push(rearL)
		
		rearR = new core.actor.scalepart(o, act, "NPC R Butt")
		index.push(rearR)
		
		chestL = new core.actor.scalepart(o, act, "NPC L Breast")
		index.push(chestL)
		
		chestR = new core.actor.scalepart(o, act, "NPC R Breast")
		index.push(chestR)
		
		
		
		cockBase = new core.actor.scalepart(o, act, "NPC GenitalsBase [GenBase]")
		index.push(cockBase)
		
		cockShaft = new core.actor.scalepart(o, act, "NPC Genitals01 [Gen01]")
		index.push(cockShaft)

		cockScrotum = new core.actor.scalepart(o, act, "NPC GenitalsScrotum [GenScrot]")
		index.push(cockScrotum)
		
		cockGen2 = new core.actor.scalepart(o, act, "NPC Genitals02 [Gen02]")
		index.push(cockGen2)
		
		cockGen3 = new core.actor.scalepart(o, act, "NPC Genitals03 [Gen03]")
		index.push(cockGen3)
		
		cockGen4 = new core.actor.scalepart(o, act, "NPC Genitals04 [Gen04]")
		index.push(cockGen4)
		
		cockGen5 = new core.actor.scalepart(o, act, "NPC Genitals05 [Gen05]")
		index.push(cockGen5)
		
		cockGen6 = new core.actor.scalepart(o, act, "NPC Genitals06 [Gen06]")
		index.push(cockGen6)
		}
	
	
		
		
		public function restore(){			
		for (var i=0; i < index.length; i++){
			index[i].restore()
			}
		}
		
		public function snapOCock(shaftValue, scrotumValue){	
			if(o.cfg.config.allowMaleGenitalScaling){
				if(!modeOCock){initOCock()}
				cockShaft.snapScale(shaftValue)
				cockScrotum.snapScale(scrotumValue)
			}
		}
		
		public function blendOCock(shaftValue, scrotumValue){		
			if(o.cfg.config.allowMaleGenitalScaling){
				if(!modeOCock){initOCock()}
				cockShaft.blendScale(shaftValue)
				cockScrotum.blendScale(scrotumValue)
			}
		}
		
		public function restoreOCock(shaftValue, scrotumValue){		
			if(o.cfg.config.allowMaleGenitalScaling){
				if(!modeOCock){initOCock()}
				cockShaft.restoreBlend()
				cockScrotum.restoreBlend()
			}
		}
		
		public function initOCock(){ 
		modeOCock = true
		cockBase.snapScale(1.0)
		cockGen2.snapScale(1.0)
		cockGen3.snapScale(1.0)
		cockGen4.snapScale(1.0)
		cockGen5.snapScale(1.0)
		cockGen6.snapScale(1.0)
		}

}