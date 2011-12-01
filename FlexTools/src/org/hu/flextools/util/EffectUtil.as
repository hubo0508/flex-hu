package org.hu.flextools.util
{
	import mx.core.UIComponent;
	import mx.effects.Fade;
	import mx.effects.Parallel;
	import mx.effects.Zoom;
	import mx.events.EffectEvent;

	public class EffectUtil
	{
		public function EffectUtil()
		{
		}
		public static function popUpEffect(target:UIComponent,func:Function = null):void{
			var p:Parallel = new Parallel;
			var z:Zoom = new Zoom();
			var f:Fade = new Fade();
			
			z.zoomHeightFrom = 0.01;
			z.zoomHeightTo = 1;
			z.zoomWidthFrom = 0.01;
			z.zoomWidthTo = 1;
			z.duration = 500;
			
			z.target = target;
			f.duration = 500;
			f.alphaFrom= 0;
			f.alphaTo = 1;
			f.target = target;
			p.addChild(z);
			p.addChild(f);
			p.play();
			if(func != null)
			{
				p.addEventListener(EffectEvent.EFFECT_END,func);
			}			
		}
		
		public static function removePopUpEffect(target:UIComponent,func:Function):void{
			var p:Parallel = new Parallel;
			var z:Zoom = new Zoom();
			var f:Fade = new Fade();
			
			z.zoomHeightFrom = 1;
			z.zoomHeightTo = 0.01;
			z.zoomWidthFrom = 1;
			z.zoomWidthTo = 0.01;
			z.duration = 500;
			
			z.target = target;
			f.duration = 500;
			f.alphaFrom= 1;
			f.alphaTo = 0;
			f.target = target;
			p.addChild(z);
			p.addChild(f);
			p.play();
			p.addEventListener(EffectEvent.EFFECT_END,func);
		}
	}
}