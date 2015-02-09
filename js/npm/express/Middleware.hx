package js.npm.express;

import js.support.Callback;

abstract TMiddleware( Middleware ) {
	@:from static inline public function fromIMiddleware( m : IMiddleware ) : TMiddleware {
		return untyped cast m;
	}
	@:from static inline public function fromResponder( m : MiddlewareResponder ) : TMiddleware {
		return untyped cast m;
	}
	@:from static inline public function fromMiddleware( m : Middleware ) : TMiddleware {
		return untyped cast m;
	}
}

typedef MiddlewareNext = ?Dynamic -> Void ;
typedef Middleware = Request->Response->MiddlewareNext->Void;
typedef MiddlewareResponder = Request->Response->Void;
typedef MiddlewareErrorHandler = Dynamic -> Request -> Response -> Callback0 -> Void;
typedef MiddlewareParam<P> = Request -> Response -> MiddlewareNext -> P -> Void;

typedef MiddlewareMethod = Route->TMiddleware->Void;

@:build( util.CopyMethods.build([
	'post', 
	'put', 
	'head', 
	'delete', 
	'options', 
	'trace', 
	'copy', 
	'lock', 
	'mkcol', 
	'move', 
	'purge', 
	'propfind', 
	'proppatch', 
	'unlock', 
	'report', 
	'mkactivity', 
	'checkout', 
	'merge', 
	'm-search',
	'notify', 
	'subscribe', 
	'unsubscribe', 
	'patch', 
	'search', 
	'connect',
	'all'
], 
function( path : Route, f : MiddlewareResponder ) : Application {},
[
	function<Req:Request,Res:Response>(path : Route , f : Array<TMiddleware> ) : Application {},
	function<Req:Request,Res:Response>(path : Route , f : TMiddleware ) : Application {}
]) )
extern class MiddlewareHttp 
{
	@:overload( function<Req:Request,Res:Response> ( path : Route , f : Array<TMiddleware> ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( path : Route , TMiddleware : TMiddleware ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( errorHandler : MiddlewareErrorHandler ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( middleware : TMiddleware ) : Application {} )
	public function use ( middleware : MiddlewareResponder ) : Application ;

	function param<P>( name : String , callback : MiddlewareParam<P> ) : Application;
}

extern interface IMiddleware {}

