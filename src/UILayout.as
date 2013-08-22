package
{
	import flash.display.Sprite;
	
	public class UILayout
	{
		public var UIContainer:Sprite;

		private var deviceWidth:Number;
		private var deviceHeight:Number;

		private var gameTitle:Sprite;
		private var mainBG:Sprite;
		private var gridEdition:Sprite;

		public function UILayout(deviceWidth:Number, deviceHeight:Number)
		{
			this.deviceWidth = deviceWidth;	
			this.deviceHeight = deviceHeight;
			
			// This class will build and layout the Vector assets according to the give device width and height
			// The result of the layout will be at the UIContainer Sprite (Flash Sprite with Vectors children, no artifacts)
			UIContainer=new Sprite();
			
			createBackground();
			createGameTitle();
			createGridEdition();
			createButtons();
		}
		
		private function createBackground():void {
			mainBG=new MainBG();
			mainBG.name = "MainBG";
			mainBG.width = deviceWidth;
			mainBG.height = deviceHeight;
			UIContainer.addChild(mainBG);
		}
		
		private function createGameTitle():void {
			gameTitle=new GameTitle();
			gameTitle.name = "gameTitle";
			gameTitle.width = deviceWidth*0.65;	// will take 65% of the screen width
			gameTitle.scaleY = gameTitle.scaleX; // keep the same aspect ratio
			gameTitle.x=(deviceWidth-gameTitle.width)/2; // center it
			gameTitle.y=deviceHeight*0.2;	// 20% of the screen height
			UIContainer.addChild(gameTitle);
		}
		
		private function createGridEdition():void {
			gridEdition=new GridEdition();
			gridEdition.name = "gridEdition";
			gridEdition.height = gameTitle.height*0.25; // make it 25% of the game title
			gridEdition.scaleX = gridEdition.scaleY; // keep the same aspect ratio
			gridEdition.y=gameTitle.y+gameTitle.height*1.1;
			gridEdition.x=gameTitle.x+gameTitle.width-gridEdition.width; // align to the right of the gameTitle
			UIContainer.addChild(gridEdition);
		}
		
		private function createButtons():void {
			var normalMode:Sprite=new NormalMode();
			normalMode.name = "normalMode";
			normalMode.height = gameTitle.height*0.25; // 25% of the game title height
			normalMode.scaleX = normalMode.scaleY; // keep the same aspect ratio

			UIContainer.addChild(normalMode);
			normalMode.x=(deviceWidth-normalMode.width)/2;
			normalMode.y=deviceHeight*0.5;	// 50% of the screen height

			var timeAttackMode:Sprite=new TimeAttackMode();
			timeAttackMode.name = "timeAttackMode";
			timeAttackMode.height = gameTitle.height*0.25; // 25% of the game title height
			timeAttackMode.scaleX = timeAttackMode.scaleY; // keep the same aspect ratio

			UIContainer.addChild(timeAttackMode);
			timeAttackMode.x=(deviceWidth-timeAttackMode.width)/2;
			timeAttackMode.y=deviceHeight*0.65;	// 65% of the screen height
		}

		
	}
}