package js.atomshell;

/**
 * @author AS3Boyan
 * MIT
 */
/* Mac only */
extern class AutoUpdater implements npm.Package.Require<"auto-updater","*">
{
	static function setFeedUrl(url:String):Void;
	static function checkForUpdates():Void;
}

class AutoUpdaterC
{
	inline public static var CHECKING_FOR_UPDATE:String = "checking-for-update";
	inline public static var CHECKING_FOR_UPDATE:String = "update-available";
	inline public static var CHECKING_FOR_UPDATE:String = "update-not-available";
	inline public static var CHECKING_FOR_UPDATE:String = "update-downloaded";
}