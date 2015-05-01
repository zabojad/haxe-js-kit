package js.npm.csv;

import js.Error;
import js.node.stream.Transform;

extern class Parse
extends Transform
implements npm.Package.Require<"csv-parse", "^0.1.0">
{
	@:overload(function (options : {}) : Void {})
	@:overload(function (input : String, callback : Error -> Array<Array<String>> -> Void) : Void {})
	public function new(input : String, options : {}, callback : Error -> Array<Array<String>> -> Void) : Void;
}
