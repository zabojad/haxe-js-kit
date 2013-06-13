package js.npm.connect;

import js.node.http.ClientRequest;
import js.npm.Connect;
import js.npm.connect.session.Cookie;
import js.npm.connect.session.Store;

extern class Session 
implements npm.Package.Require<"connect","*"> #if !haxe3,#end
implements js.npm.connect.Middleware
{

	public function new( ?options : {
		?key : String,
		?store : Store,
		?secret : String,
		?cookie : Cookie,
		?proxy : Bool
	}) : Void;

	public inline static function session( req : ClientRequest ) : js.npm.connect.session.Session {
		return untyped req.session;
	}

	static function __init__():Void{
		untyped Session = Connect.session;
	}

}