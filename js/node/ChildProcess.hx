package js.node;

import js.node.net.*;
import js.node.stream.*;

/*
  Emits: message
*/
extern class ChildForkProcess extends ChildProcess {
     @:overload(function(o:Dynamic,?socket:Socket):Void {})
     function send(o:Dynamic,?server:Server):Void;  
}

/*
  Emits: exit,close
*/
extern class ChildProcess
extends js.node.events.EventEmitter
implements npm.Package.Require<"child_process","*"> { 

  public static inline var EVENT_EXIT = "exit";

	var stdin:Writable;
  var stdout:Readable;
  var stderr:Readable;
  var pid:Int;
  
  function kill(?signal:String):Void;

	static function spawn(command: String,args: Array<String>,?options: Dynamic ) : ChildProcess;
	static function exec(command: String,?options:Dynamic,cb: {code:Int}->String->String->Void ): ChildProcess;
	static function execFile(command: String,?options:Dynamic,cb: {code:Int}->String->String->Void ): ChildProcess;
	static function fork(path:String,?args:Dynamic,?options:Dynamic):ChildForkProcess;

}