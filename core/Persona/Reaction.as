
class Reaction
{
	
var o
var actra
var reactType
var eventUnit
var outcomeUnit
var reactionUnit

		public function Reaction(core, act, type, eventt, outcome){
		o = core		
		actra = act
		reactType = type
		eventUnit = eventt
		outcomeUnit = outcome
		
			if(!actra.formBound){
				if(!actra.dat.personaData){
				var scout = new Scout(o)
				var sourceBack = {fn:personaIsLoaded, scope:this}
				scout.retrieveActraData("persona", actra, sourceBack)
				}else{actra.formBind()
				personaIsLoaded()
				}
			}else{personaIsLoaded()}
		
		}				

		public function personaIsLoaded(){						
			var longEx = {fn:reactIsLoaded, scope:this}
			o.lib.getMotifData(longEx, eventUnit.drive, "react", actra.persona[eventUnit.drive].reaction[eventUnit.type], reactType)
		}
		
		
		function reactIsLoaded(){
			reactionUnit = o.lib.getMotif(eventUnit.drive, "react", actra.persona[eventUnit.drive].reaction[eventUnit.type], reactType)
			this[outcomeUnit.processor]()
		}
		
		function Tier1(){
			expression_Tier1()
			voice_Tier1()	
		}
		
		function Tier3(){
			expression_Tier3()
			voice_Tier3()	
		}
		
		function Approve(){
			//expressionApprove()
			//voiceApprove()	
		}
		
		function expression_Tier1(){
			var emoEx = reactionUnit[outcomeUnit.cat1][outcomeUnit.tier1].ex
			if(emoEx){				
				emoEx = core.util.func.TIERper(emoEx)
				var emoExpression = new Emo(o, actra)
				emoExpression.emoStandard("expression", emoEx, eventUnit.eyes[0], true)				
			}

		}
		
		function voice_Tier1(){
			var emoVo = reactionUnit[outcomeUnit.cat1][outcomeUnit.tier1].vo
			if(emoVo){
				emoVo = core.util.func.TIERper(emoVo)
				var emoVoice = new Emo(o, actra)
				emoVoice.emoStandard("voice", emoVo, false, true)
			}
		}
		
		function expression_Tier3(){
			var emoEx = reactionUnit[outcomeUnit.cat1][outcomeUnit.tier1][outcomeUnit.cat2][outcomeUnit.tier2][outcomeUnit.cat3][outcomeUnit.tier3].ex
			if(emoEx){				
				emoEx = core.util.func.TIERper(emoEx)
				var emoExpression = new Emo(o, actra)
				emoExpression.emoStandard("expression", emoEx, eventUnit.eyes[0], true)				
			}

		}
		
		function voice_Tier3(){
			var emoVo = reactionUnit[outcomeUnit.cat1][outcomeUnit.tier1][outcomeUnit.cat2][outcomeUnit.tier2][outcomeUnit.cat3][outcomeUnit.tier3].vo
			if(emoVo){
				emoVo = core.util.func.TIERper(emoVo)
				var emoVoice = new Emo(o, actra)
				emoVoice.emoStandard("voice", emoVo, false, true)
			}
		}
		
		
		
		
		
}