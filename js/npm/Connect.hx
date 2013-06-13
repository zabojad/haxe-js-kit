package js.npm;

import js.node.Http;
import js.node.http.*;

import js.npm.connect.Middleware;

private typedef MiddlewareFunction = ClientRequest->ServerResponse->Null<(Void->Void)>->Void;

extern class Connect 
implements npm.Package.Require<"connect","*">
{
	public function new() : Void;

	@:overload( function ( middleware : Middleware ) : Connect {} )
	@:overload( function ( mount : String , middleware : MiddlewareFunction ) : Connect {} )
	@:overload( function ( mount : String , middleware : Middleware ) : Connect {} )
	public function use ( middleware : MiddlewareFunction ) : Connect ;

	@:overload(function( port :Int, ready : Void -> Void ): Server { } )
	public function listen (port :Int, ?address :String) : Server;

	public static function createServer (a1 :Dynamic, ?a2 :Dynamic, ?a3 :Dynamic, ?a4 :Dynamic, ?a5 :Dynamic, ?a6 :Dynamic, ?a7 :Dynamic, ?a8 :Dynamic, ?a9 :Dynamic) : Connect;
	/*public static function cookieParser( ?secret : String = null ) : MiddleWare;
	public static function bodyParser() :MiddleWare;
	public static function logger() :MiddleWare;
	public static function session(params :Dynamic) :MiddleWare;
	public static function router(routes :Dynamic->Void) :Void;
	public static function errorHandler (options :Dynamic) :MiddleWare;
	public inline static function static_(root:String,?options:{}) :MiddleWare 
		return untyped Connect["static"](root,options);*/
}
