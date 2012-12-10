package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		private var tgb:titleGameBoard;
				
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			tgb = new titleGameBoard();
			add(tgb);
			tgb.scale.x = .75;
			tgb.scale.y = .75;
			
			var logo:FlxText = new FlxText(FlxG.width*0.5-120,FlxG.height*0.5-155, 250, "Connect 4");
			logo.setFormat(null,35,0xFFFFFF, "center");
			add(logo);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-100,FlxG.height-30, 200, "PRESS [x] TO START");
			instruct.setFormat(null,15,0xFFFFFF, "center");
			add(instruct);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}