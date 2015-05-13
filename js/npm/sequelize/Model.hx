package js.npm.sequelize;
import atomshell.Package;

typedef DropOptions = {
	?cascade:Bool // postgres only
}

typedef SchemaOptions = {
	?schemaDelimiter:String
}

typedef CreateOptions = {
	?raw:Bool,
	?isNewRecord:Bool,
	?isDirty:Bool,
	?fields:Array<Dynamic>,
	?include:Array<Dynamic>,
	?onDuplicate:String,
	?transaction:Transaction
}

typedef HasOneOptions = {
	hooks:Bool,
	as:Dynamic,
	foreignKey:Dynamic,
	onDelete:String,
	onUpdate:String,
	constrains:Bool
}

typedef BelongsToOptions = {
	hooks:Bool,
	as:Dynamic,
	foreignKey:Dynamic,
	onDelete:String,
	onUpdate:String,
	constrains:Bool
}

typedef HasManyOptions = {
	hooks:Bool,
	through:Dynamic,
	as:String,
	foreignKey:Dynamic,
	scope:Dynamic,
	onDelete:String,
	onUpdate:String,
	constrains:Bool
}

typedef BelongsToManyOptions = {
	hooks:Bool,
	throught:Dynamic,
	as:Dynamic,
	foreignKey:Dynamic,
	scope:Dynamic,
	onDelete:String,
	onUpdate:String,
	constrains:Bool
}


/**
 * Sequelize
 * @author TiagoLr
 */
extern class Model
implements npm.Package.Require<"sequelize","*"> {
	
	
	function hasOne(target:Model, ?options: { } ):Void;
	function belongsTo(target:Model, ?options : { } ):Void;
	function hasMany(target:Model, ?options: { } ):Void;
	function belongsToMany(target:Model, ?options: { } ):Void;
	
	function addHook(hookType:String, cb:Void->Void):Void;

	function removeAttribute(attribute:String):Void;
	function sync(?options:Sequelize.SyncOptions):Promise;
	function drop(?options:DropOptions):Promise;
	function schema(schema:String, ?options:SchemaOptions):Model;
	function create(values: { }, ?options:CreateOptions):Promise; // creates and saves a record
	function bulkCreate(values: { }, ?options:CreateOptions):Promise;
	function build(values: { }, ?options:CreateOptions):Instance; // creates but does not save a record
	function find(?args: { }, opts:{} ):Promise;
	function findOrCreate(?args: { }, opts:{} ):Promise;
	function findAndCountAll(?args: { }, opts:{} ):Promise;
	function findAll(?args: { }, opts:{} ):Promise;
	function count(args: { } ):Promise;
	function max(field:String, args: { } ):Promise;
	function min(field:String, args: { } ):Promise;
	function sum(field:String, args: { } ):Promise;
}