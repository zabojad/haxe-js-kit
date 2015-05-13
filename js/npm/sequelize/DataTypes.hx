package js.npm.sequelize;


/**
 * DataTypes
 * @author TiagoLr
 */
@:native('DataTypes')
extern class DataTypes {
	// TODO - Add support for parameters
	
	
	/**
	 * A variable length string. Default length 255. 
	 * Available properties: `BINARY`
	 */
	static var STRING:String;		
	/**
	 * A fixed length string. Default length 255. 
	 * Available properties: `BINARY`
	 */
	static  var CHAR:String;          
	/**
	 * An unlimited length text column
	 */
	static  var TEXT:String;  		
	/**
	 * A 32 bit integer. 
	 * Available properties: `UNSIGNED`, `ZEROFILL`
	 */
	static  var INTEGER:Int;  	
	/**
	 * A 64 bit integer. 
	 * Available properties: `UNSIGNED`, `ZEROFILL`
	 */
	static  var BIGINT:Int;   		
	/**
	 * Floating point number. 
	 * Accepts one or two arguments for precision.
	 * Available properties: `UNSIGNED`, `ZEROFILL`
	 */
	static  var FLOAT:Float;  	
	/**
	 * Decimal number. 
	 * Accepts one or two arguments for precision. 
	 * Available properties: `UNSIGNED`, `ZEROFILL`
	 */
	static  var DECIMAL:Float;	
	/**
	 * A boolean / tinyint column, depending on dialect
	 */
	static  var BOOLEAN:Bool; 		
	/**
	 * A time column
	 */
	static  var TIME:Dynamic;
	/**
	 * A datetime column
	 */
	static  var DATE:Date;    
	/**
	 * A date only column
	 */
	static  var DATEONLY:Dynamic;
	/**
	 * A key / value column. Only available in postgres.
	 */
	static  var HSTORE:Dynamic;
	/**
	 * A JSON string column. Only available in postgres.
	 */
	static  var JSON:Dynamic; 		
	/**
	 * A pre-processed JSON data column. Only available in postgres.
	 */
	static  var JSONB:Dynamic;
	/**
	 * A default value of the current timestamp
	 */
	static  var NOW:Dynamic;
	/**
	 * Binary storage. Available lengths: `tiny`, `medium`, `long`
	 */
	static  var BLOB:Dynamic;
	/**
	* Range types are data types representing a range of values of some element type (called the range's subtype).
	* Only available in postgres.
	* See {@link http://www.postgresql.org/docs/9.4/static/rangetypes.html|Postgres documentation} for more details
	*/
	static  var RANGE:Dynamic;
	/**
	 * A column storing a unique univeral identifier. Use with `UUIDV1` or `UUIDV4` for default values.
	 */
	static  var UUID:Dynamic;
	/**
	 * A default unique universal identifier generated following the UUID v1 standard
	 */
	static  var UUIDV1:Dynamic;
	/**
	 * A default unique universal identifier generated following the UUID v2 standard
	 */
	static  var UUIDV4:Dynamic;
	/**
	 * A virtual value that is not stored in the DB. This could for example be useful if you want to provide a default value in your model that is returned to the user but not stored in the DB.
	 */
	static  var VIRTUAL:Dynamic;
	/**
	 * An enumeration. `DataTypes.ENUM('value', 'another value')`.
	 */
	static  var ENUM:Dynamic; 		
	/**
	 * An array of `type`, e.g. `DataTypes.ARRAY(DataTypes.DECIMAL)`. Only available in postgres.
	 */
	static  var ARRAY:Dynamic;		
	
}