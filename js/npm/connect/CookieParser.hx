package js.npm.connect;

@:native("cookieParser")
extern class CookieParser 
implements npm.Package.RequireNamespace<"connect","*"> #if !haxe3,#end
implements js.npm.connect.Middleware
{
	public function new(?secret:String) : Void;
	public inline static function cookies( req : js.node.http.ClientRequest ) : Dynamic {
		return untyped req.cookies;
	}
}