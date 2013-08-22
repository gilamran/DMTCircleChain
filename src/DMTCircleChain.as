package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	public class DMTCircleChain extends Sprite
	{
		private var _starling:Starling;
		public function DMTCircleChain()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var screenWidth:int=stage.fullScreenWidth;
			var screenHeight:int=stage.fullScreenHeight;
			var viewPort:Rectangle=new Rectangle(0,0,screenWidth,screenHeight);
			_starling=new Starling(GameWithDMT,stage,viewPort);
			_starling.showStats=true;
			_starling.start();
		}
	}
}