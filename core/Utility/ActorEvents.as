
class ActorEvents
{

		
		
		public static function KissEnter(o, actra, eventUnit){
				var outcomeUnit = {processor:"Tier1", tier1:0, cat1:"approval"}
    			var react = new Reaction(o, actra, "kiss_toKissEnter", eventUnit, outcomeUnit)
		}
		
		public static function KissExit(o, actra, eventUnit){
				var outcomeUnit = {processor:"Tier1", tier1:0, cat1:"approval"}
    			var react = new Reaction(o, actra, "kiss_toKissExit", eventUnit, outcomeUnit)
		}
		
		public static function Spank(o, actra, eventUnit){
				actra.body.spankAss(eventUnit)
		}
		
		public static function OPenPusIn(o, actra, eventUnit){
				actra.body.OPenPusIn(eventUnit)
		}
		
     
}