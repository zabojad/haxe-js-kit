package js.atomshell;

/**
 * @author AS3Boyan
 * MIT

 */
typedef DialogOptions = 
{
	?title:String,
	?defaultPath:String,
	/* openFile, openDirectory, multiSelections and createDirectory */
	?properties:Array<String>
}

class Dialog implements npm.Package.Require<"dialog","*">
{
	static function showOpenDialog(?browserBrowserWindow:BrowserWindow, options:DialogOptions, ?cb:Null<Array<String>>->Void):Null<Array<String>>;
	
	static function showSaveDialog(?browserBrowserWindow:BrowserWindow, options:{ ?title:String, ?defaultPath:String }, ?cb:Null<String>->Void):Null<String>;
	
	static function showMessageBox(?browserBrowserWindow:BrowserWindow, options:{ ?type:String, ?buttons:Array<String>, ?title:String, ?message:String, ?detail:String }, ?cb:Null<Dynamic>->Void):Null<Dynamic>;
}