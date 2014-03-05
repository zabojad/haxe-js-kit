package js.npm;

extern class Express 
extends js.npm.express.Application #if !haxe3,#end 
implements npm.Package.Require<"express","~3.0"> {

	public function new() : Void;
	
}
