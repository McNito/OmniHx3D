package com.omnihx3d.tools.sceneoptimizer;

import com.omnihx3d.Scene;

/**
 * ...
 * @author Krtolica Vujadin
 */
@:expose('BABYLON.SceneOptimization') class SceneOptimization {
	
	public var priority:Int;
	

	public function new(priority:Int = 0) {
		this.priority = priority;
	}
	
	public function apply(scene:Scene, updateSelectionTree:Bool = false):Bool {
		return true;   // Return true if everything that can be done was applied
	}
	
}
