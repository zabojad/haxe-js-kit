package js.support;

import js.native.RegExp;

class RegExpTools {
	public inline static function toRegExp( ereg : EReg ) : js.native.RegExp {
		return untyped ereg.r;
	}
	public inline static function toEReg( regexp : js.native.RegExp ) : EReg {
		return new EReg( regexp.source , 
			( regexp.ignoreCase ? "i" : "" ) 
			+ ( regexp.global ? "g" : "" ) 
			+ ( regexp.multiline ? "m" : "" )  
		);
	}
}