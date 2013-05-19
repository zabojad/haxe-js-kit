/* Same license as Node.js
   Maintainer: Ritchie Turner, ritchie@async.cl

   Node.js 0.8 api without haXe embellishments so that other apis may be implemented
   on top without being hindered by design choices here.

   Domain not added.
*/

package js;

typedef NodeError = Null<String>;

class Node {  

  public static var console(default,null) : js.node.stdio.Console = untyped __js__('console');
  public static var process(default,null) : js.node.Process = untyped __js__('process');
  public static var module(default,null) : js.node.Process = untyped __js__('module');
  public static var __filename(default,null) : js.node.Process = untyped __js__('__filename');
  public static var __dirname(default,null) : js.node.Process = untyped __js__('__dirname');

  public static var require(default,null): String->Dynamic = untyped __js__("require");
  public static var setTimeout(default,null): Dynamic->Int->?Array<String>->Int = untyped __js__("setTimeout");
  public static var setInterval(default,null): Dynamic->Int->?Array<String>->Int = untyped __js__("setInterval");
  public static var clearTimeout(default,null): Int->Void = untyped __js__("clearTimeout");
  public static var clearInterval(default,null): Int->Void = untyped __js__("clearInterval");

}


