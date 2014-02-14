package js.npm;

import js.npm.mongoose.*;
import js.support.Callback;

extern class Mongoose
implements npm.Package.Require<"mongoose","*"> {

	/**
	
	Default mongoose instance, ie return value of `require("mongoose")`

	**/
	public static var mongoose : js.npm.mongoose.Mongoose;

	static function __init__() : Void 
		mongoose = untyped Mongoose;
	
	// public static var connection (default,null) : Connection;
	// public static var modelNames (default,null) : Array<String>;
	// public static var connections (default,null) : Array<Connection>;
	// public static var version (default,null) : String;

	// public static function disconnect(cb : Callback<Void>) : Void;
	// public static function createConnection( url : String ) : Connection;
	// public static function connect( url : String , ?cb : js.support.Callback<Void> ) : js.npm.mongoose.Mongoose;
	// public static function model( name : String , ?schema : Schema , ?collectionName : String , ?skipInit : Bool ) : Model;
	// public static function plugin( fn : Dynamic , ?options : {} ) : js.npm.mongoose.Mongoose;
}