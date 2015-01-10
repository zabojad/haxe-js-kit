package js.npm.express;
import js.npm.express.Middleware;
import js.support.Callback;

extern class Router 
extends MiddlewareHttp
implements IMiddleware<Request,Response>
implements Dynamic<String->TMiddleware<Request,Response>->Void>
implements npm.Package.RequireNamespace<"express","~4.0">
{

	public function new() : Void;

}