package js.npm;

import js.node.Buffer;

extern class Steno
implements npm.Package.RequireNamespace<"steno","^0.3.2"> {
	public static inline function construct(fileName : String) : Steno {
		return untyped require('steno')(fileName);
	}

	@:overload(function(data : String) : Steno {})
	@:overload(function(data : Buffer) : Steno {})
	@:overload(function(data : Buffer, cb : Null<Dynamic> -> Void) : Steno {})
	public function write(data : String, cb : Null<Dynamic> -> Void) : Steno;

	@:overload(function(cb : Null<Dynamic> -> Buffer -> (Void -> Void) -> Void) : Steno {})
	public function setCallback(cb : Null<Dynamic> -> String -> (Void -> Void) -> Void) : Steno;
}
