package js.npm.connect.session;

import js.support.Callback;
import js.node.http.ClientRequest;

extern class Session 
implements Dynamic {
	public var cookie : Cookie;
	public var maxAge : Int;

	public function new( req : ClientRequest ) : Void;
	public function regenerate(?cb:Callback<Void> ) : Void;
	public function destroy(?cb:Callback<Void> ) : Void;
	public function reload(?cb:Callback<Void> ) : Void;
	public function save(?cb:Callback<Void> ) : Void;
	public function touch() : Void;

}