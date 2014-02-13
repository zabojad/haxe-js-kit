package js.browser;

typedef FacebookLoginOptions = {
	?scope : String,
	?enable_profile_selector : Bool,
	?profile_selector_ids : String
}

@:native('FB')
extern class Facebook {
	public static function login( cb : Dynamic->Void , opts : FacebookLoginOptions ) : Void;
}