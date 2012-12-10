package
{
	import org.flixel.*;
	//import org.flixel.plugin.photonstorm.*;
	
	public class Occupied extends FlxSprite
	{
		//Variables got here
		
		public function Occupied(X:Number, Y:Number)
		{
			super(X,Y);
			loadGraphic(Registry.oMess,false,false,144,48,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}