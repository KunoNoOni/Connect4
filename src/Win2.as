package
{
	import org.flixel.*;
	//import org.flixel.plugin.photonstorm.*;
	
	public class Win2 extends FlxSprite
	{
		//Variables got here
		
		public function Win2(X:Number, Y:Number)
		{
			super(X,Y);
			loadGraphic(Registry.p2Mess,false,false,144,48,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}