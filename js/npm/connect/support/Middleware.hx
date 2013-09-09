package js.npm.connect.support;

import js.node.http.ClientRequest;
import js.node.http.ServerResponse;

abstract Middleware<Request:ClientRequest,Response:ServerResponse>(Request->Response->Void) {
	@:from static public inline function fromMiddleware( middleware : js.npm.connect.Middleware ){
		return untyped middleware;
	}
	@:from static public inline function fromAsync( method : Request->Response->(Void->Void)->Void ){
		return untyped method;
	}
	@:from static public inline function fromSync( method : Request->Response->Void ){
		return untyped method;
	}
}