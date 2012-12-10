package
{
	import org.flixel.*;
	//import org.flixel.plugin.photonstorm.*;
	
	public class Turn2 extends FlxSprite
	{
		//Variables got here
		
		public function Turn2(X:Number, Y:Number)
		{
			super(X,Y);
			loadGraphic(Registry.p2Mess2,false,false,144,48,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}