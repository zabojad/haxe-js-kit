package js.support;

abstract RegExp(js.native.RegExp) {
	@:from public inline static function fromEReg( r : EReg ){
		return untyped r.r;
	}
	@:to public inline static function toEReg( r : js.native.RegExp ) : EReg {
		return new EReg( r.source , 
			( r.ignoreCase ? "i" : "" ) 
			+ ( r.global ? "g" : "" ) 
			+ ( r.multiline ? "m" : "" )  
		);
	}
}