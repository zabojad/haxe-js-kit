package js.support;

abstract RegExp(js.native.RegExp) {
	inline function new( regexp : js.native.RegExp ){
		this = regexp;
	}
	@:from public inline static function fromEReg( r : EReg ){
		return new RegExp( RegExpTools.toRegExp( r ) );
	}
	@:to public inline static function toEReg( r : js.native.RegExp ) : EReg {
		return RegExpTools.toEReg( r );
	}
}