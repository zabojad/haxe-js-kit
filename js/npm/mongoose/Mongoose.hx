package js.npm.mongoose;

import js.npm.mongoose.*;
import js.support.Callback;

extern class Mongoose
implements npm.Package.RequireNamespace<"mongoose","*"> {
	public function new() : Void;
	public var connection (default,null) : Connection;
	public var modelNames (default,null) : Array<String>;
	public var connections (default,null) : Array<Connection>;
	public var version (default,null) : String;

	public function disconnect(cb : Callback<Void>) : Void;
	public function createConnection( url : String ) : Connection;
	public function connect( url : String , ?fn : js.support.Callback<Void> ) : Mongoose;
	public function model<S:Schema>( name : String , ?schema : S , ?collectionName : String , ?skipInit : Bool ) : Model.Models<Model<S>>;
	public function plugin( fn : Dynamic , ?options : {} ) : Mongoose;
}