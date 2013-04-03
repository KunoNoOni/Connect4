package
{
	import org.flixel.*;
	//import org.flixel.plugin.photonstorm.*;
	
	public class GameBoardMask extends FlxSprite
	{
		//Variables got here
		
		public function GameBoardMask()
		{
			super(16,0);
			loadGraphic(Registry.gBoardMask,false,false,336,288,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}