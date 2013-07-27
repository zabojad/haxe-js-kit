package js.native;

@:native("Error")
extern class Error {
	public var message : String;
	public var stack : String;
	public function new( msg: String ) : Void;

}