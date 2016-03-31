package com.omnihx3d.materials;

import com.omnihx3d.mesh.AbstractMesh;

/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.MultiMaterial') class MultiMaterial extends Material {
	
	public var subMaterials:Array<Material> = [];
	

	public function new(name:String, scene:Scene) {
		super(name, scene, true);
		
		scene.multiMaterials.push(this);
	}

	// Properties
	public function getSubMaterial(index:Int):Material {
		if (index < 0 || index >= this.subMaterials.length) {
			return this.getScene().defaultMaterial;
		}
		
		return this.subMaterials[index];
	}

	// Methods
	override public function isReady(?mesh:AbstractMesh, useInstances:Bool = false):Bool {
		for (index in 0...this.subMaterials.length) {
			var subMaterial = this.subMaterials[index];
			if (subMaterial != null) {
				if (!this.subMaterials[index].isReady(mesh)) {
					return false;
				}
			}
		}
		
		return true;
	}
	
	override public function clone(name:String, cloneChildren:Bool = false):MultiMaterial {
		var newMultiMaterial = new MultiMaterial(name, this.getScene());
		
		for (index in 0...this.subMaterials.length) {
			var subMaterial = this.subMaterials[index];
			
			if (cloneChildren) {
				subMaterial = this.subMaterials[index].clone(name + "-" + this.subMaterials[index].name);
			}
			else {
				newMultiMaterial.subMaterials.push(subMaterial);
			}			
		}
		
		return newMultiMaterial;
	}
	
}
