
class OADraw
{

		
		
		public static function OLine(object, a, b, c ,d, color, thickness) 
		{
    			var liner = object.createEmptyMovieClip("OLine", object.getNextHighestDepth()); 

				liner.lineStyle(thickness, color, 100, true, "none", "round", "miter", .5);
				liner.moveTo(a, b);
				liner.lineTo(c, d);
				
				return liner
		}
		
		public static function rectangleRoundedOutlineHack(object, cornerRadius, boxWidth, boxHeight, fillColor, fillAlpha) 
		{
				var rec = object.createEmptyMovieClip(rec, object.getNextHighestDepth());
				rec.lineStyle(1, 0xFFFFFF, 100, true, "none", "round", "miter", .5);
				rec.beginFill(fillColor, fillAlpha);
				rec.moveTo(cornerRadius, 0);
				rec.lineTo(boxWidth - cornerRadius, 0);
				rec.curveTo(boxWidth, 0, boxWidth, cornerRadius);
				rec.lineTo(boxWidth, cornerRadius);
				rec.lineTo(boxWidth, boxHeight - cornerRadius);
				rec.curveTo(boxWidth, boxHeight, boxWidth - cornerRadius, boxHeight);
				rec.lineTo(boxWidth - cornerRadius, boxHeight);
				rec.lineTo(cornerRadius, boxHeight);
				rec.curveTo(0, boxHeight, 0, boxHeight - cornerRadius);
				rec.lineTo(0, boxHeight - cornerRadius);
				rec.lineTo(0, cornerRadius);
				rec.curveTo(0, 0, cornerRadius, 0);
				rec.lineTo(cornerRadius, 0);
				rec.endFill();
				
				return rec
		}
		
     
}