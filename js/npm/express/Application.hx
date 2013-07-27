package js.npm.express;

import js.npm.connect.Middleware;
import js.native.RegExp;
import js.support.Callback;

extern class Application 
{

	@:overload( function ( middleware : Middleware ) : Connect {} )
	@:overload( function ( mount : String , middleware : Request ->  Response -> Void ) : Connect {} )
	@:overload( function ( mount : String , middleware : Middleware ) : Connect {} )
	public function use ( middleware : Request ->  Response -> Void ) : Connect ;

	@:overload(function( port :Int, ready : Void -> Void ): Application { } )
	public function listen (port :Int, ?address :String) : Application;

	public static function createServer (a1 :Dynamic, ?a2 :Dynamic, ?a3 :Dynamic, ?a4 :Dynamic, ?a5 :Dynamic, ?a6 :Dynamic, ?a7 :Dynamic, ?a8 :Dynamic, ?a9 :Dynamic) : Connect;

	@:overload(function(path : RegExp , f : Request ->  Response -> Void) : Void {} )
	function get(path : String, f : Request ->  Response -> Void) : Void;
	
	@:overload(function(path : RegExp , f : Request ->  Response -> Void) : Void {} )
	function post(path : String, f : Request ->  Response -> Void) : Void;

	function engine( ext : String , engine : String -> {} -> Callback<String> -> Void ) : Void;

	function param( name : String , callback : Request -> Response -> Callback<Void> -> Dynamic -> Void ) : Void;

	function set( setting : String , value : Dynamic ) : Void;

	
}