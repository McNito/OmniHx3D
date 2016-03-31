package com.omnihx3d.utils.js;

import haxe.Constraints.Function;
import js.Browser; 
import js.html.Element;  
import js.html.Event;

/**
 * ...
 * @author 0xFireball
 */
class PointerLock {

    private var canvas:Element;
    public var locked:Bool = false;
	public var handleMoveRelative:Function;

    public function new() {
		
    }

    public function init():Void {
        canvas = Browser.document.getElementsByTagName("canvas").item(0);
        Browser.document.addEventListener("click", requestPointerLock);
        Browser.document.addEventListener("pointerlockchange", pointerLockChange);
        Browser.document.addEventListener("mozpointerlockchange", pointerLockChange);
        Browser.document.addEventListener("webkitpointerlockchange", pointerLockChange);
        Browser.document.addEventListener("mousemove", mouseMove);
    }

    private function requestPointerLock():Void {
        if (!locked) {
            untyped __js__("this.canvas.requestPointerLock = this.canvas.requestPointerLock || this.canvas.mozRequestPointerLock || this.canvas.webkitRequestPointerLock");
            untyped __js__("this.canvas.requestPointerLock()");
        }
    }

    private function pointerLockChange():Void {
        untyped __js__("this.locked = (document.pointerLockElement === this.canvas || document.mozPointerLockElement  === this.canvas || document.webkitPointerLockElement  === this.canvas)");
        trace("Pointer locked: " + locked);
    }

    private function mouseMove(e:Event):Void {
        if (locked) {
            var movementX:Float = untyped __js__("e.movementX || e.mozMovementX || e.webkitMovementX || 0");
            var movementY:Float = untyped __js__("e.movementY || e.mozMovementY || e.webkitMovementY || 0");
            handleMoveRelative(movementX, movementY);
        }
    }
}