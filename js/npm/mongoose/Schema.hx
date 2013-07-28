package js.npm.mongoose;

extern class Schema
implements npm.Package.RequireNamespace<"mongoose","*"> {

	public static var reserved : Dynamic<Int>;
	public static var indexTypes (default,null) : Array<String>;

	public var tree : Dynamic;
	public var paths : Dynamic<Class<SchemaType>>;
	public function new( definition : {} , ?options : SchemaOptions ) : Void;
	public function defaultOptions( ?options : SchemaOptions ) : SchemaOptions;
	public function add( obj : {} , ?prefix : String ) : Schema;
	public function path( path : String , ?obj : Dynamic ) : Schema;
	public function eachPath( fn : String->Dynamic->Void ) : Schema;
	public function requiredPaths() : Array<String>;
	public function pathType( path : String ) : String;
	public function pre( method : String , fn : ( Void->Void )->Void ) : Schema;
	public function post( method : String , fn : ( Void->Void )->Void ) : Schema;
	public function plugin( fn : Schema->?{}->Void , ?opts : {} ) : Schema;
	@:overload( function( methods : Dynamic<Dynamic<Dynamic->Dynamic>> ) : Schema {} )
	public function method( name : String , fn : Dynamic<Dynamic->Dynamic> ) : Schema;
	@:overload( function( methods : Dynamic<Dynamic<Dynamic->Dynamic>> ) : Schema {} )
	public inline function static_( name : String , fn : Dynamic<Dynamic->Dynamic> ) : Schema 
		return untyped this['static'](arguments);
	public function index( fields : {} , ?options : {} ) : Schema;
	@:overload( function( key : String ) : Dynamic {} )
	public function set( key : String , value : Dynamic , ?_tags : Dynamic ) : Schema;
	public function get( key : String ) : Dynamic;
	public function indexes() : Array<Dynamic>;
	public function virtual( name : String , ?options : {} ) : VirtualType;
	public function virtualpath( name : String ) : VirtualType;
}

typedef SchemaOptions = {
	?autoIndex : Bool,
	?bufferCommands : Bool,
	?capped : Bool,
	?collection : String,
	?id : Bool,
	?_id : Bool,
	?minimize : Bool,
	?read : String,
	?safe : Bool,
	?shardKey : Bool,
	?strict : Bool,
	?toJSON : Dynamic,
	?toObject : Dynamic,
	?versionKey : Bool
}