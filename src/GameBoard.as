package
{
	import org.flixel.*;
	//import org.flixel.plugin.photonstorm.*;
	
	public class GameBoard extends FlxSprite
	{
		//Variables got here
		
		public function GameBoard()
		{
			super(0,0);
			loadGraphic(Registry.gBoard,false,false,352,306,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}