package com.omnihx3d.mesh;

/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON._VisibleInstances') class _VisibleInstances {
	
	public var map:Map<Int, Array<InstancedMesh>> = new Map<Int, Array<InstancedMesh>>();
	public var defaultRenderId:Int = 0;
	public var selfDefaultRenderId:Int;
	
	@:allow(com.omnihx3d.mesh.Mesh)
	private var intermediateDefaultRenderId:Int = 0;
	

	public function new(defaultRenderId:Int, selfDefaultRenderId:Int) {		
		this.defaultRenderId = defaultRenderId;
		this.selfDefaultRenderId = selfDefaultRenderId;
	}
	
}
