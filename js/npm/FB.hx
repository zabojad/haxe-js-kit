package js.npm;

extern class FB 
implements npm.Package.Require<"fb","*">
{
	public static function api( url : String , ?method : String, ?options : {}, cb : Dynamic->Void ) : Void;

}