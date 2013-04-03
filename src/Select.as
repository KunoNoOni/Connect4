package
{
	import org.flixel.*;
	//import org.flixel.plugin.photonstorm.*;
	
	public class Select extends FlxSprite
	{
		//Variables got here
		
		public function Select(X:Number, Y:Number)
		{
			super(X*48,Y);
			loadGraphic(Registry.selectOverlay,false,false,48,288,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}