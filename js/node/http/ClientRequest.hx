package js.node.http;

import js.node.events.EventEmitter;

/* Emits:
   continue,response
*/
extern class ClientRequest 
extends EventEmitter 
implements npm.Package.RequireNamespace<"http","*">
{
  function write(data:Dynamic,?enc:String):Void;
  function end(?data:Dynamic,?enc:String):Void;
  function abort():Void;
}
