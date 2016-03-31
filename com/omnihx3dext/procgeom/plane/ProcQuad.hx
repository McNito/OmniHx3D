package com.omnihx3dext.procgeom.plane;

import com.omnihx3d.mesh.Mesh;
import com.omnihx3d.math.Vector3;
import com.omnihx3d.math.Vector2;
import com.omnihx3d.math.Quaternion;
import com.omnihx3d.tools.Tools;
import com.omnihx3d.Scene;

import com.omnihx3dext.procgeom.common.ProcBase;
import com.omnihx3dext.procgeom.common.MeshBuilder;

/**
 * ...
 * @author Krtolica Vujadin
 */

// based on http://jayelinda.com/modelling-by-numbers-part-two-b/

/// <summary>
/// A simple procedural quad mesh, generated using the MeshBuilder class.
/// </summary>
class ProcQuad extends ProcBase {
	
	//The width and length of the quad:
	public var m_Width:Float = 1.0;
	public var m_Length:Float = 1.0;

	public function new(scene:Scene) {
		super(scene);
	}
	
	//Build the mesh:
	override public function BuildMesh():Mesh {
		//Create a new mesh builder:
		var meshBuilder:MeshBuilder = new MeshBuilder();
		
		//Add the vertices:
		meshBuilder.Vertices.push(new Vector3(0.0, 0.0, 0.0));
		meshBuilder.UVs.push(new Vector2(0.0, 0.0));
		meshBuilder.Normals.push(Vector3.Up());
		
		meshBuilder.Vertices.push(new Vector3(0.0, 0.0, m_Length));
		meshBuilder.UVs.push(new Vector2(0.0, 1.0));
		meshBuilder.Normals.push(Vector3.Up());
		
		meshBuilder.Vertices.push(new Vector3(m_Width, 0.0, m_Length));
		meshBuilder.UVs.push(new Vector2(1.0, 1.0));
		meshBuilder.Normals.push(Vector3.Up());
		
		meshBuilder.Vertices.push(new Vector3(m_Width, 0.0, 0.0));
		meshBuilder.UVs.push(new Vector2(1.0, 0.0));
		meshBuilder.Normals.push(Vector3.Up());
		
		//Add the triangles:
		meshBuilder.AddTriangle(0, 1, 2);
		meshBuilder.AddTriangle(0, 2, 3);
		
		//Create the mesh:
		return meshBuilder.CreateMesh(_scene);
	}
	
}
