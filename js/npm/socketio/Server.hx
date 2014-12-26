package js.npm.socketio;

typedef ServerOptions = { > js.npm.engineio.Server.ServerOptions,
	?serverClient : Bool,
	?path : String
}

interface ServerAdapter {}

extern class Server
implements npm.Package.Require<"socket.io","1.0">
{
	@:override( function( port : Int , ?opts : ServerOptions ) : Void {} )
	@:override( function( ?opts : ServerOptions ) : Void {} )
	public function new( srv : js.node.http.Server , ?opts : ServerOptions ) : Void;

	public function serveClient( v : Bool ) : Server;
	public function path( v : String ) : Server;
	public function adapter( v : ServerAdapter ) : Server;
	public function origins( v : String ) : Server;

	public var sockets (default,null) : Namespace;

	public function attach( srv : js.node.http.Server , ?opts : ServerOptions ) : Server;
	public function listen( srv : js.node.http.Server , ?opts : ServerOptions ) : Server;
	public function bind( srv : js.npm.engineio.Server , ?opts : ServerOptions ) : Server;
	public function onconnection( socket : js.npm.engineio.Socket ) : Server;
	public function of( nsp: String ) : Namespace;
	public function on<T>(event:String, cb: T->Void ) : Server;

}