package com.omnihx3d.postprocess;

import com.omnihx3d.cameras.Camera;

/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.PassPostProcess') class PassPostProcess extends PostProcess {
	
	public function new(name:String, ratio:Float, camera:Camera, ?samplingMode:Int, ?engine:Engine, reusable:Bool = false) {
		super(name, "pass", null, null, ratio, camera, samplingMode, engine, reusable);
	}
	
}
