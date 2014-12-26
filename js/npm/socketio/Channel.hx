package js.npm.socketio;

extern class Channel {
	public function on<T>( event : String , ?data : T ) : Void;
    public function emit<T>( event : String , ?data : T ) : Void;
}