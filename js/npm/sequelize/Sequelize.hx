package js.npm.sequelize;

typedef SequelizeOptions = {
	?dialect:String,
	?dialectModulePath:String,
	?dialectOptions: Dynamic,
	?storage:String,
	?host:String,
	?port:Int,
	?protocol:String,
	?define: { },
	?query: { },
	?set: { },
	?sync: { },
	?timezone:String,
	?logging:Dynamic,
	?omitNull:Bool,
	?native:Bool,
	?replication:Bool,
	?pool: {
		?max:Int,
		?min:Int,
		?idle:Int,
		?validateConnection:Dynamic
	},
	?quoteIdentifiers:Bool
}

typedef SyncOptions = {
	?force:Bool,
	?match:String,
	?logging:Dynamic,
	?schema:String,
}

typedef QueryOptions = {
	raw:Bool,
	transaction:Transaction,
	type:String,
	nest:Bool,
	plain:Bool,
	replacements:Dynamic,
	useMaster:Bool
}

typedef TransactionOptions = {
	?autocommit:Bool,
	?isolationLevel:String
}

typedef ModelOptions = {
	?timestamps:Bool,
	?createdAt:Dynamic,	// bool or string
	?updatedAt:Dynamic,	// bool or string
	?deletedAt:Dynamic,	// bool or string
	?paranoid:Bool,
	?comment:String, // table comment
	?indexes: Array<Index>
}

typedef Index = {
	?unique:Bool,
	?fields:Array<Dynamic>,
	?operator:String,
	?method:String,
}

typedef TypedColumns = Dynamic<Column>;
typedef Column = {
    var type:String;
	@:optional var field:String;
	@:optional var defaultValue:Dynamic;
	@:optional var allowNull:Bool;
    @:optional var unique:Bool;
	@:optional var primaryKey:Bool;
	@:optional var autoIncrement:Bool;
	@:optional var comment:String;
	@:optional var get:Void->Dynamic;
	@:optional var set:Dynamic->Void;
}


/**
 * Sequelize
 * @author TiagoLr
 */
extern class Sequelize
implements npm.Package.Require<"sequelize","*"> {
	function new(?database:String, ?username:String, ?password:String, ?options: SequelizeOptions );
	function define(tableName:String, columns:TypedColumns, ?options:ModelOptions):Model;
	function sync(?options:SyncOptions):Promise;
	function query(sql:String, ?instanceOrModel:Dynamic, ?options: QueryOptions ):Promise;
	function set(variables:Dynamic, options: { } ):Promise;
	function escape(value:String):String;
	
	// postgres only
	function createSchema(schema:Dynamic):Promise; 
	function showAllSchemas():Promise; 
	function dropAllSchemas():Promise;
	//
	
	function drop(options: { } ):Promise;
	function authenticate():Promise;
	function transaction(f:Transaction->Void, ?options: TransactionOptions ):Promise;
	
	
}
