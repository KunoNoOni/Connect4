package
{
	import org.flixel.*;
	
	[SWF(width="352", height="306", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class Connect4 extends FlxGame
	{
		public function Connect4()
		{
			super(352,306,TitleState,1);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}