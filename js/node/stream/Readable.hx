package js.node.stream;

import js.node.events.EventEmitter;

extern class Readable 
extends EventEmitter
implements npm.Package.RequireNamespace<"stream","*">
{

  public static inline var EVENT_READABLE = "readable";
  public static inline var EVENT_END = "end";
  public static inline var EVENT_DATA = "data";
  public static inline var EVENT_ERROR = "error";
  public static inline var EVENT_CLOSE = "close";

  var readable:Bool;
  function pause():Void;
  function resume():Void;
  function destroy():Void;
  function destroySoon():Void;
  function setEncoding(enc:String):Void;
  function pipe(dest:js.node.stream.Writable,?opts:{end:Bool}):Void;
  function new(?opt:Dynamic):Void;

}
