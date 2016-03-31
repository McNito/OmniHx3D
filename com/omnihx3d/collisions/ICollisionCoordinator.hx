package com.omnihx3d.collisions;

import com.omnihx3d.math.Vector3;
import com.omnihx3d.mesh.AbstractMesh;
import com.omnihx3d.mesh.Geometry;

/**
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.ICollisionCoordinator') interface ICollisionCoordinator {
	
	function getNewPosition(position:Vector3, velocity:Vector3, collider:Collider, maximumRetry:Int, excludedMesh:AbstractMesh, onNewPosition:Int->Vector3->AbstractMesh->Void, collisionIndex:Int):Void;
	function init(scene:Scene):Void;
	function destroy():Void;

	//Update meshes and geometries
	function onMeshAdded(mesh:AbstractMesh):Void;
	function onMeshUpdated(mesh:AbstractMesh):Void;
	function onMeshRemoved(mesh:AbstractMesh):Void;
	function onGeometryAdded(geometry:Geometry):Void;
	function onGeometryUpdated(geometry:Geometry):Void;
	function onGeometryDeleted(geometry:Geometry):Void;
  
}
