package {
	
	import com.xtdstudios.DMT.DMTBasic;
	
	import flash.events.Event;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class GameWithDMT extends Sprite {
		private var _dmtBasic   		: DMTBasic;
		private var starlingUIContainer	: Sprite;
		
		public function GameWithDMT() {
			_dmtBasic = new DMTBasic("DMTCircleChain", false);	// change to "true" to turn ON caching
			_dmtBasic.addEventListener(Event.COMPLETE, dmtComplete);
			if (_dmtBasic.cacheExist() == true)
				_dmtBasic.process(); // will use the existing cache
			else
				doLayoutUI();	// will be done one time per device		
		}
		
		private function doLayoutUI():void {
			var uiLayout: UILayout = new UILayout(Starling.current.nativeStage.stageWidth, Starling.current.nativeStage.stageHeight);
			uiLayout.UIContainer.name = "UIContainer";	// name it so we can ask DMT for it
			_dmtBasic.addItemToRaster(uiLayout.UIContainer);
			_dmtBasic.process(); // will rasterize the given assets  
		}
		
		protected function dmtComplete(event:Event):void {
			starlingUIContainer = _dmtBasic.getAssetByUniqueAlias("UIContainer") as starling.display.Sprite;
			addChild(starlingUIContainer);

			// animate
			var gameTitle 			: DisplayObject = starlingUIContainer.getChildByName("gameTitle");
			var gridEdition 		: DisplayObject = starlingUIContainer.getChildByName("gridEdition");
			var normalMode	 		: DisplayObject = starlingUIContainer.getChildByName("normalMode");
			var timeAttackMode 		: DisplayObject = starlingUIContainer.getChildByName("timeAttackMode");
			var gameTitleTween		: Tween=new Tween(gameTitle, 0.7);
			var gridEditionTween	: Tween=new Tween(gridEdition, 0.7);
			var normalModeTween		: Tween=new Tween(normalMode, 0.7);
			var timeAttackModeTween	: Tween=new Tween(timeAttackMode, 0.7);
			var gameTitleY 			: Number;
			var gridEditionX 		: Number;
			
			// save final postion
			gameTitleY = gameTitle.y;
			gridEditionX = gridEdition.x;
			
			// starting position/alpha
			gameTitle.y = -100;
			gridEdition.x = starlingUIContainer.width;
			normalMode.alpha = 0;
			timeAttackMode.alpha = 0;
			
			gameTitleTween.moveTo(gameTitle.x, gameTitleY);
			gridEditionTween.moveTo(gridEditionX, gridEdition.y);
			gridEditionTween.delay = 0.7;
			normalModeTween.fadeTo(1);
			normalModeTween.delay = 0.7+0.7;
			timeAttackModeTween.fadeTo(1);
			timeAttackModeTween.delay = 0.7+0.7+0.2;
			Starling.juggler.add(gameTitleTween);
			Starling.juggler.add(gridEditionTween);
			Starling.juggler.add(normalModeTween);
			Starling.juggler.add(timeAttackModeTween);
		}
	}
}