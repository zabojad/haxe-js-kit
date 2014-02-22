package js.npm;

extern class ConnectMongoStore 
implements npm.Package.Require<"connect-mongo-store","*"> 
{
	public function new( expr : Dynamic ) : Void;
	public static inline function store( url : Dynamic, opts : {} ) : js.npm.connect.session.Store {
		var cm = untyped ConnectMongoStore(js.npm.Express);
		return untyped __new__( cm , url , opts );
	}
}