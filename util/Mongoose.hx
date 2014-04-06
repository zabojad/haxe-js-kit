package util;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;

class Mongoose {

	inline static var INSTANCE_MEMBER_ERROR = "Instance members are not supported";

	#if !macro macro #end public static function buildModel( modelType : Expr ){

		// retrieve class type
		var modelClass = switch( Context.typeExpr(modelType).expr ){
			case TTypeExpr(TClassDecl(c)) :
				c.get();
			default : throw "error";
		}

		var fields = Context.getBuildFields();
		var cl = Context.getLocalClass().get();
		var pos = Context.currentPos();
		var type = Context.getLocalType();
		
		// find Model in superclasses
		var superClass = cl.superClass;
		while( superClass != null ){
			var superType = superClass.t.get();

			if( superType.name == modelClass.name && superType.module == modelClass.module ){
				break;
			}

			superClass = superClass.t.get().superClass;
		}

		// forbid instance members
		for( f in fields ){
			if( f.access.indexOf(AStatic) < 0 ){
				haxe.macro.Context.error( INSTANCE_MEMBER_ERROR , cl.pos );
			}
		}

		var modelDecl = haxe.macro.TypeTools.follow( superClass.params[0] );

		switch(modelDecl){
			case TAnonymous( a ):
				// copy anonymous fields to instance fields
				for( f in a.get().fields ){
					var access = [APublic];
					var varType = haxe.macro.TypeTools.toComplexType( f.type );
					if( f.meta.has(":optional") ){
						varType = TPath({
							sub : null,
							params : [TPType(varType)],
							pack : [],
							name : "Null"
						});
					}
					
					fields.push({
						name : f.name,
						pos : pos,
						meta : f.meta.get(),
						doc : null,
						access : access,
						kind : FVar( varType )
					});
					
				}

				var schemaDef = {
					expr : anonTypeToSchemaDef( a.get() ),
					pos : pos
				};
				
				// add "make" method
				fields.push({
					pos : pos,
					name : 'build',
					meta : [],
					doc : null,
					kind : FFun({
						ret : TPath({
							name : "Model",
							pack : ["js","npm","mongoose"],
							params : [
								TPType( haxe.macro.TypeTools.toComplexType( modelDecl ) ),
								TPType(TPath({
									sub : null,
									params : [],
									pack : cl.pack,
									name : cl.name
								}))
							],
							sub : "TypedModels"
						}),
						params : [],
						expr : macro {
							
							var s = new js.npm.mongoose.Schema($schemaDef);
							//untyped s.methods = $methodsObj;
							return mongoose.model( name , s );

						},
						args : [{
							name : "mongoose",
							value : null,
							type : TPath({
								sub : null,
								pack : ["js","npm","mongoose"],
								name : "Mongoose",
								params : []
							}),
							opt : null
						},{
							name : "name",
							value : null,
							type : TPath({
								sub : null,
								pack : [],
								name : "String",
								params : []
							}),
							opt : null
						}]
					}),
					access : [AStatic,APublic]
				});
			default :
				throw "not supported";
		}
		return fields;
	}

	static function anonTypeToSchemaDef( a : AnonType ) : ExprDef {
		var fields : Array<{ field : String, expr : haxe.macro.Expr }> = [];
		
		for( f in a.fields ){
			var name = f.name;
			var type = f.type;

			fields.push({ field : name , expr : typeToSchemaField(type) });
		}

		var objDecl = EObjectDecl( fields );

		return objDecl;
	}

	static function typeToSchemaField( type : Type ) : Expr {
		
		return switch( type ){
			case TInst( t , params ) :
				var i = t.get();
				switch( i.pack.join(".") + "." + i.name ){
					case "String" : 
						macro { type : String };
					case "Array" :
						macro [{ type : typeToSchemaField(params[0]) }];
					case "Date" :
						macro { type : Date };
					case "js.node.Buffer" :
						macro { type : js.node.Buffer };
					case "js.npm.mongoose.schema.types.ObjectId" :
						macro { type : js.npm.mongoose.schema.types.ObjectId };
					default : 
						macro {};
				}	
			case TAbstract( t , params ) :
				var a = t.get();
				switch( a.pack.join(".") + "." + a.name ){
					case "Float","Int" :
						macro { type : untyped __js__('Number') };
					default : 
						macro {};
				}
			default : macro {};
		}

	}
}