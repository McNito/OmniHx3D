package com.omnihx3d.postprocess;

import com.omnihx3d.cameras.Camera;
import com.omnihx3d.math.Matrix;
import com.omnihx3d.materials.Effect;
import com.omnihx3d.materials.textures.Texture;
/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.FilterPostProcess') class FilterPostProcess extends PostProcess {
	
	public var kernelMatrix:Matrix;
	
	
	public function new(name:String, kernelMatrix:Matrix, ratio:Float, ?camera:Camera, ?samplingMode:Int, ?engine:Engine, reusable:Bool = false/*?reusable:Bool*/) {
		super(name, "filter", ["kernelMatrix"], null, ratio, camera, samplingMode, engine, reusable);

		this.kernelMatrix = kernelMatrix;
		
		this.onApply = function(effect:Effect) {
			effect.setMatrix("kernelMatrix", this.kernelMatrix);
		}
	}
	
}