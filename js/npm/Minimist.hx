package js.npm;

import js.support.Either;

typedef Options = {
	// a string or array of strings argument names to always treat as strings
	?string : Array<String>,

	// a boolean, string or array of strings to always treat as booleans. if true will treat all double hyphenated arguments without equal signs as boolean (e.g. affects --foo, not -f or --foo=bar)
	?boolean : Array<String>,

	// an object mapping string names to strings or arrays of string argument names to use as aliases
	?alias : Dynamic,

	// an object mapping string argument names to default values
	//?'default' : Dynamic,

	// when true, populate argv._ with everything after the first non-option
	?stopEarly : Bool,

	// when true, populate argv._ with everything before the -- and argv['--'] with everything after the --. Here's an example:
	//?'--' : Bool,

	// a function which is invoked with a command line parameter not defined in the opts configuration object. If the function returns false, the unknown option is not added to argv.
	?unknown : String -> Bool
}

extern class Minimist implements Dynamic
implements npm.Package.Require<"minimist", "^1.1.1">
{
	@:overload(function(args : Array<String>) : Minimist {})
	@:overload(function(args : Array<String>, opts : {}) : Minimist {})
	public static inline function parseArgs(args : Array<String>, opts : Options) : Minimist {
		untyped return require('minimist')(args, opts || {});
	}

	@:overload(function() : Minimist {})
	@:overload(function(opts : {}) : Minimist {})
	public static inline function parseNodeArgs(opts : Options) : Minimist {
		untyped return require('minimist')(Node.process.argv.slice(2), opts || {});
	}

	public static inline function argsWithoutOptions(m : Minimist) : Array<String> {
		untyped return m._;
	}
}
