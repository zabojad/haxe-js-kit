package js.npm;

extern class Minimist implements Dynamic
implements npm.Package.Require<"minimist", "^1.1.1">
{
	@:overload(function(args : Array<String>) : Minimist {})
	public static inline function parseArgs(args : Array<String>, opts : {}) : Minimist {
		untyped return Minimist(args, opts || {});
	}

	@:overload(function() : Minimist {})
	public static inline function parseNodeArgs(opts : {}) : Minimist {
		untyped return Minimist(Node.process.argv.slice(2), opts || {});
	}

	public static inline function argsWithoutOptions(m : Minimist) : Array<String> {
		untyped return m._;
	}
}
