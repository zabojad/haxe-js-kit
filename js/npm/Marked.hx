package js.npm;

typedef MarkedOptions = {
	? highlight : String -> ? String -> ? js.support.Callback<String> -> Void,
	? renderer : Dynamic,
	? gfm : Bool,
	? tables : Bool,
	? breaks : Bool,
	? pedantic : Bool,
	? sanitize : Bool,
	? smartLists : Bool,
	? smartypants : Bool
}

/**
Extern for [Marked](https://github.com/chjj/marked)
**/
@:jsRequire("marked")
extern class Marked {

	@:selfCall
	@:overload(function (markdownString : String) : String {})
	@:overload(function (markdownString : String, callback : js.support.Callback<String>) : Void {})
	@:overload(function (markdownString : String, options : MarkedOptions) : String {})
	public static function parse(markdownString : String, options : MarkedOptions, callback : js.support.Callback<String>) : Void;
}
