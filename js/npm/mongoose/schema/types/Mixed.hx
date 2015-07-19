package js.npm.mongoose.schema.types;

@:native("Schema.Types.Mixed")
extern class Mixed
extends js.npm.mongoose.SchemaType
implements npm.Package.RequireNamespace<"mongoose","^4.0.0"> {
	public function new( path : String , options : {} ) : Void;
}