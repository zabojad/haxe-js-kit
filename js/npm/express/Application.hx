package js.npm.express;

import js.support.RegExp;
import js.support.Callback;

//typedef ApplicationMethod = Request->Response->Void;
import js.npm.connect.support.Middleware;

extern class Application 
{

	public var locals : Dynamic;

	@:overload( function ( mount : String , middleware : Middleware<Request,Response> ) : Connect {} )
	@:overload( function ( mount : String , middleware : Middleware<Request,Response> ) : Connect {} )
	@:overload( function ( errorHandler : Dynamic -> Request -> Response -> Callback<Void> -> Void  ) : Connect {} )
	public function use ( middleware : Middleware<Request,Response> ) : Connect ;

	@:overload(function( port :Int, ready : Void -> Void ): Application { } )
	public function listen (port :Int, ?address :String) : Application;

	public static function createServer (a1 :Dynamic, ?a2 :Dynamic, ?a3 :Dynamic, ?a4 :Dynamic, ?a5 :Dynamic, ?a6 :Dynamic, ?a7 :Dynamic, ?a8 :Dynamic, ?a9 :Dynamic) : Connect;

	@:overload(function(path : RegExp , f1 : Middleware<Request,Response>, f2 : Middleware<Request,Response> ) : Void {} )
	@:overload(function(path : String , f1 : Middleware<Request,Response>, f2 : Middleware<Request,Response> ) : Void {} )
	@:overload(function(path : RegExp , f : Middleware<Request,Response> ) : Void {} )
	function get(path : String, f : Middleware<Request,Response> ) : Void;
	
	@:overload(function(path : RegExp , f1 : Middleware<Request,Response>, f2 : Middleware<Request,Response> ) : Void {} )
	@:overload(function(path : String , f1 : Middleware<Request,Response>, f2 : Middleware<Request,Response> ) : Void {} )
	@:overload(function(path : RegExp , f : Middleware<Request,Response> ) : Void {} )
	function post(path : String, f : Middleware<Request,Response> ) : Void;

	@:overload(function(path : RegExp , f :  Middleware<Request,Response> ) : Void {} )
	@:overload(function(path : String , f1 : Middleware<Request,Response> , f2 : Middleware<Request,Response> ) : Void {} )
	@:overload(function(path : RegExp , f1 : Middleware<Request,Response> , f2 : Middleware<Request,Response> ) : Void {} )
	function all(path : String, f : Middleware<Request,Response> ) : Void;

	function engine( ext : String , engine : String -> {} -> Callback<String> -> Void ) : Void;

	function param( name : String , callback : Request -> Response -> Callback<Void> -> Dynamic -> Void ) : Void;

	function set( setting : String , value : Dynamic ) : Void;

	
}