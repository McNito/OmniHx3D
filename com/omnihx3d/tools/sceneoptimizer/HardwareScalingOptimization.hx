package com.omnihx3d.tools.sceneoptimizer;

import com.omnihx3d.Scene;

/**
 * ...
 * @author Krtolica Vujadin
 */
@:expose('BABYLON.HardwareScalingOptimization') class HardwareScalingOptimization extends SceneOptimization {
	
	private var _currentScale:Int = 1;
	public var maximumScale:Int;
	

	public function new(priority:Int = 0, maximumScale:Int = 2) {
		super(priority);
		
		this.maximumScale = maximumScale;
	}
	
	override public function apply(scene:Scene, updateSelectionTree:Bool = false):Bool {
		this._currentScale++;
		
		scene.getEngine().setHardwareScalingLevel(this._currentScale);
		
		return this._currentScale >= this.maximumScale;
	}
	
}
