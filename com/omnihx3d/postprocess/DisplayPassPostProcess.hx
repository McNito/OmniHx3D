package com.omnihx3d.postprocess;

import com.omnihx3d.cameras.Camera;

/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.DisplayPassPostProcess') class DisplayPassPostProcess extends PostProcess {
	
	public function new(name:String, ratio:Float, camera:Camera, ?samplingMode:Int, ?engine:Engine, reusable:Bool = false/*?reusable:Bool*/) {
		super(name, "displayPass", ["passSampler"], ["passSampler"], ratio, camera, samplingMode, engine, reusable);
	}
	
}
