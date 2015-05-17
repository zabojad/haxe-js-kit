package js.npm.express;
import js.npm.express.Middleware;
import js.support.Callback;

extern class Router 
extends MiddlewareHttp
implements IMiddleware
implements Dynamic<String->TMiddleware->Void>
implements npm.Package.RequireNamespace<"express","~4.0">
{
	public function new() : Void;
	
	@:overload(function(path : Route , f : Array<TMiddleware> ) : Router {})
	@:overload(function(path : Route , f : TMiddleware ) : Router {})
	@:overload(function ( setting : String ): Dynamic { } )
	function get( path : Route, f : MiddlewareResponder ) : Router;

}