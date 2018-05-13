import skse;

class core.actor.body
{
	
var o
var actra

var scale

var weightSky
var weightEarthOrig
var weightEarthCurrent

var ass 
var thighs
var chest

var ibo
var spank

var bodyScale
var bodyScaleModified
var isBodyModified





		public function body(ocore, act){
		o = ocore
		actra = act

		isBodyModified = false
		scale = new core.actor.scale(o, act)
		
		chest = new core.actor.bodypart(o, act)
		ass = new core.actor.bodypart(o, act)
		thighs = new core.actor.bodypart(o, act)
		
		ibo = new core.actor.bospack.intimate(o, actra)
		spank = new core.actor.bospack.spank(o, actra)
		
		}		
		
		public function setBodyScale(bodyScaleValue){
		bodyScaleModified = bodyScaleValue
		isBodyModified = true
		if(o.cfg.config.logging){actra.log.addLog("gen", "BodyScale Sent, Name:"+actra.name+" ID:"+actra.id+" Goal Scale: "+bodyScaleValue+" Natural Scale: "+bodyScale+" Adjuster: "+Number(calcBodyScale(bodyScaleValue, bodyScale)))}

		skse.SendModEvent("0SAA"+actra.id+"_BodyScale", String(""), Number(calcBodyScale(bodyScaleValue, bodyScale)))
		actra.body.calculateWeight("current")
		}		
		
		public function calcBodyScale(GoalBodyScale:Number, NativeBodyScale:Number){return ((GoalBodyScale - NativeBodyScale) / NativeBodyScale) + 1.0}
		
		public function restoreBodyScale(){
			if(isBodyModified){
				isBodyModified = false
				if(o.cfg.config.logging){actra.log.addLog("gen", "BodyScale Sent, Name:"+actra.name+" ID:"+actra.id+" Restore Scale Function, Setting Actor to scale: 1.0")}
				skse.SendModEvent("0SAA"+actra.id+"_BodyScale", String(""), Number(1.0))			
			}
		}		
		
		
		function spankAss(spankUnit){
			actra.body.makeSound("spank", spankUnit.sound, spankUnit.soundpow)
			var outcomeUnit = {processor:"Tier3", tier1:spankUnit.force, tier2:0, tier3:0, cat1:"force", cat2:"pain", cat3:"approval"}
			var react = new Reaction(o, actra, "spank_toSpank", spankUnit, outcomeUnit)
		}		
		
		function OPenPusIn(spankUnit){
			var outcomeUnit = {processor:"Tier3", tier1:spankUnit.force, tier2:0, tier3:0, cat1:"force", cat2:"pussystate", cat3:"approval"}
			var react = new Reaction(o, actra, "pnpus_toOPenPusIn", spankUnit, outcomeUnit)
		}		
		
		function makeSound(formSuite, sound, zeal){
			this[formSuite].makeSound(sound, zeal)
		}		
		
		function skySend(formListIndex, formIndex, formLength){
				skse.SendModEvent("0SSO"+actra.id+"_Sound", String(formIndex), Number(formListIndex))
		}
		
		
		function calculateWeight(cmd){
			if(cmd=="orig"){			
			
			weightEarthOrig = core.util.units.weightSkyToUSA(weightSky, bodyScale, o, actra.gender)
			
			
			}else if(cmd=="current"){
				weightEarthCurrent = core.util.units.weightSkyToUSA(weightSky, bodyScaleModified, o, actra.gender)
			}
		}

}


