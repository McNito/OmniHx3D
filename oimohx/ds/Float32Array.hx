package oimohx.ds;


/**
	Created by Alexander "fzzr" Kozlovskij
 **/
typedef Float32Array =
#if (omnihx3d && (js || purejs || html5 || web))
com.omnihx3d.utils.typedarray.Float32Array;
#else
haxe.ds.Vector<Float>;
#end
