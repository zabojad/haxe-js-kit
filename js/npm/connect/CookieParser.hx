package js.npm.connect;

extern class CookieParser 
implements npm.Package.Require<"connect","*"> #if !haxe3,#end
implements js.npm.connect.Middleware
{
	public function new(?secret:String) : Void;
	public inline static function cookie( req : js.node.http.ClientRequest ) : Dynamic {
		return untyped req.cookie;
	}

	static function __init__():Void{
		untyped CookieParser = Connect.cookieParser;
	}
}