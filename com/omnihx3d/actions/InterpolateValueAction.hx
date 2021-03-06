package com.omnihx3d.actions;

import com.omnihx3d.animations.Animation;
import com.omnihx3d.math.Color3;
import com.omnihx3d.math.Vector3;
import com.omnihx3d.math.Matrix;
import com.omnihx3d.math.Quaternion;

/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.InterpolateValueAction') class InterpolateValueAction extends Action {
	
	private var _target:Dynamic;
	private var _property:String;
	
	public var propertyPath:String;
	public var value:Dynamic;
	public var duration:Int;
	public var stopOtherAnimations:Bool;
	

	public function new(triggerOptions:Dynamic, target:Dynamic, propertyPath:String, value:Dynamic, duration:Int = 1000, ?condition:Condition, stopOtherAnimations:Bool = false) {
		super(triggerOptions, condition);

		this._target = target;
		this.propertyPath = propertyPath;
		this.value = value;
		this.duration = duration;
		this.stopOtherAnimations = stopOtherAnimations;
	}

	override public function _prepare() {
		this._target = this._getEffectiveTarget(this._target, this.propertyPath);
		this._property = this._getProperty(this.propertyPath);
	}

	override public function execute(?evt:ActionEvent) {
		var scene = this._actionManager.getScene();
		var keys = [
			{
				frame: 0,
				value: Reflect.getProperty(this._target, this._property)
			}, {
				frame: 100,
				value: this.value
			}
		];
		
		var dataType:Int = -1;
		
		if (Std.is(this.value, Int) || Std.is(this.value, Float)) {
			dataType = Animation.ANIMATIONTYPE_FLOAT;
		} 
		else if (Std.is(this.value, Color3)) {
			dataType = Animation.ANIMATIONTYPE_COLOR3;
		} 
		else if (Std.is(this.value, Vector3)) {
			dataType = Animation.ANIMATIONTYPE_VECTOR3;
		} 
		else if (Std.is(this.value, Matrix)) {
			dataType = Animation.ANIMATIONTYPE_MATRIX;
		} 
		else if (Std.is(this.value, Quaternion)) {
			dataType = Animation.ANIMATIONTYPE_QUATERNION;
		} 
		else {
			trace("InterpolateValueAction:Unsupported type (" + Type.getClassName(this.value) + ")");
			return;
		}
		
		var animation = new Animation("InterpolateValueAction", this._property, Std.int(100 * (1000.0 / this.duration)), dataType, Animation.ANIMATIONLOOPMODE_CONSTANT);
		
		animation.setKeys(keys);
		
		if (this.stopOtherAnimations) {
			scene.stopAnimation(this._target);
		}
		
		scene.beginDirectAnimation(this._target, [animation], 0, 100);
	}
	
}
