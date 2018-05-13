import mx.utils.Delegate;

class Time{

var sourceBack
var timer

		public function Time(sBack, delay){
		sourceBack = sBack
		timer = setInterval(Delegate.create(this, timeOut), delay);
		}
	
	
		private function timeOut(func){
		clearInterval(timer);
		sourceBack.fn.apply(sourceBack.scope)
		}
		

		

		
		
		
		
}