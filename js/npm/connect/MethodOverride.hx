package js.npm.connect;

@:native('methodOverride')
extern class MethodOverride 
implements npm.Package.RequireNamespace<"connect","*"> #if !haxe3,#end
implements js.npm.connect.Middleware
{

	public function new( ?key : String ) : Void;

}