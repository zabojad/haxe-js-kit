package js.npm;

import js.html.Element;

extern class Cheerio
implements npm.Package.Require<"cheerio", "^0.19.0">
{
	public static function load(html : String, ?options : {}) : String -> ?Dynamic -> ?String -> Cheerio;

	public function text() : String;
	public function html() : String;

	@:overload(function(name : String) : String {})
	public function attr(name : String, value : String) : Cheerio;

	public function removeAttr(name : String) : Cheerio;
	public function hasClass(className : String) : Bool;

	@:overload(function(func : Int -> String -> String) : Cheerio {})
	public function addClass(className : String) : Cheerio;

	@:overload(function(func : Int -> String -> String) : Cheerio {})
	public function removeClass(className : String) : Cheerio;

	public function find(selector : String) : Cheerio;
	public function parent() : Cheerio;
	public function next() : Cheerio;
	public function prev() : Cheerio;
	public function siblings() : Cheerio;
	public function children(selector : String) : Cheerio;
	public function each(func : Int -> ?Cheerio -> Bool) : Cheerio;
	public function map<T>(func : Int -> ?Cheerio -> T) : Array<T>;
	
	@:overload(function(selector : String) : Cheerio {})
	public function filter(func : ?Int -> Bool) : Cheerio;
	
	public function first() : Cheerio;
	public function last() : Cheerio;
	public function eq(i : Int) : Cheerio;
}
