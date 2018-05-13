
class core.system.beacon
{
	
var o

var _cbCellScan
var _cbActraRemoveAO
var _cbReportArr

var dataPinArr

		public function beacon(core){
		o = core		
		}
		
		
		
		function cbStringA(){
			if(this["_cb"+arguments[0]]){
			dataPinArr = arguments
			this["_cb"+arguments[0]].fn.apply(this["_cb"+arguments[0]].scope)
			this["_cb"+arguments[0]] = undefined			
			}
		}
		
		function cbCellScan(){
			o.log.addLog("stg", "CellScan data received...")
			if(_cbCellScan){
			_cbCellScan.fn.apply(_cbCellScan.scope)
			_cbCellScan = undefined
			o.log.addLog("stg", "CellScan call back found. ...")
			}
		}
		
		function cbActraRemoveAO(){
			if(_cbActraRemoveAO){
			_cbActraRemoveAO.fn.apply(_cbActraRemoveAO.scope)
			_cbActraRemoveAO = undefined
			}
		}
		
		
}