package
{
	import org.flixel.*;

	public class Registry
	{
		public static var player1:String = ""; //color
		public static var player2:String = ""; //color

		[Embed(source = 'Sprites/gameboard.png')] static public var gBoard:Class;
		[Embed(source = 'Sprites/mask.png')] static public var gBoardMask:Class;
		[Embed(source = 'Sprites/titleGameBoard.png')] static public var tgBoard:Class;
		[Embed(source = 'Sprites/green.png')] static public var greenTile:Class;
		[Embed(source = 'Sprites/yellow.png')] static public var yellowTile:Class;
		[Embed(source = 'Sprites/select.png')] static public var selectOverlay:Class;
		[Embed(source = 'Sprites/occupiedMessage.png')] static public var oMess:Class;
		[Embed(source = 'Sprites/player1wins.png')] static public var p1Mess:Class;
		[Embed(source = 'Sprites/player2wins.png')] static public var p2Mess:Class;
		[Embed(source = 'Sprites/player1turn.png')] static public var p1Mess2:Class;
		[Embed(source = 'Sprites/player2turn.png')] static public var p2Mess2:Class;
		
		
		[Embed(source = 'Sounds/Player1.mp3')] static public var placePiecePlayer1:Class;
		[Embed(source = 'Sounds/Player2.mp3')] static public var placePiecePlayer2:Class;
		[Embed(source = 'Sounds/tada2.mp3')] static public var winnerSound:Class;
		
		public function Registry()
		{ 
		}
	}
}