
class Display extends MovieClip{

public var o

var totalWidth
var totalHeight

var listOTextWarningA

var pump
		public function Display(){
			totalWidth = Stage.width 
			totalHeight = Stage.height
			listOTextWarningA = []
		}
		
		
		public function createPumpText(tx, txcolor, time){
			pump = this.attachMovie("Pump", "pump", 1000000, {_x:totalWidth, _y:totalHeight-500});
			//pump.t.htmlText = "SUCK IT"
		}

		public function PumpText(tx){
			pump.t.htmlText = tx
		}
		
		function hudDisplayBasicPush(boxType, displayText, displayConfig, displayExtra){
			if(!this["list"+boxType][0]){
			var textUnit = {displayText:displayText, displayConfig:displayConfig, displayExtra:displayExtra}
			this["list"+boxType].push(textUnit)
			this[boxType] = this.attachMovie(boxType, boxType, 1000100, {_x:totalWidth, _y:totalHeight-500, o:o, displayText:displayText, displayConfig:displayConfig, displayExtra:displayExtra});
			}else{
			this["list"+boxType].push(textUnit)
			}
		}
		
		function endBasicPush(boxType){
			this[boxType].removeMovieClip()
		}
}