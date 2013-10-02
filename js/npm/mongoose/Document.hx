package js.npm.mongoose;

import js.support.Callback;
import js.support.Error;

extern class Document<S:Schema>
extends js.node.events.EventEmitter #if !haxe3 , #end
implements npm.Package.RequireNamespace<"mongoose","*">
implements Dynamic {
	public static var schema : Schema;
	public var isNew : Bool;
	public var id : Dynamic;
	public var errors : {};

	public function new( doc : {} , fields : {} , skipId : Bool ) : Void;
	public function update( doc : {} , options : {} , fn : Callback<Void> ) : Void;
	@:overload( function( values : {} , ?options : {} ) : Document<S> {} )
	public function set( path : String , val : Dynamic , ?type : Dynamic , ?options : {} ) : Document<S>;

	public function get( path : String , ?type : Dynamic ) : Dynamic;
	public function markModified( path : String ) : Void;
	public function modifiedPaths() : Array<String>;
	public function isModified( ?path : String ) : Bool;
	public function isDirectModified( path : String ) : Bool;
	public function isInit( path : String ) : Bool;
	public function isSelected( path : String ) : Bool;
	public function validate( cb : Callback<Void> ) : Void;
	public function invalidate( path : String , err : Error , val : Dynamic ) : Void;
}