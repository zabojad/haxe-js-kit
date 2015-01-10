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

extern interface IMiddleware<Req:Request,Res:Response> {}

