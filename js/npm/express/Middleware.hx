package js.npm.express;

import js.support.Callback;

abstract TMiddleware<Req:Request,Res:Response>( Middleware<Request,Response> ) {
	@:from static inline public function fromIMiddleware<Req,Res>( m : IMiddleware<Req,Res> ) : TMiddleware<Req,Res> {
		return untyped cast m;
	}
	@:from static inline public function fromResponder<Req,Res>( m : MiddlewareResponder<Req,Res> ) : TMiddleware<Req,Res> {
		return untyped cast m;
	}
	@:from static inline public function fromMiddleware<Req,Res>( m : Middleware<Req,Res> ) : TMiddleware<Req,Res> {
		return untyped cast m;
	}
}

typedef MiddlewareNext = ?Dynamic -> Void ;
typedef Middleware<Req:Request,Res:Response> = Req->Res->MiddlewareNext->Void;
typedef MiddlewareResponder<Req:Request,Res:Response> = Req->Res->Void;
typedef MiddlewareErrorHandler<Req:Request,Res:Response> = Dynamic -> Req -> Res -> Callback0 -> Void;
typedef MiddlewareParam<Req:Request,Res:Response,P> = Req -> Res -> MiddlewareNext -> P -> Void;

typedef MiddlewareMethod = Route->TMiddleware<Request,Response>->Void;

@:build( util.CopyMethods.build([
	'get', 
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
function( path : Route, f : MiddlewareResponder<Request,Response> ) : Application {},
[
	function<Req:Request,Res:Response>(path : Route , f : Array<TMiddleware<Req,Res>> ) : Application {},
	function<Req:Request,Res:Response>(path : Route , f : TMiddleware<Req,Res> ) : Application {}
]) )
extern class MiddlewareHttp 
{
	@:overload( function<Req:Request,Res:Response> ( path : Route , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( path : Route , TMiddleware : TMiddleware<Req,Res> ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( errorHandler : MiddlewareErrorHandler<Req,Res> ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( middleware : TMiddleware<Req,Res> ) : Application {} )
	public function use ( middleware : MiddlewareResponder<Request,Response> ) : Application ;

	// @:overload(function<Req:Request,Res:Response>(path : Route , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	// @:overload(function<Req:Request,Res:Response>(path : Route , f : TMiddleware<Req,Res> ) : Application {} )
	// function get( path : Route, f : MiddlewareResponder<Request,Response> ) : Application;

	// @:overload(function<Req:Request,Res:Response>(path : Route , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	// @:overload(function<Req:Request,Res:Response>(path : Route , f : TMiddleware<Req,Res> ) : Application {} )
	// function post( path : Route, f : MiddlewareResponder<Request,Response> ) : Application;

	// @:overload(function<Req:Request,Res:Response>(path : Route , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	// @:overload(function<Req:Request,Res:Response>(path : Route , f : TMiddleware<Req,Res> ) : Application {} )
	// function put( path : Route, f : MiddlewareResponder<Request,Response> ) : Application;

	// @:overload(function<Req:Request,Res:Response>(path : Route , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	// @:overload(function<Req:Request,Res:Response>(path : Route , f : TMiddleware<Req,Res> ) : Application {} )
	// function delete( path : Route, f : MiddlewareResponder<Request,Response> ) : Application;

	// @:overload(function<Req:Request,Res:Response>(path : Route , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	// @:overload(function<Req:Request,Res:Response>(path : Route , f : TMiddleware<Req,Res> ) : Application {} )
	// function all( path : Route, f : MiddlewareResponder<Request,Response> ) : Application;

	function param<Req:Request,Res:Response,P>( name : String , callback : MiddlewareParam<Req,Res,P> ) : Application;
}

extern interface IMiddleware<Req:Request,Res:Response> {}

