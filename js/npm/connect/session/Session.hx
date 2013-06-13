package js.npm.connect.session;

import js.node.http.ClientRequest;

extern class Session 
implements Dynamic {
	public var cookie : Cookie;
	public var maxAge : Int;

	public function new( req : ClientRequest ) : Void;
	public function regenerate(?cb:js.Node.NodeError->Void) : Void;
	public function destroy(?cb:js.Node.NodeError->Void) : Void;
	public function reload(?cb:js.Node.NodeError->Void) : Void;
	public function save(?cb:js.Node.NodeError->Void) : Void;
	public function touch() : Void;

}