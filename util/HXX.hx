package util;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;
import haxe.macro.TypeTools;
#end

/**

	Rudimentary JSX-like compiler for Haxe

**/
class HXX {
	macro public static function compile( expr : Expr ) {
		return tr(expr);
	}
	
	#if macro
	static function tr( expr : Expr ): Expr {
		return switch(expr.expr){
			case EMeta(m,c) if (m.name == 'el'):
				createElement(c);
			case _: 
				ExprTools.map(expr,tr);

		}
	}

	static function createElement(expr:Expr) {
		return switch( expr.expr ) {
			case ECall(call, args ):
				var children : Array<Expr> = [];
				var attributes : Array<{ field : String, expr: Expr}> = [];
				for ( a in args ) switch ( a.expr ) {
					case EBinop(op,left,right) : 
						var field = switch( left.expr ) {
							case EConst(CIdent(i)) : i;
	 						case EConst(CString(i)) : i;
	 						default: Context.error("unsupported", left.pos ); 
						}
						attributes.push( { field : field , expr : right } );
					default:
						children.push( tr( a ) );
				}

				var element = switch( call.expr ){
					case EConst(CIdent(el)) if (~/^[a-z]/.match(el)) : 
						macro $v{el};
					default: 
						macro js.npm.react.support.Tools.createReactClass( $call );
				}

				var callArgs = [element, { expr : EObjectDecl(attributes) , pos : expr.pos } ];
				callArgs = callArgs.concat( children );

				var o = {
					pos: expr.pos,
					expr: ECall( 
						macro untyped js.npm.React.createElement,
						callArgs
					)
				};

				o;

			case _ : 
				throw Context.error("unsupported", expr.pos);
		}
	}
	#end
}