

class core.lib.dataCacheMotif  {

var o


var motif = new Object
var iso = new Object
var react = new Object
var mien = new Object
var emo = new Object
var buff = new Object
var cast = new Object

var id

var a = new Object



		public function dataCacheMotif(core, lib, cacheID){
		o = core
		id = cacheID
		}

		
		public function storeData(xmlText, motifSuite){
		var motifData = o.lib.makeEntry(xmlText)			
		var L		
		L = this[motifSuite[1]][motifSuite[2]].classdata.push(motifData.classdata[0]) 
		var Block = this[motifSuite[1]][motifSuite[2]].r
		
		Block[motifSuite[3]] = new Object;
		//Block[motifSuite[3]].i = L-1
		Block[motifSuite[3]].u = this[motifSuite[1]][motifSuite[2]].classdata[L-1]
		
		trace("										!motifLIB!"+id+" added to "+motifSuite[1]+motifSuite[2]+motifSuite[3]+" library: "+this[motifSuite[1]][motifSuite[2]].classdata[L-1].id)
		}
	

}