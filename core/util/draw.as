

class core.util.draw {

	
	public static function circle(baseObj, x, y, r, lineThick, lineColor, fillColor) {
	
	var obj = baseObj.createEmptyMovieClip("star", baseObj.getNextHighestDepth());
	
	if(fillColor){
	obj.beginFill(fillColor);
	}
	if(lineColor){
	obj.lineStyle(lineThick, lineColor, 100, true, "none", "round", "miter", 1);
	}
	obj.moveTo(x+r, y);
	obj.curveTo(r+x, Math.tan(Math.PI/8)*r+y, Math.sin(Math.PI/4)*r+x, 
	Math.sin(Math.PI/4)*r+y);
	obj.curveTo(Math.tan(Math.PI/8)*r+x, r+y, x, r+y);
	obj.curveTo(-Math.tan(Math.PI/8)*r+x, r+y, -Math.sin(Math.PI/4)*r+x, 
	Math.sin(Math.PI/4)*r+y);
	obj.curveTo(-r+x, Math.tan(Math.PI/8)*r+y, -r+x, y);
	obj.curveTo(-r+x, -Math.tan(Math.PI/8)*r+y, -Math.sin(Math.PI/4)*r+x, 
	-Math.sin(Math.PI/4)*r+y);
	obj.curveTo(-Math.tan(Math.PI/8)*r+x, -r+y, x, -r+y);
	obj.curveTo(Math.tan(Math.PI/8)*r+x, -r+y, Math.sin(Math.PI/4)*r+x, 
	-Math.sin(Math.PI/4)*r+y);
	obj.curveTo(r+x, -Math.tan(Math.PI/8)*r+y, r+x, y);
	obj.endFill();
	return obj
	}
	
	
	public static function star(baseObj, color, _radius)      
	{           
	
		var obj = baseObj.createEmptyMovieClip("star", baseObj.getNextHighestDepth());
		obj.lineStyle(1,color);
		obj.beginFill(color);
		obj.moveTo(_radius,0);
	
		var angleIncrement = Math.PI / 5;//5 pointed star -> 10 point arround the circle (360 degrees or Math.PI * 2): 5 outer points, 5 inner points
		var ninety:Number = Math.PI * .5;//offset the rotation by 90 degrees so the star points up
	
		for(var i:Number = 0; i <= 10; i++){//for each point
			var radius:Number = (i % 2 > 0 ? _radius : _radius * .5);//determine if the point is inner (half radius) or outer(full radius)
			var px:Number = Math.cos(ninety + angleIncrement * i) * radius;//compute x
			var py:Number = Math.sin(ninety + angleIncrement * i) * radius;//and y using polar to cartesian coordinate conversion
			if(i == 0) obj.moveTo(px,py);//move the 'pen' so we don't draw lines from (0,0)
			obj.lineTo(px,py);//draw each point of the star
		}
		obj.endFill();
		return obj
	}
	
	public static function fullStar(baseObj, color, _radius, points, depth)      
	{           
	
		var obj = baseObj.createEmptyMovieClip("star", baseObj.getNextHighestDepth());
		obj.lineStyle(1,color);
		obj.beginFill(color);
		obj.moveTo(_radius,0);
	
		var angleIncrement = Math.PI / points;//5 pointed star -> 10 point arround the circle (360 degrees or Math.PI * 2): 5 outer points, 5 inner points
		var ninety:Number = Math.PI * .10;//offset the rotation by 90 degrees so the star points up
	
		for(var i:Number = 0; i <= (points*2); i++){//for each point
			var radius:Number = (i % 2 > 0 ? _radius : _radius * (depth/10));//determine if the point is inner (half radius) or outer(full radius)
			var px:Number = Math.cos(ninety + angleIncrement * i) * radius;//compute x
			var py:Number = Math.sin(ninety + angleIncrement * i) * radius;//and y using polar to cartesian coordinate conversion
			if(i == 0) obj.moveTo(px,py);//move the 'pen' so we don't draw lines from (0,0)
			obj.lineTo(px,py);//draw each point of the star
		}
		obj.endFill();
		return obj
	}
	
	
		public static function bar(baseObj, color, _radius)      
	{           
	
		var obj = baseObj.createEmptyMovieClip("star", baseObj.getNextHighestDepth());
		obj.lineStyle(1,color);
		obj.beginFill(color);
		obj.lineTo(-500, 0);
		obj.lineTo(300, 0);
		obj.lineTo(300, 20);
		obj.lineTo(-500, 20);		
		obj.endFill();
		return obj
	}

	
	public static function square(obj, x, y, r, lineThick, lineColor, fillColor){
		if(fillColor){
		obj.beginFill(fillColor);
		}
		if(lineColor){
		obj.lineStyle(lineThick, lineColor, 100, true, "none", "round", "miter", 1);
		}
		
		obj.moveTo(x+r, y+r);
		obj.lineTo(x-(r), y+r);
		obj.lineTo(x-(r), y-(r));
		obj.lineTo(x+r, y-(r));
		obj.lineTo(x+r, y+r);
		obj.endFill();
		return obj
	}
	
		
		function makeBox(obj){
		obj.lineStyle(2, 0xFFFFFF, 100, true, "none", "round", "miter", 1);
		obj.beginFill(0x000000);
		obj.moveTo(0, 0);
		obj.lineTo(-40, 0);
		obj.lineTo(-40, -40);
		obj.lineTo(0, -40);
		obj.lineTo(0, 0);
		obj.endFill();
	}
	
	
	public static function frameRightText(obj, w, h, p, lineThick, lineColor){
		obj.lineStyle(lineThick, lineColor, 100, true, "none", "round", "miter", 1);
		
			
			h += p
			w += p
			
			w = w-(w/2)
			var w2 = (w/2)
			var h2 = (h/2)

			obj.moveTo(w2, h2);
			obj.lineTo(-w2, h2);
			obj.lineTo(-w2, -h+h2);
			obj.lineTo(w2, -h+h2);
			obj.lineTo(w2, h2);
			
			return obj
	}
}