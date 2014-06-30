package js.npm;
import js.node.fs.Stats;

/**
 * ...
 * @author AS3Boyan
 */
 
typedef Listeners =
{
	@:optional var log:String->Void;
	@:optional var error:Dynamic->Void;
	@:optional var watching:Dynamic->Dynamic->Bool->Void;
	@:optional var change:String->String->Stats->Stats->Void;
}
 
typedef Config =
{
	@:optional var path:String;
	@:optional var paths:Array<String>;
	@:optional var listener:Dynamic;
	@:optional var listeners:Dynamic;
	@:optional var next:Dynamic;
	@:optional var stat:Dynamic;
	@:optional var interval:Int;
	@:optional var persistent:Bool;
	@:optional var catchupDelay:Int;
	@:optional var preferredMethods:Array<String>;
	@:optional var followLinks:Bool;
	@:optional var ignorePaths:Bool;
	@:optional var ignoreHiddenFiles:Bool;
	@:optional var ignoreCommonPatterns:Bool;
	@:optional var ignoreCustomPatterns:Dynamic;
}

extern class Watchr implements npm.Package.Require<"watchr","*">
{
	static function watch(config:Config):Dynamic;	
}