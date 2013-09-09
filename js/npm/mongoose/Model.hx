package js.npm.mongoose;

import js.support.Callback;

extern class Model<S:Schema>
extends Document<S>
implements npm.Package.RequireNamespace<"mongoose","*"> 
{
	public var db : Connection;
	public var collection : Dynamic;//Collection;
	public var modelName : String;
	
	public function save( fn : Callback<Model<S>> ) : Void;
	public function increment() : Model<S>;
	public function remove( ?fn : Callback<Model<S>> ) : Model<S>;

	public function model<M:Model<S>>( name : String ) : Models<M>;
	
}

extern class Models<M:Model<Dynamic>> {
	public var db : Connection;
	public var collection : Dynamic;//Collection;
	public var modelName : String;
	public var schema : Schema;
	public var base : Mongoose;

	public function ensureIndexes( ?fn : Callback<Void> ) : Void;
	public function remove( conditions : {} , callback : Callback<Void> ) : Void;

	@:overload( function ( conditions : {} , fields : String , options : {} , ?callback : Callback<Array<M>> ): Query<Array<M>> {} )
	@:overload( function ( conditions : {} , fields : Null<{}> , options : {} , ?callback : Callback<Array<M>> ): Query<Array<M>> {} )
	public function find( ?conditions : {} , ?callback : Callback<Array<M>> ): Query<Array<M>>; // Query<M>

	@:overload( function ( id : Dynamic , fields : String , options : {} , ?callback : Callback<Null<M>> ): Query<M> {} )
	@:overload( function ( id : Dynamic , fields : Null<{}> , options : {} , ?callback : Callback<Null<M>> ): Query<M> {} )
	public function findById( id : Dynamic , ?callback : Callback<Null<M>> ): Query<M>; // Query<M>

	@:overload( function( conditions : {} , callback : Callback<Null<M>> ) : Void {} )
	@:overload( function ( conditions : {}  , fields : String , options : {} , ?callback : Callback<Null<M>> ): Query<M> {} )
	@:overload( function ( conditions : {} , fields : Null<{}> , options : {} , ?callback : Callback<Null<M>> ): Query<M> {} )
	public function findOne( ?conditions : {} ): Query<M>; // Query<M>

	@:overload( function ( conditions : {} , ?callback : Callback<Int> ): Query<M> {} )// Query<M>
	public function count( callback : Callback<Int> ): Query<M>; // Query<M>

	@:overload( function ( field : String ): Query<M> {} )// Query<M>
	@:overload( function ( field : String , conditions : {} , callback : Callback<Array<M>> ): Query<M> {} )// Query<M>
	@:overload( function ( field : String , conditions : {} ): Query<M> {} )// Query<M>
	public function distinct( field : String , callback : Callback<Array<M>> ): Query<M>; // Query<M>

	public function where( field : String , ?val : Dynamic ) : Query<Array<M>>;

	@:overload( function( conditions : Void->Bool ) : Query<Array<M>> {} )
	public inline function _where( conditions : String ) : Query<Array<M>> return untyped this["$where"](conditions);

	@:overload( function( ) : Query<M> {} )
	@:overload( function( conditions : {} , update : {} , options : {} , callback : Callback<Null<M>> ) : Query<M> {} )
	@:overload( function( conditions : {} , update : {} , options : {} ) : Query<M> {} )
	@:overload( function( conditions : {} , update : {} ) : Query<M> {} )
	public function findOneAndUpdate( conditions : {} , update : {} , callback : Callback<Null<M>> ) : Query<M>;

	@:overload( function( ) : Query<M> {} )
	@:overload( function( id : Dynamic , update : {} , options : {} , callback : Callback<Null<M>> ) : Query<M> {} )
	@:overload( function( id : Dynamic , update : {} , options : {} ) : Query<M> {} )
	@:overload( function( id : Dynamic , update : {} ) : Query<M> {} )
	public function findByIdAndUpdate( id : Dynamic , update : {} , callback : Callback<Null<M>> ) : Query<M>;

	@:overload( function( conditions : {} , options : {} , callback : Callback<Null<M>> ) : Query<M> {} )
	@:overload( function( conditions : {} , options : {} ) : Query<M> {} )
	@:overload( function( ?conditions : {} ) : Query<M> {} )
	public function findOneAndRemove( conditions : {} , callback : Callback<Null<M>> ) : Query<M>;

	@:overload( function( id : Dynamic , options : {} , callback : Callback<Null<M>> ) : Query<M> {} )
	@:overload( function( id : Dynamic , options : {} ) : Query<M> {} )
	@:overload( function( ?id : Dynamic ) : Query<M> {} )
	public function findByIdAndRemove( id : Dynamic , callback : Callback<Null<M>> ) : Query<M>;

    @:overload( function( doc : {} , fn : Callback<M> ) : Void {} )
	public function create( doc:Array<{}> , fn : Callback<Array<M>> /* TODO : maybe there's a solution for multiple arguments... */  ) : Void;

	@:overload( function( conditions : {} , update : {} , options : {} , callback : Callback<Array<M>> ) : Query<Array<M>> {} )
	@:overload( function( conditions : {} , update : {} , options : {} ) : Query<Array<M>> {} )
	@:overload( function( conditions : {} , update : {} ) : Query<Array<M>> {} )
	public function update( conditions : {} , update : {} , callback : Callback<Array<M>> ) : Query<Array<M>>;

	public function mapReduce( o : ModelMapReduce , callback : Callback2<Array<M>,{}> ) : Void;

	@:overload( function( commands : {} , options : {} , callback : Callback<{}> ) : Void {} )
	public function aggregate( commands : {} , callback : Callback<{}> ) : Void;

	@:overload(function( doc : {} , options : {} , cb : Callback<M> ) : Void {} )
	public function populate( docs : Array<{}> , options : {} , cb : Callback<Array<M>> ) : Void;

}

typedef ModelMapReduce = {
	map : Void->Void,
	reduce : String->Array<Dynamic>->Void,
	?query : {},
	?limit : Int,
	?keeptemp : Bool,
	?finalize : Void->Void,
	?scope : {},
	?jsMode : Bool,
	?verbose : Bool,
	?out : {}
}
