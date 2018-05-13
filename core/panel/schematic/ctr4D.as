

class core.panel.schematic.ctr4D {

public var buttons
public var col
public var row
public var point
public var max
public var maxCol
public var maxRow
public var maxColOrig

var parentFrame

	function ctr4D(){
		col = 0
		row = 0
		point = 0
		buttons = []
		max = []
	}
	
	function build(f, max, arr){
		parentFrame = f
		maxCol = max
		maxColOrig = max
		buttons = arr
		concludeSetup()
	}
	
	function DU(){
	  if(col < maxCol-1){
		buttons[point].dim()
		if(!buttons[point+1]){
		parentFrame.wrapU()
	  	}else{
		col += 1
		point +=1
		buttons[point].light("U")
		//Sound
		parentFrame.f.inputSnd("moves")
		}
	  }else{
		parentFrame.wrapU()
	  }
	}
	
	function wrapU(){
		buttons[point].dim()
		col = 0
		point = (row*maxCol)
		buttons[point].light() 
			//Sound
		parentFrame.f.inputSnd("moves")
		
	}
	
	
	function DD(){
	  if(col > 0){
		buttons[point].dim()
		col -= 1
		point -=1
		buttons[point].light("D")
	  	//Sound
		parentFrame.f.inputSnd("moves")
	  }else{
		parentFrame.wrapD()
	  }
	}
	
	
	function wrapD(){
		buttons[point].dim()
		col = maxCol-1
		point = ((row+1)*maxCol)-1
		while(!buttons[point]){
			col--
			point--
		}
		buttons[point].light() 
			//Sound
		parentFrame.f.inputSnd("moves")
	}
	
	
	function DR(){
		
	  if((maxCol*row)+col+maxCol < max ){
		buttons[point].dim()
		row += 1
		point +=maxCol
		buttons[point].light()
		//Sound
		parentFrame.f.inputSnd("moves")
	  }else{
		parentFrame.edgeR()
	  }
	}
	
	function wrapR(){
		buttons[point].dim()
		row = 0
		point = col
		buttons[point].light() 
			//Sound
		parentFrame.f.inputSnd("moves")
	}
	
	function DL(){
	  buttons[point].dim()	
	  if(row-1 >= 0){		
		row -= 1
		point -=maxCol
		buttons[point].light() 
		//Sound
		parentFrame.f.inputSnd("moves")
	  }else{
			parentFrame.edgeL()
	  }
		
	}
	
	
	function edgeWrap(edgeFrom){
		if(maxRow > 0){
			if(edgeFrom=="L"){
				buttons[point].dim()						 
				row = maxRow
				point = maxRow*maxCol+col
				//point = (((maxRow+1)*maxCol)- maxCol)+point
				if(!buttons[point]){
					if(row > 0){
					row--
					point -= maxCol
					}else{
						
					col = (max-1) -(row*maxCol)
					point = max-1
					}
				}
				buttons[point].light()
				
			}else if(edgeFrom=="R"){
				buttons[point].dim()			
				point -= (row*maxCol)
				row = 0
				buttons[point].light()
			}
		}else{buttons[point].light()}
	}
	
	
	function wrapL(){
		
		if((maxRow*maxCol)+col < max){ 
			row = maxRow
			point = (maxRow*maxCol)+col
			}else{
			row = maxRow-1
			point = (row*maxCol)+col
		}
		buttons[point].light()
			//Sound
		parentFrame.f.inputSnd("moves")
	}
	
		
	
	function arriveU(){
		col = 0
		point = row*maxCol
		
	}
	
	function arriveD(){
		
		if(buttons[(row*maxCol)+maxCol-1]){
		col = maxCol-1
		point = (row*maxCol)+maxCol-1
		}else{
		col = (max-1) -(row*maxCol)
		point = max-1
			}
	}
	
	
	function concludeSetup(){
		if(buttons.length < maxCol){
		maxCol = buttons.length	
		}
		maxRow = Math.floor(buttons.length / maxColOrig)
		max = buttons.length
		buttons[point].light()
	}
	
	
	
	function jumpPoint(newPoint){
		if(buttons[newPoint]){
			buttons[point].dim()
			
			
			if(newPoint>maxCol){
				row = Math.floor(newPoint/maxCol)
				col = newPoint-(row*maxCol)
			}else{
				row = 0
				col = newPoint
			}
			point = newPoint
			buttons[point].light()
		}
		
	}
	
	
}