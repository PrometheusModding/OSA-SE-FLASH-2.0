import ODelegate;

class OTime{

var sourceBack
var timer

		public function OTime(sBack, delay, arr){
		sourceBack = sBack
		timer = setInterval(ODelegate.create(this, timeOut, arr), delay);
		}
	
	
		private function timeOut(arr){
		clearInterval(timer);
		sourceBack.fn.apply(sourceBack.scope, arr)
		}
		

		

		
		
		
		
}