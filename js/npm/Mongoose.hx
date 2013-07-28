package js.npm;

import js.npm.mongoose.*;
import js.support.Callback;

extern class Mongoose
implements npm.Package.Require<"mongoose","*"> {
	public static var connection (default,null) : Connection;
	public static var modelNames (default,null) : Array<String>;
	public static var connections (default,null) : Array<Connection>;
	public static function disconnect(cb : Callback<Void>) : Void;

	public static function createConnection( url : String ) : Connection;
	public static function connect( url : String , ?cb : js.support.Callback<Void> ) : Connection;
	public static function model( name : String , schema : Schema , ?collectionName : String ) : Model;
}