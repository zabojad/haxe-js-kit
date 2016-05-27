package js.npm;

/**
Extern for [Validator](https://github.com/chriso/validator.js)
**/
@:jsRequire('validator')
extern class Validator {
	// Validators
	static public function contains(str : String, seed : String) : Bool;
	static public function equals(str : String, comparison : String) : Bool;
	static public function isAfter(str : String, ? date : Dynamic) : Bool;
	static public function isAlpha(str : String, ? locale : String) : Bool;
	static public function isAlphanumeric(str : String, ? locale : String) : Bool;
	static public function isAscii(str : String) : Bool;
	static public function isBase64(str : String) : Bool;
	static public function isBefore(str : String, ? date : Dynamic) : Bool;
	static public function isBoolean(str : String) : Bool;
	static public function isByteLength(str : String, options : Dynamic) : Bool;
	static public function isCreditCard(str : String) : Bool;
	static public function isCurrency(str : String, options : Dynamic) : Bool;
	static public function isDataURI(str : String) : Bool;
	static public function isDate(str : String) : Bool;
	static public function isDecimal(str : String) : Bool;
	static public function isDivisibleBy(str : String, number : Int) : Bool;
	static public function isEmail(str : String , ? options : Dynamic) : Bool;
	static public function isFQDN(str : String , ? options : Dynamic) : Bool;
	static public function isFloat(str : String , ? options : Dynamic) : Bool;
	static public function isFullWidth(str : String) : Bool;
	static public function isHalfWidth(str : String) : Bool;
	static public function isHexColor(str : String) : Bool;
	static public function isHexadecimal(str : String) : Bool;
	static public function isIP(str : String, ? version : String) : Bool;
	static public function isISBN(str : String, ? version : String) : Bool;
	static public function isISIN(str : String) : Bool;
	static public function isISO8601(str : String) : Bool;
	static public function isIn(str : String, values : Array<String>) : Bool;
	static public function isInt(str : String , ? options : Dynamic) : Bool;
	static public function isJSON(str : String) : Bool;
	static public function isLength(str : String, options : Dynamic) : Bool;
	static public function isLowercase(str : String) : Bool;
	static public function isMACAddress(str : String) : Bool;
	static public function isMobilePhone(str : String, locale : String) : Bool;
	static public function isMongoId(str : String) : Bool;
	static public function isMultibyte(str : String) : Bool;
	static public function isNull(str : String) : Bool;
	static public function isNumeric(str : String) : Bool;
	static public function isSurrogatePair(str : String) : Bool;
	static public function isURL(str : String , ? options : Dynamic) : Bool;
	static public function isUUID(str : String, ? version : String) : Bool;
	static public function isUppercase(str : String) : Bool;
	static public function isVariableWidth(str : String) : Bool;
	static public function isWhitelisted(str : String, chars : Array<String>) : Bool;
	static public function matches(str : String, pattern : String, ? modifiers : Dynamic) : Bool;
	// Sanitizers
	// TODO
}
