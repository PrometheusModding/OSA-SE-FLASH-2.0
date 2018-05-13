

class core.panel.button.builder4D {

public var buttons
public var col
public var row
public var point
public var max
public var maxCol
public var maxRow


	function builder4D(){
		col = 0
		row = 0
		point = 0
		buttons = []
		max = []
	}
	
	function DU(){
	  if(col < maxCol-1){
		buttons[point].dim()
		if(!buttons[point+1]){
		col = 0
		point = (row*maxCol)
		buttons[point].light() 
	  	}else{
		col += 1
		point +=1
		buttons[point].light()
		}
	  }else{
		buttons[point].dim()
		col = 0
		point = (row*maxCol)
		buttons[point].light() 
	  }
	}
	
	function DD(){
	  if(col > 0){
		buttons[point].dim()
		col -= 1
		point -=1
		buttons[point].light()
	  }else{
		buttons[point].dim()
		col = maxCol-1
		point = ((row+1)*maxCol)-1
		while(!buttons[point]){
			col--
			point--
		}
		buttons[point].light() 
	  }
	}
	
	function DL(){
		
	  if((maxCol*row)+col+maxCol < max ){
		buttons[point].dim()
		row += 1
		point +=maxCol
		buttons[point].light()
	  }else{
		buttons[point].dim()
		row = 0
		point = col
		buttons[point].light() 
	  }
	}
	
	function DR(){
	  buttons[point].dim()	
	  if(row-1 >= 0){		
		row -= 1
		point -=maxCol
	  }else{
			if((maxRow*maxCol)+col < max){ 
			row = maxRow
			point = (maxRow*maxCol)+col
			}else{
			row = maxRow-1
			point = (row*maxCol)+col
			}
	  }
		buttons[point].light() 
	}
	
	function concludeSetup(){
		if(buttons.length < maxCol){
		maxCol = buttons.length	
		}
		maxRow = row
		col = 0
		row = 0
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