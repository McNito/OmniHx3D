package com.omnihx3d.mesh;

/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON._InstancesBatch') class _InstancesBatch {
	
	public var mustReturn:Bool = false;
	public var visibleInstances:Array<Array<InstancedMesh>> = [];
	public var renderSelf:Array<Bool> = [];
	
	
	public function new() {	}
	
}
