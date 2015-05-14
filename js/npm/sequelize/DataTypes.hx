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
	static  var INTEGER:String;  	
	/**
	 * A 64 bit integer. 
	 * Available properties: `UNSIGNED`, `ZEROFILL`
	 */
	static  var BIGINT:String;   		
	/**
	 * Floating point number. 
	 * Accepts one or two arguments for precision.
	 * Available properties: `UNSIGNED`, `ZEROFILL`
	 */
	static  var FLOAT:String;  	
	/**
	 * Decimal number. 
	 * Accepts one or two arguments for precision. 
	 * Available properties: `UNSIGNED`, `ZEROFILL`
	 */
	static  var DECIMAL:String;	
	/**
	 * A boolean / tinyint column, depending on dialect
	 */
	static  var BOOLEAN:String; 		
	/**
	 * A time column
	 */
	static  var TIME:String;
	/**
	 * A datetime column
	 */
	static  var DATE:String;    
	/**
	 * A date only column
	 */
	static  var DATEONLY:String;
	/**
	 * A key / value column. Only available in postgres.
	 */
	static  var HSTORE:String;
	/**
	 * A JSON string column. Only available in postgres.
	 */
	static  var JSON:String; 		
	/**
	 * A pre-processed JSON data column. Only available in postgres.
	 */
	static  var JSONB:String;
	/**
	 * A default value of the current timestamp
	 */
	static  var NOW:String;
	/**
	 * Binary storage. Available lengths: `tiny`, `medium`, `long`
	 */
	static  var BLOB:String;
	/**
	* Range types are data types representing a range of values of some element type (called the range's subtype).
	* Only available in postgres.
	* See {@link http://www.postgresql.org/docs/9.4/static/rangetypes.html|Postgres documentation} for more details
	*/
	static  var RANGE:String;
	/**
	 * A column storing a unique univeral identifier. Use with `UUIDV1` or `UUIDV4` for default values.
	 */
	static  var UUID:String;
	/**
	 * A default unique universal identifier generated following the UUID v1 standard
	 */
	static  var UUIDV1:String;
	/**
	 * A default unique universal identifier generated following the UUID v2 standard
	 */
	static  var UUIDV4:String;
	/**
	 * A virtual value that is not stored in the DB. This could for example be useful if you want to provide a default value in your model that is returned to the user but not stored in the DB.
	 */
	static  var VIRTUAL:String;
	/**
	 * An enumeration. `DataTypes.ENUM('value', 'another value')`.
	 */
	static  var ENUM:String; 		
	/**
	 * An array of `type`, e.g. `DataTypes.ARRAY(DataTypes.DECIMAL)`. Only available in postgres.
	 */
	static  var ARRAY:String;		
	
}