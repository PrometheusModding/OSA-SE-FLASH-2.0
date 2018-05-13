

class core.lib.dataCache  {

var o
var a
var r
var id

var cacheFn



		public function dataCache(core, lib, cacheID){
		o = core
		id = cacheID
		
		a = new Object
		r = new Object

		
		a = lib.makeEntry("<"+id+"></"+id+">")
		}

		
		public function get(sceneID){
			return r[sceneID].u
		}
		
		public function storeData(xmlText){
		var DataBlock = o.lib.makeEntry(xmlText)			
		var L		

		L = a[id].push(DataBlock[id][0]) 
		trace(a[id][1])
		var Block = a[id][L-1]
		r[Block.id] = new Object;
		r[Block.id].i = L-1
		r[Block.id].u = Block 
		trace("										!LIB!"+id+" added to library: "+Block.id)
		}

		
	

}