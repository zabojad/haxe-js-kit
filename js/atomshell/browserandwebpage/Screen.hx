package js.atomshell.browserandwebpage;

/**
 * @author AS3Boyan
 * MIT

 */
extern class Screen implements npm.Package.Require<"screen","*">
{
	static function getCursorScreenPoint():Dynamic;
	static function getPrimaryDisplay():Dynamic;
}