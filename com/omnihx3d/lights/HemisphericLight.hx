package com.omnihx3d.lights;

import com.omnihx3d.lights.shadows.ShadowGenerator;
import com.omnihx3d.materials.Effect;
import com.omnihx3d.math.Color3;
import com.omnihx3d.math.Matrix;
import com.omnihx3d.math.Vector3;

/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.HemisphericLight') class HemisphericLight extends Light {
	
	public var groundColor = new Color3(0.0, 0.0, 0.0);
	public var direction:Vector3;

	private var _worldMatrix:Matrix;
	

	public function new(name:String, direction:Vector3, scene:Scene) {
		super(name, scene);
		
		this._type = "HEMILIGHT";
		this.direction = direction;
	}

	public function setDirectionToTarget(target:Vector3):Vector3 {
		this.direction = Vector3.Normalize(target.subtract(Vector3.Zero()));
		return this.direction;
	}

	override public function getShadowGenerator():ShadowGenerator {
		return null;
	}

	static var normalizeDirection:Vector3;
	override public function transferToEffect(effect:Effect, ?directionUniformName:String, ?groundColorUniformName:String):Void {
		normalizeDirection = Vector3.Normalize(this.direction);
		effect.setFloat4(directionUniformName, normalizeDirection.x, normalizeDirection.y, normalizeDirection.z, 0);
		effect.setColor3(groundColorUniformName, this.groundColor.scale(this.intensity));
	}

	override public function _getWorldMatrix():Matrix {
		if (this._worldMatrix == null) {
			this._worldMatrix = Matrix.Identity();
		}
		
		return this._worldMatrix;
	}
	
	override public function serialize():Dynamic {
		var serializationObject = super.serialize();
		serializationObject.type = 3;
		serializationObject.direction = this.direction.asArray();
		serializationObject.groundColor = this.groundColor.asArray();
		
		return serializationObject;
	}
	
}
