package com.omnihx3d.postprocess;

import com.omnihx3d.math.Vector2;
import com.omnihx3d.materials.Effect;
import com.omnihx3d.cameras.Camera;

/**
 * ...
 * @author Krtolica Vujadin
 */
class StereoscopicInterlacePostProcess extends PostProcess {
	
	private var _stepSize:Vector2;
	

	public function new(name:String, camB:Camera, postProcessA:PostProcess, isStereoscopicHoriz:Bool, ?samplingMode:Int) {
		super(name, "stereoscopicInterlace", ['stepSize'], ['camASampler'], 1, camB, samplingMode, camB.getScene().getEngine(), false, isStereoscopicHoriz ? "#define IS_STEREOSCOPIC_HORIZ 1" : null);
		
		this._stepSize = new Vector2(1 / this.width, 1 / this.height);
		
		this.onSizeChanged = function() {
			this._stepSize = new Vector2(1 / this.width, 1 / this.height);
		};
		
		this.onApply = function(effect:Effect) {
			effect.setTextureFromPostProcess("camASampler", postProcessA);
			effect.setFloat2("stepSize", this._stepSize.x, this._stepSize.y);
		};
	}
	
}
