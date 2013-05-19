/* Same license as Node.js
   Maintainer: Ritchie Turner, ritchie@async.cl

   Node.js 0.8 api without haXe embellishments so that other apis may be implemented
   on top without being hindered by design choices here.

   Domain not added.
*/

package js;

typedef NodeError = Null<String>;

class Node {  

  /*public static var process(get_process,null) : js.node.Process;
  public static var console(get_console,null) : js.node.stdio.Console;
  public static var __filename(get___filename,null) : String;
  public static var __dirname(get___dirname,null):String;
  public static var module(get_module,null):Dynamic;  // ref to the current module

  inline private static function get_process():js.node.Process return untyped __js__('process');
  inline private static function get_console():js.node.stdio.Console return untyped __js__('console');
  inline private static function get_module():Dynamic return untyped __js__('module');
  inline private static function get___filename():String return untyped __js__('__filename');
  inline private static function get___dirname():String return untyped __js__('__dirname');*/
  public static var console(default,null) : js.node.stdio.Console = untyped __js__('console');
  public static var process(default,null) : js.node.Process = untyped __js__('process');
  public static var module(default,null) : js.node.Process = untyped __js__('module');
  public static var __filename(default,null) : js.node.Process = untyped __js__('__filename');
  public static var __dirname(default,null) : js.node.Process = untyped __js__('__dirname');
  
  inline public static function require(path:String):Dynamic
    return untyped __js__("require")(path);

  inline public static function setTimeout(cb:Dynamic,delay:Int,?args:Array<Dynamic>):Int
    return untyped __js__("setTimeout")(cb,delay,args);

  inline public static function clearTimeout( id : Int):Void 
    return untyped __js__('clearTimeout')(id);

  inline public static function setInterval(cb:Dynamic,delay:Int,?args:Array<Dynamic>):Int
    return untyped __js__('setInterval')(cb,delay,args);

  inline public static function clearInterval( id : Int):Void 
    return untyped __js__('clearInterval')(id);
  
}


