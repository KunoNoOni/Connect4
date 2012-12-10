package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		private var gb:GameBoard;	
		private var mousePosX:Number;
		private var mousePosY:Number;
		private var square:Select;
		private var playfield:Array = [[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]];
		private var whoOwns:Number;
		private var player1Turn:Boolean = true; 
		private var player2Turn:Boolean = false;
		private var yt:Yellow;
		private var gt:Green;
		private var messageDisplaying:Boolean = true;
		private var occupiedSquare:Boolean = false;
		private var player1Winner:Boolean = false;
		private var player2Winner:Boolean = false;
		private var play1Turn:Boolean = true; 
		private var play2Turn:Boolean = false;
		private var occupiedSquareMessage:Occupied;
		private var player1WinnerMessage:Win1;
		private var player2WinnerMessage:Win2;
		private var player1TurnMessage:Turn1;
		private var player2TurnMessage:Turn2;
				
		override public function create():void
		{	
			gb = new GameBoard;
			add(gb);
			square = new Select(0,0);
			add(square);
			occupiedSquareMessage = new Occupied(113,97);
			add(occupiedSquareMessage);
			occupiedSquareMessage.visible = false;
			player1WinnerMessage = new Win1(113,97);
			add(player1WinnerMessage);
			player1WinnerMessage.visible = false;
			player2WinnerMessage = new Win2(113,97);
			add(player2WinnerMessage);
			player2WinnerMessage.visible = false;
			player1TurnMessage = new Turn1(113,97);
			add(player1TurnMessage);
			player1TurnMessage.visible = true;
			player2TurnMessage = new Turn2(113,97);
			add(player2TurnMessage);
			player2TurnMessage.visible = false;
		}	
		
		override public function update():void
		{
			mousePosX = FlxU.floor(FlxG.mouse.screenX/48);
			mousePosY = FlxU.floor(FlxG.mouse.screenY/48);
			
			if(square.x > 305)
				square.x = 305;
			else
				square.x = mousePosX*48+16;
			if(square.y > 241)
				square.y = 241;
			else
				square.y = mousePosY*48;
			
			whoOwns = playfield[mousePosX][mousePosY];
			
			if(FlxG.mouse.justReleased() && !messageDisplaying)
			{
				switch(whoOwns)
				{
					case 1:
					{
						messageDisplaying = true;
						occupiedSquare = true;
						displayMessages();
						break;
					}
					case 2:
					{
						messageDisplaying = true;
						occupiedSquare = true;
						displayMessages();
						break;
					}
					default:
					{
						if(player1Turn)
						{
							if(Registry.player1 == "green")
							{
								placeGreen();
							}
							else
							{
								placeYellow();
							}
							break;
						}
						if(player2Turn)
						{
							if(Registry.player2 == "green")
							{
								placeGreen();
							}
							else
							{
								placeYellow();
							}
						}
						break;
					}
				}
			}
			else if(FlxG.mouse.justReleased() && messageDisplaying)
			{
				messageDisplaying = false;
				if(occupiedSquare)
				{
					occupiedSquare = false;
					occupiedSquareMessage.kill();
				}
				if(player1Winner)
				{
					FlxG.switchState(new TitleState());
				}
				if(player2Winner)
				{
					FlxG.switchState(new TitleState());
				}
				if(play1Turn)
				{
					play1Turn = false;
					player1TurnMessage.kill();
				}
				if(play2Turn)
				{
					play2Turn = false;
					player2TurnMessage.kill();
				}
			}

			if(player1Winner)
			{
				messageDisplaying = true;
				displayMessages();
			}
			if(player2Winner)
			{
				messageDisplaying = true;
				displayMessages();
			}
			
			super.update();
		}

		private function placeGreen():void
		{
			if(player1Turn)
			{
				playfield[mousePosX][mousePosY] = 1
				if(Registry.player1 == "green")
				{
					gt = new Green(mousePosX,mousePosY);
					add(gt);
					reAddSquare();
					checkForWinner(1);
					if(!player1Winner)
					{
						messageDisplaying = true;
						play2Turn= true;
						displayMessages();
						player1Turn = false;
						player2Turn = true;
					}
				}
				else if(Registry.player1 == "yellow")
				{
					yt = new Yellow(mousePosX,mousePosY);
					add(yt);
					reAddSquare();
					checkForWinner(1);
					if(!player1Winner)
					{
						messageDisplaying = true;
						play2Turn= true;
						displayMessages();
						player1Turn = false;
						player2Turn = true;
					}
				}
			}
			else if(player2Turn)
			{
				playfield[mousePosX][mousePosY] = 2
				if(Registry.player2 == "green")
				{
					gt = new Green(mousePosX,mousePosY);
					add(gt);
					reAddSquare();
					checkForWinner(2);
					if(!player2Winner)
					{
						messageDisplaying = true;
						play1Turn= true;
						displayMessages();
						player1Turn = true;
						player2Turn = false;
					}
				}
				else if(Registry.player2 == "green")
				{
					yt = new Yellow(mousePosX,mousePosY);
					add(yt);
					reAddSquare();
					checkForWinner(2);
					if(!player2Winner)
					{
						messageDisplaying = true;
						play1Turn= true;
						displayMessages();
						player1Turn = true;
						player2Turn = false;
					}
				}
			}
		}
		
		private function placeYellow():void
		{
			if(player1Turn)
			{
				playfield[mousePosX][mousePosY] = 1
				if(Registry.player1 == "yellow")
				{
					yt = new Yellow(mousePosX,mousePosY);
					add(yt);
					reAddSquare();
					checkForWinner(1);
					if(!player1Winner)
					{
						messageDisplaying = true;
						play2Turn= true;
						displayMessages();
						player1Turn = false;
						player2Turn = true;
					}
				}
				else if(Registry.player1 == "green")
				{
					gt = new Green(mousePosX,mousePosY);
					add(gt);
					reAddSquare();
					checkForWinner(1);
					if(!player1Winner)
					{
						messageDisplaying = true;
						play2Turn= true;
						displayMessages();
						player1Turn = false;
						player2Turn = true;
					}
				}
			}
			else if(player2Turn)
			{
				playfield[mousePosX][mousePosY] = 2
				if(Registry.player2 == "yellow")
				{
					yt = new Yellow(mousePosX,mousePosY);
					add(yt);
					reAddSquare();
					checkForWinner(2);
					if(!player2Winner)
					{
						messageDisplaying = true;
						play1Turn= true;
						displayMessages();
						player1Turn = true;
						player2Turn = false;
					}
				}
				else if(Registry.player1 == "green")
				{
					gt = new Green(mousePosX,mousePosY);
					add(gt);
					reAddSquare();
					checkForWinner(2);
					if(!player2Winner)
					{
						messageDisplaying = true;
						play1Turn= true;
						displayMessages();
						player1Turn = true;
						player2Turn = false;
					}
				}
			}
		}
		
		private function reAddSquare():void
		{
			square.kill();
			square = new Select(0,0);
			add(square);
		}
		
		private function displayMessages():void
		{
			if(occupiedSquare)
			{
				occupiedSquareMessage.kill();
				occupiedSquareMessage = new Occupied(113,97);
				add(occupiedSquareMessage);
				occupiedSquareMessage.visible = true;
			}
			if(player1Winner)
			{
				player1WinnerMessage.kill();
				player1WinnerMessage = new Win1(113,97);
				add(player1WinnerMessage);
				player1WinnerMessage.visible = true;
			}
			if(player2Winner)
			{
				player2WinnerMessage.kill();
				player2WinnerMessage = new Win2(113,97);
				add(player2WinnerMessage);
				player2WinnerMessage.visible = true;
			}
			if(play1Turn)
			{
				player1TurnMessage.kill();
				player1TurnMessage = new Turn1(113,97);
				add(player1TurnMessage);
				player1TurnMessage.visible = true;
			}
			if(play2Turn)
			{
				player2TurnMessage.kill();
				player2TurnMessage = new Turn2(113,97);
				add(player2TurnMessage);
				player2TurnMessage.visible = true;
			}
		}
		
		private function checkForWinner(p:Number):void
		{
			var tempCount:Number = 0;
			var x:Number = 0;
			var y:Number = 0;
			var total:Number = 0;
			var player:Number = p;
			var done:Boolean = false;

			do
			{
				if(playfield[x][y] == player)
				{
					tempCount += 1;
				}
				else
				{
					tempCount = 0;
				}

				if(x<=6)
				{
					x+=1;
					total+=1;
				}

				if(x == 7 && y <7)
				{
					x=0
					y+=1;
				}
				if(total == 42 || tempCount == 4)
				{
					done = true;
				}
				
			} while(!done)
			
			if(tempCount == 4)
			{
				if(player == 1)
				{
					player1Winner = true;
				}
				if(player == 2)
				{
					player2Winner = true;
				}
			}
			
			tempCount = 0; //if no winner is found horizontal then we reset tempCount and check the vertical
			done = false; //and we set done to false
			x=0;//also need to set x to 0
			y=0;//and y to 0
			total = 0;// and reset total to 0 too
			
			//next we check vertical
			do
			{
				if(playfield[x][y] == player)
				{
					tempCount += 1;
				}
				else
				{
					tempCount = 0;
				}

				if(y<=6)
				{
					y+=1;
					total+=1;
				}
				if(y == 7 && x <7)
				{
					y=0
					x+=1;
				}
				if(total == 42 || tempCount == 4)
				{
					done = true;
				}
				
			} while(!done)
				
			if(tempCount == 4)
			{
				if(player == 1)
				{
					player1Winner = true;
				}
				if(player == 2)
				{
					player2Winner = true;
				}
			}
			
			tempCount = 0; //if no winner is found horizontal or vertical then we reset tempCount and check the dreaded diagonal
			done = false; //and we set done to false
			x=0;//also need to set x to 0
			y=0;//and y to 0
			total = 0;// and reset total to 0 too
			
			//we will start with topleft to bottom right
			if(playfield[0][2]==player && playfield[1][3]==player && playfield[2][4]==player && playfield[3][5]==player)
			{
				tempCount = 4;
			}
			else if(playfield[0][1]==player && playfield[1][2]==player && playfield[2][3]==player && playfield[3][4]==player)
			{
				tempCount = 4;
			}
			else if(playfield[1][2]==player && playfield[2][3]==player && playfield[3][4]==player && playfield[4][5]==player)
			{
				tempCount = 4;
			}
			else if(playfield[0][0]==player && playfield[1][1]==player && playfield[2][2]==player && playfield[3][3]==player)
			{
				tempCount = 4;
			}
			else if(playfield[1][1]==player && playfield[2][2]==player && playfield[3][3]==player && playfield[4][4]==player)
			{
				tempCount = 4;
			}
			else if(playfield[2][2]==player && playfield[3][3]==player && playfield[4][4]==player && playfield[5][5]==player)
			{
				tempCount = 4;
			}
			else if(playfield[1][0]==player && playfield[2][1]==player && playfield[3][2]==player && playfield[4][3]==player)
			{
				tempCount = 4;
			}
			else if(playfield[2][1]==player && playfield[3][2]==player && playfield[4][3]==player && playfield[5][4]==player)
			{
				tempCount = 4;
			}
			else if(playfield[3][2]==player && playfield[4][3]==player && playfield[5][4]==player && playfield[6][5]==player)
			{
				tempCount = 4;
			}
			else if(playfield[2][0]==player && playfield[3][1]==player && playfield[4][2]==player && playfield[5][3]==player)
			{
				tempCount = 4;
			}
			else if(playfield[3][1]==player && playfield[4][2]==player && playfield[5][3]==player && playfield[6][4]==player)
			{
				tempCount = 4;
			}
			else if(playfield[3][0]==player && playfield[4][1]==player && playfield[5][2]==player && playfield[6][3]==player)
			{
				tempCount = 4;
			}
			
			if(tempCount == 4)
			{
				if(player == 1)
				{
					player1Winner = true;
				}
				if(player == 2)
				{
					player2Winner = true;
				}
			}
			tempCount = 0; //if no winner is found horizontal or vertical then we reset tempCount and check the dreaded diagonal
			done = false; //and we set done to false
			x=0;//also need to set x to 0
			y=0;//and y to 0
			total = 0;// and reset total to 0 too
			
			//now we will check bottem left to top right
			if(playfield[0][3]==player && playfield[1][2]==player && playfield[2][1]==player && playfield[3][0]==player)
			{
				tempCount = 4;
			}
			else if(playfield[0][4]==player && playfield[1][3]==player && playfield[2][2]==player && playfield[3][1]==player)
			{
				tempCount = 4;
			}
			else if(playfield[1][3]==player && playfield[2][2]==player && playfield[3][1]==player && playfield[4][0]==player)
			{
				tempCount = 4;
			}
			else if(playfield[0][5]==player && playfield[1][4]==player && playfield[2][3]==player && playfield[3][2]==player)
			{
				tempCount = 4;
			}
			else if(playfield[1][4]==player && playfield[2][3]==player && playfield[3][2]==player && playfield[4][1]==player)
			{
				tempCount = 4;
			}
			else if(playfield[2][3]==player && playfield[3][2]==player && playfield[4][1]==player && playfield[5][0]==player)
			{
				tempCount = 4;
			}
			else if(playfield[1][5]==player && playfield[2][4]==player && playfield[3][3]==player && playfield[4][2]==player)
			{
				tempCount = 4;
			}
			else if(playfield[2][4]==player && playfield[3][3]==player && playfield[4][2]==player && playfield[5][1]==player)
			{
				tempCount = 4;
			}
			else if(playfield[3][3]==player && playfield[4][2]==player && playfield[5][1]==player && playfield[6][0]==player)
			{
				tempCount = 4;
			}
			else if(playfield[2][5]==player && playfield[3][4]==player && playfield[4][3]==player && playfield[5][2]==player)
			{
				tempCount = 4;
			}
			else if(playfield[3][4]==player && playfield[4][3]==player && playfield[5][2]==player && playfield[6][1]==player)
			{
				tempCount = 4;
			}
			else if(playfield[3][5]==player && playfield[4][4]==player && playfield[5][3]==player && playfield[6][2]==player)
			{
				tempCount = 4;
			}
			
			if(tempCount == 4)
			{
				if(player == 1)
				{
					player1Winner = true;
				}
				if(player == 2)
				{
					player2Winner = true;
				}
			}
		}
	}	
}
