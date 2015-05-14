package js.npm.socketio;

import js.support.Callback;

typedef ServerOptions = { > js.npm.engineio.Server.ServerOptions,
	?serverClient : Bool,
	?path : String
}

extern class Server
extends Channel
implements npm.Package.Require<"socket.io","1.0">
{
	@:overload( function( port : Int , ?opts : ServerOptions ) : Void {} )
	@:overload( function( ?opts : ServerOptions ) : Void {} )
	public function new( srv : js.node.http.Server , ?opts : ServerOptions ) : Void;

	public function serveClient( v : Bool ) : Server;
	public function path( v : String ) : Server;
	public function adapter( v : Adapter ) : Server;

	@:overload( function( fn : String -> Callback<Bool> -> Void ) : Void {} )
	public function origins( v : String ) : Server;

	public var sockets (default,null) : Namespace;

	@:overload( function( port : Int , opts : ServerOptions ) : Server {} )
	public function attach( srv : js.node.http.Server , ?opts : ServerOptions ) : Server;
	public function listen( srv : js.node.http.Server , ?opts : ServerOptions ) : Server;
	public function bind( srv : js.npm.engineio.Server , ?opts : ServerOptions ) : Server;
	public function onconnection( socket : js.npm.engineio.Socket ) : Server;
	public function of( nsp: String ) : Namespace;

}