package com.omnihx3d.culling.octrees;

/**
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.IOctreeContainer') interface IOctreeContainer<T> {
	
	var blocks:Array<OctreeBlock<T>>;
	
}