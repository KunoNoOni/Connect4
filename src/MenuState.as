package
{
	import org.flixel.*;
		
	public class MenuState extends FlxState
	{
		//Variables got here

		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			var rulesHeader:FlxText = new FlxText(FlxG.width*0.5-120,FlxG.height*0.5-155, 250, "Rules");
			rulesHeader.setFormat(null,35,0xFFFFFF, "center");
			add(rulesHeader);
			
			var instruct1:FlxText = new FlxText(FlxG.width*0.5-120,FlxG.height*0.5-110, 250, "Player 1 goes first. Get 4 squares Horizonally, Vertically or Diagonally in a row to win!");
			instruct1.setFormat(null,10,0xFFFFFF, "center");
			add(instruct1);
			
			var instruct2:FlxText = new FlxText(FlxG.width*0.5-120,FlxG.height*0.5-70, 250, "Click on the messages to continue play. Clicking on the win message brings you back to the titlescreen.");
			instruct2.setFormat(null,10,0xFFFFFF, "center");
			add(instruct2);
			
			var instruct3:FlxText = new FlxText(FlxG.width*0.5-120,FlxG.height*0.5-30, 250, "This is a 2 player game, there is no Computer A.I. yet. Enjoy!");
			instruct3.setFormat(null,10,0xFFFFFF, "center");
			add(instruct3);
			
			var instruct4:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height-40, 300, "Player 1, please press (1) for Green or (2) for Yellow to choose your color and begin.");
			instruct4.setFormat(null,10,0xFFFFFF, "center");
			add(instruct4);
		}
		
		override public function update():void
		{
			if(FlxG.keys.ONE)
			{
				Registry.player1 = "green";
				Registry.player2 = "yellow";
				FlxG.switchState(new PlayState());	//<--- using new state change code for flixel 2.5
			}
			if(FlxG.keys.TWO)
			{
				Registry.player1 = "yellow";
				Registry.player2 = "green";
				FlxG.switchState(new PlayState());	//<--- using new state change code for flixel 2.5
			}
			
			super.update();
		}
	}
}