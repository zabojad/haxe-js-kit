package js.npm.express;

import js.support.RegExp;
import js.support.Callback;

//typedef ApplicationMethod = Request->Response->Void;
import js.npm.express.Middleware;

extern class Application 
implements Dynamic<String->TMiddleware<Request,Response>->Void>
{

	public var locals : Dynamic;
	public var router : Router;

	@:overload( function<Req:Request,Res:Response> ( path : RegExp , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( path : RegExp , TMiddleware : TMiddleware<Req,Res> ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( path : String , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( path : String , TMiddleware : TMiddleware<Req,Res> ) : Application {} )
	@:overload( function<Req:Request,Res:Response> ( errorHandler : MiddlewareErrorHandler<Req,Res> ) : Application {} )
	public function use<Req:Request,Res:Response> ( middleware : TMiddleware<Req,Res> ) : Application ;

	@:overload(function( port :Int, ready : Void -> Void ): Application { } )
	public function listen (port :Int, ?address :String) : Application;

	public static function createServer (a1 :Dynamic, ?a2 :Dynamic, ?a3 :Dynamic, ?a4 :Dynamic, ?a5 :Dynamic, ?a6 :Dynamic, ?a7 :Dynamic, ?a8 :Dynamic, ?a9 :Dynamic) : Application;

	@:overload(function<Req:Request,Res:Response>(path : RegExp , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	@:overload(function<Req:Request,Res:Response>(path : RegExp , f : TMiddleware<Req,Res> ) : Application {} )
	@:overload(function<Req:Request,Res:Response>(path : String , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	@:overload(function(name:String) : Dynamic {} )
	function get<Req:Request,Res:Response>(path : String, f : TMiddleware<Req,Res> ) : Application;
	
	@:overload(function<Req:Request,Res:Response>(path : RegExp , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	@:overload(function<Req:Request,Res:Response>(path : RegExp , f : TMiddleware<Req,Res> ) : Application {} )
	@:overload(function<Req:Request,Res:Response>(path : String , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	function post<Req:Request,Res:Response>(path : String, f : TMiddleware<Req,Res> ) : Application;

	@:overload(function<Req:Request,Res:Response>(path : RegExp , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	@:overload(function<Req:Request,Res:Response>(path : RegExp , f : TMiddleware<Req,Res> ) : Application {} )
	@:overload(function<Req:Request,Res:Response>(path : String , f : Array<TMiddleware<Req,Res>> ) : Application {} )
	function all<Req:Request,Res:Response>( path : String, f : TMiddleware<Req,Res> ) : Application;

	function engine( ext : String , engine : ViewEngine ) : Application;

	function param<Req:Request,Res:Response,P>( name : String , callback : MiddlewareParam<Req,Res,P> ) : Application;

	function set( setting : String , value : Dynamic ) : Application;

	
}