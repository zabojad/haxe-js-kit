package js.npm.express;

import js.support.RegExp;

abstract Route(RegExp) {
	@:from public static inline function fromString( r : String ) {
		return untyped cast r;
	}
}