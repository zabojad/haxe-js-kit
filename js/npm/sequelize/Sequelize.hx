package js.npm.sequelize;
import atomshell.Package;
import haxe.Constraints.Function;

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
	?indexes: Array<Index>,
	?engine:String,
	?defaultScope:{ },
	?scopes: { },
}

typedef Index = {
	?unique:Bool,
	?fields:Array<Dynamic>,
	?operator:String,
	?method:String,
}

typedef ModelFields = Dynamic<Column>;
typedef Column = {
    type:String,
	?field:String,
	?defaultValue:Dynamic,
	?allowNull:Bool,
    ?unique:Bool,
	?primaryKey:Bool,
	?autoIncrement:Bool,
	?comment:String,
	?get:Void->Dynamic,
	?set:Dynamic->Void,
	?validation:{},
	?states: {
		type:String,
		values:Array<String>
	},
}


/**
 * Sequelize
 * @author TiagoLr
 */
extern class Sequelize
implements npm.Package.Require < "sequelize", "*" > {
	
	// DATATYPES
	static var STRING:String;		
	static var CHAR:String;          
	static var TEXT:String;  		
	static var INTEGER:String;  	
	static var BIGINT:String;   		
	static var FLOAT:String;  	
	static var DECIMAL:String;	
	static var BOOLEAN:String; 		
	static var TIME:String;
	static var DATE:String;    
	static var DATEONLY:String;
	static var HSTORE:String;
	static var JSON:String; 		
	static var JSONB:String;
	static var NOW:String;
	static var BLOB:String;
	static var RANGE:String;
	static var UUID:String;
	static var UUIDV1:String;
	static var UUIDV4:String;
	static var VIRTUAL:String;
	static var ENUM:String; 		
	static var ARRAY:String;		
	
	function new(?database:String, ?username:String, ?password:String, ?options: SequelizeOptions );
	function define(tableName:String, fields:ModelFields, ?options:ModelOptions):Model;
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
