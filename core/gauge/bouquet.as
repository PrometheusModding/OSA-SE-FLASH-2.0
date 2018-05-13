

class core.gauge.bouquet {


		public static function obar(baseObj, color, _radius)      
		{           
		
		var shell = baseObj.createEmptyMovieClip("star", baseObj.getNextHighestDepth(), {obj:undefined, ol:undefined})
		
		shell.obj =  shell.createEmptyMovieClip("star", shell.getNextHighestDepth());
		shell.obj.lineStyle(1,color);
		shell.obj.beginFill(color);
		shell.obj.lineTo(0, 0);
		shell.obj.lineTo(0, 150);
		shell.obj.lineTo(12, 150);
		shell.obj.lineTo(12, 0);	
		shell.obj.endFill();
		
		
		shell.ol = shell.createEmptyMovieClip("outline", shell.getNextHighestDepth());
		shell.ol.lineStyle(2,"0xFFFFFF");
		
		shell.ol.lineTo(0, 0);
		shell.ol.lineTo(0, 150);
		shell.ol.lineTo(12, 150);
		shell.ol.lineTo(12, 0);	
		shell.ol.lineTo(0, 0);
		
		return shell
	}

	
}