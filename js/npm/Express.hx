package js.npm;

extern class Express 
extends js.npm.express.Application #if !haxe3,#end 
implements npm.Package.Require<"express","~4.0"> {

	public function new() : Void;
	
	static public function Router(? option : { ? caseSensitive : Bool, ? mergeParams : Bool, ? strict : Bool }) : js.npm.express.Router;
}
