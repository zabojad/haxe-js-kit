package util;

import haxe.macro.Type;

class Macro {

	public inline static var NATIVE_META = ":native";
	public static inline var INVALID_NATIVE = "Invalid :native";
	
	public static function extractNative( cl : ClassType ) : Null<String> {
		if( cl.meta.has(NATIVE_META) ){
			for(meta in cl.meta.get() ){
				if( meta.name == NATIVE_META ){
					if( meta.params.length != 1 )
						throw INVALID_NATIVE;
					
					switch( meta.params[0].expr ){
						case EConst( c ) : 
							switch( c ) {
								case CString( s ) :
									return s;
								default : 
									throw INVALID_NATIVE;
							}
						default :
							throw INVALID_NATIVE;
					}
				}
			}
		}

		return null;
	}

	public static function extractStringParams( cl : ClassType , type : String ) : Array<Array<String>>{

		var spl = type.split(".");
		var typeName = spl.pop();
		var typeModule = spl.join(".");

		var outp = [];

		for( i in cl.interfaces ){
			var t = i.t.get();
			if( t.module == typeModule && t.name == typeName ) {
				
				var params : Array<String> = [];
				outp.push(params);

				for( n in 0...i.params.length ){
					switch(i.params[n]){
						case TInst(name,_) :
							switch(name.get().kind){
								case KExpr(e):
									switch( e.expr ){
										case EConst(c) :
											switch(c){
												case CString(s) :
													/*if( required == null ){
														required = cast {};
													}
													switch( n ){
														case 0 :
															required.name = s;
														case 1 :
															required.version = s;
													}*/
													params[n] = s;
													
												default:
													//throw NPM_USAGE;
											}
										default: 
											//throw NPM_USAGE;
									}
								default :
									//throw NPM_USAGE;
							}
						default:
							//throw NPM_USAGE;
					}
				}
			}
		}

		return outp;

	}

}