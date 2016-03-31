package com.omnihx3d.lights;

import com.omnihx3d.lights.shadows.ShadowGenerator;
import com.omnihx3d.math.Matrix;
import com.omnihx3d.math.Vector3;
import com.omnihx3d.mesh.AbstractMesh;


/**
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.IShadowLight') interface IShadowLight {
  
	var position:Vector3;
	var transformedPosition:Vector3;
	var name:String;

	function computeTransformedPosition():Bool;
	function getScene():Scene;
	
	function setShadowProjectionMatrix(matrix:Matrix, viewMatrix:Matrix, renderList:Array<AbstractMesh>):Void;
	
	function supportsVSM():Bool;
	function needRefreshPerFrame():Bool;
	function needCube():Bool;
	
	function getShadowDirection(?faceIndex:Int):Vector3;

	var _shadowGenerator:ShadowGenerator;
	
}
