package js.native;

@:native("RegExp")
extern class RegExp {
	public function new( pattern : String , flags : String ) : Void;
}