package
{
	import org.flixel.*;
	//import org.flixel.plugin.photonstorm.*;
	
	public class titleGameBoard extends FlxSprite
	{
		//Variables got here
		
		public function titleGameBoard()
		{
			super(0,0);
			loadGraphic(Registry.tgBoard,false,false,352,306,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}