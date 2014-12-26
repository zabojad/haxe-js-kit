package js.npm.socketio;

import js.support.Callback;

extern class Socket 
extends Channel {
	var rooms(default,null) : Array<String>;
	var client(default,null) : Client;
	var conn(default,null) : js.npm.engineio.Socket;
	var request(default,null) : js.node.http.ClientRequest;
	var id(default,null) : String;
	function join( name : String, ?fn : Callback0 ) : Socket;
	function leave( name : String, ?fn : Callback0 ) : Socket;
	function to( room : String ) : Socket;
	public inline function in_( room : String ) : Socket {
		return untyped this['in'](room);
	}
}