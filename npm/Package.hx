
package npm;

#if macro
import haxe.Json;
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Expr.Field;
import sys.io.File;
#end

private typedef Pack = {
	name : String,
	?version : String
}

#if !macro extern #end
class Package {

	static var dependencies : #if haxe3 Map<String,String> #else Hash<String> #end;

	#if macro
	public static function export( path : String = "package.json" ) : Void{
		Context.onGenerate( function(_){
			if( dependencies == null ) return;
			var data : Dynamic = {}
			
			if( sys.FileSystem.exists(path) ){
				data = Json.parse( File.getContent(path) );
			}

			if( data.dependencies == null ){
				data.dependencies = {};
			}else{
				switch(Type.typeof(data.dependencies)){
					case TObject: // fine
					default: data.dependencies = {};
				}
			}

			for( name in dependencies.keys() ){
				Reflect.setField( data.dependencies , name , dependencies.get(name) );
			}

			var content =  npm.Json.stringify( data );
			sys.io.File.saveContent( path , content );

		});
	}
	#end
	
	#if haxe3 macro #else @:macro #end public static function require( name : String , ?version : String = "*" , ?native : String = null ) {
		if( dependencies == null ){
			dependencies = new #if haxe3 Map #else Hash #end();
		}
		
		var nameExpr = Context.makeExpr( name , Context.currentPos() );
		dependencies.set( name , version );

		var outp = macro __js__("require")( $nameExpr );
		
		if( native != null ){
			for( p in native.split(".") ){
				var pExpr = Context.makeExpr( p , Context.currentPos() );
				outp = macro $outp[$pExpr];
			}

		}

		return macro untyped $outp;
		
	}
	
}

#if !macro extern #end class Include {

	#if macro
	static var initPack = [];
	static var requiredPack = [];
	#end

	#if haxe3 macro #else @:macro #end public static function build() : Array<Field>{
		var error = "Usage: 'implements npm.Module<\"module-name\",\"module-version\">'";
		var invalidNative = "Invalid :native";
		var cl = Context.getLocalClass().get();
		var fields = Context.getBuildFields();
		var required : Pack = null;
		var requirePackage = false;
		
		for( i in cl.interfaces ){
			var t = i.t.get();
			if( t.module == "npm.Package" 
				&& ( t.name == "Require" || t.name == "RequireNamespace" ) ) {
				if( t.name == "RequireNamespace" ) 
					requirePackage = true;
				for( n in 0...i.params.length ){
					switch(i.params[n]){
						case TInst(name,_) :
							switch(name.get().kind){
								case KExpr(e):
									switch( e.expr ){
										case EConst(c) :
											switch(c){
												case CString(s) :
													if( required == null ){
														required = cast {};
													}
													switch( n ){
														case 0 :
															required.name = s;
														case 1 :
															required.version = s;
													}
													
												default:
													throw error;
											}
										default: 
											throw error;
									}
								default :
									throw error;
							}
						default:
							throw error;
					}
				}
			}
		}

		if( required != null ){
			var pos = Context.currentPos();

			var native = cl.name;
			if( cl.meta.has(":native") ){
				for(meta in cl.meta.get() ){
					if( meta.name == ":native" ){
						if( meta.params.length != 1 )
							throw invalidNative;
						
						switch( meta.params[0].expr ){
							case EConst( c ) : 
								switch( c ) {
									case CString( s ) :
										native = s;
									default : 
										throw invalidNative;
								}
							default :
								throw invalidNative;
						}
					}
				}
			}
			
			var clName = cl.pack.join("__") + "__"+cl.name;
			
			if( Lambda.has( initPack, clName ) ){
				return fields;
			}

			var init = [];

			if( requirePackage ){
				init.push( macro var $clName = untyped npm.Package.require( '${required.name}','${required.version}' , '${native}' ) );
			}else{
				init.push( macro var $clName = untyped npm.Package.require( '${required.name}','${required.version}' ) );
			}

			cl.meta.add(":native",[macro '$clName'], pos);
			
			initPack.push(clName);
			
			if( init.length == 0 ){
				return fields;
			}

			var injected = false;

			for( f in fields ){
				if( f.name == "__init__" ){
					switch( f.kind ){
						case FFun( fun ) :
							injected = true;
							init.push( { expr : fun.expr.expr , pos : fun.expr.pos } );
							var newExpr = {
								pos : fun.expr.pos,
								expr : EBlock(init)
							};
							fun.expr = newExpr;
						default :
					}
				}
			}

			if( !injected ){
				var f = {
					name : "__init__",
					pos : pos,
					meta : [],
					access : [AStatic],
					kind : FFun({
						ret : TPath({
							name : "Void",
							pack : [],
							params : [],
							sub : null
						}),
						params : [],
						args : [],
						expr : {
							pos : pos,
							expr : EBlock(init)
						}
					})
				};
				fields.push(f);
			}
			
		}
		return fields;
	}
	
}

@:autoBuild(npm.Include.build())
extern interface Require<Const,Const> {}

@:autoBuild(npm.Include.build())
extern interface RequireNamespace<Const,Const> {}

