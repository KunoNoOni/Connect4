package
{
	import org.flixel.*;
	//import org.flixel.plugin.photonstorm.*;
	
	public class Yellow extends FlxSprite
	{
		//Variables got here
		
		public function Yellow(X:Number, Y:Number)
		{
			super(X*48+16,Y);
			loadGraphic(Registry.yellowTile,false,false,48,48,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}