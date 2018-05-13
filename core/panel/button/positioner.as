

class core.panel.button.positioner {

public var v 
public var h		
public var vOff	
public var hOff	
public var btWidth
public var vStart	
	
	function positioner(){
		v = 0
		h = 0
	}
	
	function offsetV(){
		v += vOff
	}
	
	function resetVH(){
		v = 0
		h = 0
	}
	
}