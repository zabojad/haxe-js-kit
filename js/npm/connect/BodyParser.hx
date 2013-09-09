package js.npm.connect;

typedef BodyParserOptions = {
	?uploadDir : String
};

@:native('bodyParser')
extern class BodyParser
implements npm.Package.RequireNamespace<"connect","*"> #if !haxe3,#end
implements js.npm.connect.Middleware {

	public inline static function body( req : js.node.http.ClientRequest ) : Dynamic {
		return untyped req.body;
	}

	public function new(?options:BodyParserOptions) : Void;
}