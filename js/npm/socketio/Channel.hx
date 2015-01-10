package js.npm.socketio;

extern class Channel 
extends js.node.events.EventEmitter {
	public function use( fn : Middleware ) : Namespace;
}