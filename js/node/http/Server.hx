package js.node.http;

import js.node.events.EventEmitter;
/* 
   Emits:
   request,connection,checkContinue,connect,clientError,close
 */
extern class Server 
extends EventEmitter 
implements npm.Package.RequireNamespace<"http","*">
{
  @:overload(function(path:String,?cb:Void->Void):Void {})
  function listen(port:Int,?host:String,?backlog:Int,?cb:Void->Void):Void;
  function close(?cb:Void->Void):Void;
}