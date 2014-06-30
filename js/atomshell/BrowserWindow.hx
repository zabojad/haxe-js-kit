package js.atomshell;
import js.node.events.EventEmitter;

/**
* @author AS3Boyan
 */
@:enum
abstract NodeIntegration(String) to String
{
    var ALL = "all";
    var EXCEPT_IFRAME = "except-iframe";
    var MANUAL_ENABLE_IFRAME = "manual-enable-iframe";
}

class BrowserWindowWebPreferences
{
	public var javascript:Bool;
	public var images:Bool;
	public var java:Bool;
	public var webgl:Bool;
	public var webaudio:Bool;
	public var plugins:Bool;
	
	public var webSecurity(never, set):Bool;
	public var textAreasAreResizable(never, set):Bool;
	public var acceleratedCompositing(never, set):Bool;
	public var extraPluginDirs(never, set):Array<String>;
	
	function set_webSecurity(value:Bool)
	{
		return untyped this["web-security"] = value;
	}
	
	function set_textAreasAreResizable(value:Bool)
	{
		return untyped this["text-areas-are-resizable"] = value;
	}
	
	function set_acceleratedCompositing(value:Bool)
	{
		return untyped this["accelerated-compositing"] = value;
	}
	
	function set_extraPluginDirs(value:Array<String>)
	{
		return untyped this["extra-plugin-dirs"] = value;
	}
}

class BrowserWindowOptions
{
	public var width:Int;
	public var height:Int;
	public var x:Int;
	public var y:Int;
	public var center:Bool;
	public var resizable:Bool;
	public var fullscreen:Bool;
	public var kiosk:Bool;
	public var title:String;
	public var icon:String;
	public var show:Bool;
	public var frame:Bool;
	
	public var skipTaskbar(never, set):Bool;
	public var zoomFactor(never, set):Float;
	public var alwaysOnTop(never, set):Bool;
	public var useContentSize(never, set):Bool;
	public var minWidth(never, set):Int;
	public var minHeight(never, set):Int;
	public var maxWidth(never, set):Int;
	public var maxHeight(never, set):Int;
	public var nodeIntegration(never, set):NodeIntegration;
	public var acceptFirstMouse(never, set):Bool;
	public var webPreferences(get, set):BrowserWindowWebPreferences;
	
	function set_skipTaskbar(value:Bool)
	{
		return untyped this["skip-taskbar"] = value;
	}

	function set_zoomFactor(value:Float)
	{
		return untyped this["zoom-factor"] = value;
	}

	function set_alwaysOnTop(value:Bool)
	{
		return untyped this["always-on-top"] = value;
	}

	function set_useContentSize(value:Bool)
	{
		return untyped this["use-content-size"] = value;
	}

	function set_minWidth(value:Int)
	{
		return untyped this["min-width"] = value;
	}

	function set_minHeight(value:Int)
	{
		return untyped this["min-height"] = value;
	}

	function set_maxWidth(value:Int)
	{
		return untyped this["max-width"] = value;
	}

	function set_maxHeight(value:Int)
	{
		return untyped this["max-height"] = value;
	}

	function set_nodeIntegration(value:NodeIntegration)
	{
		return untyped this["node-integration"] = value;
	}

	function set_acceptFirstMouse(value:Bool)
	{
		return untyped this["accept-first-mouse"] = value;
	}

	function set_webPreferences(value:BrowserWindowWebPreferences)
	{
		return untyped this["web-preferences"] = value;
	}
	
	function get_webPreferences()
	{
		return untyped this["web-preferences"];
	}
	
	public function new()
	{
		
	}
}

extern class BrowserWindow implements npm.Package.Require<"browser-window","*"> extends EventEmitter
{
	public var webContents:WebContents;
	public var devToolsWebContents:Dynamic;
	public var id:Int;
	
	function new(options:BrowserWindowOptions);
	function loadUrl(path:String):Void;
	function destroy():Void;
	function close():Void;
	function focus():Void;
	function isFocused():Bool;
	function show():Void;
	function hide():Void;
	function isVisible():Bool;
	function maximize():Void;
	function unmaximize():Void;
	function minimize():Void;
	function restore():Void;
	function setFullScreen(flag:Bool):Void;
	function isFullScreen():Bool;
	function setSize(width:Int, height:Int):Void;
	function getSize():Array<Int>;
	function setContentSize(width:Int, height:Int):Void;
	function getContentSize():Array<Int>;
	function setMinimumSize(width:Int, height:Int):Void;
	function getMinimumSize():Array<Int>;
	function setMaximumSize(width:Int, height:Int):Void;
	function getMaximumSize():Array<Int>;
	function setResizable(resizable:Bool):Void;
	function isResizable():Bool;
	function setAlwaysOnTop(flag:Bool):Void;
	function isAlwaysOnTop():Bool;
	function center():Void;
	function setPosition(x:Int, y:Int):Void;
	function getPosition():Array<Int>;
	function setTitle(title:String):Void;
	function getTitle():String;
	function flashFrame():Void;
	function setSkipTaskbar(skip:Bool):Void;
	function setKiosk(flag:Bool):Void;
	function isKiosk():Bool;
	/* OS X Only */
	function setRepresentedFilename(filename:String):Void;
	/* OS X Only */
	function setDocumentEdited(edited:Bool):Void;
	function openDevTools():Void;
	function closeDevTools():Void;
	function inspectElement(x:Int, y:Int):Void;
	function focusOnWebView():Void;
	function blurWebView():Void;
	function capturePage(?rect:{x:Int, y:Int, width:Int, height:Int}, cb:Dynamic->Void):Void;
	function reload():Void;
	/* Note: This API is not available on OS X. */
	function setMenu(menu:Dynamic):Void;
	function toggleDevTools():Void;
	
	static function getAllBrowserWindows():Array<BrowserWindow>;
	static function getFocusedBrowserWindow():Array<BrowserWindow>;
	static function fromWebContents():BrowserWindow;
	static function fromId(id:Int):BrowserWindow;
}

@:enum 
abstract BrowserWindowEvent(String) to String
{
	var CLOSED = "closed";
	var PAGE_TITLE_UPDATED = "page-title-updated";
	var CLOSE = "close";
	var UNRESPONSIVE = "unresponsive";
	var RESPONSIVE = "responsive";
	var BLUR = "blur";
	var FOCUS = "focus";	
}

extern class WebContents extends EventEmitter
{
	public function loadUrl(url:String):Void;
	public function getUrl():String;
	public function getTitle():String;
	public function isLoading():Bool;
	public function isWaitingForResponse():Bool;
	public function stop():Void;
	public function reload():Void;
	public function reloadIgnoringCache():Void;
	public function canGoBack():Bool;
	public function canGoForward():Bool;
	public function canGoToOffset(offset:Int):Bool;
	public function goBack():Void;
	public function goForward():Void;
	public function goToIndex(index:Int):Void;
	public function goToOffset(offset:Int):Void;
	public function IsCrashed():Bool;
	public function executeJavaScript(code:String):Void;
	public function send(channel:String, ?args:Dynamic):Void;
}

@:enum
abstract WebContentsEvent(String)
{
	var CLOSED = "crashed";
	var DID_FINISH_LOAD = "did-finish-load";
	var DID_FRAME_FINISH_LOAD = "did-frame-finish-load";
	var DID_START_LOADING = "did-start-loading";
	var DID_STOP_LOADING = "did-stop-loading";
}