package js.npm.connect;

@:native('compress')
extern class Compress 
implements npm.Package.RequireNamespace<"connect","*"> #if !haxe3,#end
implements js.npm.connect.Middleware
{
	public function new() : Void;
}