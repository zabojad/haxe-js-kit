package js.npm.express;

extern class Application 
extends js.npm.Connect {

	@:overload(function(path : EReg, f : Request ->  Response -> Void) : Void {} )
	function get(path : String, f : Request ->  Response -> Void) : Void;
	function post(path : String, f : Request ->  Response -> Void) : Void;
	
}