package util;

import haxe.macro.Context;
import haxe.macro.Expr;

class CopyMethods {	

	static function toIdentifier( verb : String ) {
		return verb;
	}

	static macro function build( verbs : ExprOf<Array<String>> , _fun : ExprOf<Function> , overloads : ExprOf<Array<Function>> ) : Array<Field> {
		var fields = Context.getBuildFields();

		var fun = switch( _fun.expr ){
			case EFunction(null, f) : 
				f;
			case _ : throw 'unsupported';
		}
		
		switch(verbs.expr){
			case EArrayDecl(arr) : 
				for( s in arr ) {
					switch( s.expr ) {
						case EConst(CString( verb )) : 
							//trace(verb);
							var verbIdentifier = toIdentifier( verb );
							var f = {
								name : verb,
								pos : s.pos,
								kind : FFun(fun),
								meta : []
							};
							switch( overloads.expr ){
								case EArrayDecl(arr2) : 
									for( o in arr2 ) {
										f.meta.push({
											pos : o.pos,
											params : [o],
											name : ":overload"
										});
									}
								case _ : throw 'assert';

							}
							fields.push(f);
						case _ : throw 'assert';
					}
				}
			case _ : throw 'assert';

		}
		
		return fields;
	}
}
