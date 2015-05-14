package js.npm;
import js.node.events.IEventEmitter;
import js.node.stream.Readable;

extern class Carrier
implements npm.Package.Require<"carrier", "^0.1.14">
{
	@:overload(function carry(reader : IReadable) : IEventEmitter {})
	@:overload(function carry(reader : IReadable, listener : String -> Void) : IEventEmitter {})
	@:overload(function carry(reader : IReadable, listener : String -> Void, encoding : String) : IEventEmitter {})
	public static function carry(reader : IReadable, listener : String -> Void, encoding : String, separator : String) : IEventEmitter;
}
