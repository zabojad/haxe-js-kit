package js.npm.socketio;

extern class Namespace extends Channel {
  public var name (default,null) : String;
  public var connected (default,null) : Dynamic<Socket>;
}
