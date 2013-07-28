package js.npm.mongoose;

extern class Document
extends js.node.events.EventEmitter #if !haxe3 , #end
implements npm.Package.RequireNamespace<"mongoose","*"> {
	public function new( doc : {} , fields : {} , skipId : Bool ) : Void;
}