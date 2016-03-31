package com.omnihx3d.postprocess;

import com.omnihx3d.cameras.Camera;

/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.AnaglyphPostProcess') class AnaglyphPostProcess extends PostProcess {
	
	public function new(name:String, ratio:Float, camera:Camera, ?samplingMode:Int, ?engine:Engine, reusable:Bool = false) {
		super(name, "anaglyph", null, ["leftSampler"], ratio, camera, samplingMode, engine, reusable);
	}
	
}
