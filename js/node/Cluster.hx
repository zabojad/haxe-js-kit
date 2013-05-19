package js.node;

typedef ClusterSettings = {
    var exec:String;
    var args:Array<String>;
    var silent:Bool;
}


/* emits: message, online,listening,disconnect,exit, setup */
extern class ClusterWorker extends js.Node.NodeEventEmitter {
    var uniqueID:String; // indexes into cluster.workers
    var process:js.node.ChildProcess;
    var suicide:Bool;
    function send(message:Dynamic,?sendHandle:Dynamic):Void;
    function destroy():Void;
}

/* Emits: death,message, fork, online, listening  */
extern class Cluster extends js.Node.EventEmitter 
implements npm.Package.Require<"cluster","*"> {
  static var isMaster:Bool;
  static var isWorker:Bool;
  static var workers:Array<ClusterWorker>;
  static function fork(?env:Dynamic):ClusterWorker;
  static function send(o:Dynamic):Void;
  static function setupMaster(?settings:ClusterSettings):Void;
  static function disconnect(?cb:Void->Void):Void;
}