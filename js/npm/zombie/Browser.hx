package js.npm.zombie;

import js.html.HTMLDocument;
import js.html.Location;
import js.html.NodeList;
import js.node.events.EventEmitter;
import js.html.XPathResult;
import js.html.Node;
#if (haxe_ver >= 3.2)
import js.html.DOMElement in Element;
#else
import js.html.Element;
#end
import js.support.Either;

extern class Browser extends EventEmitter
{
	public function new(?options : Dynamic) : Void;

	public var error(default, null) : Error;
	public var location(default, default) : Location;
	public var url(default, null) : String;
	public var document(default, null) : HTMLDocument;
	public var body(default, null) : Element;
	public var cookies : Dynamic;
	public var features : String;
	public var maxRedirects : Int;
	public var proxy : String;
	public var silent : Bool;
	public var site : String;
	public var strictSSL : Bool;
	public var localAddress : String;
	public var userAgent : String;
	public var language : String;
	public var waitDuration : Either<String, Int>;
	public var runScripts : Bool;

	public function debug() : Void;
	public function dump() : Void;
	public function destroy() : Void;

	public function getCookie(identifier : Either<String, {}>, ?allProperties : Bool) : Either<String, {}>;
	public function deleteCookie(identifier : Either<String, {}>) : Bool;
	public function deleteCookies() : Void;
	public function loadCookies(serialized : String) : Void;
	public function saveCookies() : String;
	public function setCookie(nameOrOptions : Either<String, {}>, ?value : String) : Void;

	public function attach(selector : String, filename : String) : Browser;
	public function button<T : Element>(selector : String) : Null<T>;
	public function click<T, T2>(selector : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function clickLink<T, T2>(selector : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function check(selector : String) : Browser;
	public function choose(selector : String) : Browser;
	public function evaluate<T>(code : String, ?filename : String) : T;
	public function field<T : Element>(selector : String) : Null<T>;
	public function fire<T, T2>(selector : String, eventName : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function focus(selector : String) : Element;
	public function fill(selector : String, value : String) : Browser;
	public function html(?selector : String, ?context : Node) : String;
	public function load<T, T2>(html : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function link(selector : String) : Element;
	public function saveHistory() : String;
	public function loadHistory(history : String) : Void;
	public function pressButton<T, T2>(selector : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function queryAll<T : Node>(selector : String, ?context : Node) : Array<T>;
	public function query<T : Node>(selector : String, ?context : Node) : T;
	public function querySelector<T : Node>(selector : String) : Null<T>;
	public function querySelectorAll(selector : String) : NodeList;
	public function select(selector : String, value : String) : Browser;
	public function selectOption(option : String) : Browser;
	public function text(selector : String, ?context : Node) : String;
	public function uncheck(selector : String) : Browser;
	public function unselect(selector : String, value : String) : Browser;
	public function unselectOption(option : String) : Browser;
	@:overload(function<T, T2>(url : String, options : {}, ?callback : Void -> Void) : Null<Promise<T, T2>> {})
	public function visit<T, T2>(url : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	@:overload(function<T, T2>(options : {}, ?callback : Void -> Void) : Null<Promise<T, T2>> {})
	public function wait<T, T2>(?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function xpath(expression : String, ?context : Node) : XPathResult;
}
