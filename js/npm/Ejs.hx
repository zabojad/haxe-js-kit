package js.npm;

typedef EjsTemplate = {} -> String;
typedef EjsOptions = {
	?cache : Bool,
	?filename : String,
	?scope : Dynamic,
	?debug : Bool,
	?compileDebug : Bool,
	?client : Bool,
	?open : String,
	?close : String
}

extern class Ejs
implements npm.Package.Require<"ejs","*">
{
	public static function compile(str:String,opts:EjsOptions) : EjsTemplate;
	public function render(str:String,opts:EjsOptions) : String;
}