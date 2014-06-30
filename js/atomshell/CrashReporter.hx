package js.atomshell;

/**
* @author AS3Boyan
 */
typedef CrashReporterOptions = 
{
	?productName:String,
	?companyName:String,
	?submitUrl:String,
	?autoSubmit:Bool,
	?ignoreSystemCrashHandler:Bool,
	?extra:Dynamic
}

class CrashReporter implements npm.Package.Require<"crash-reporter","*">
{
	static function start(?options:CrashReporterOptions):Void;
}