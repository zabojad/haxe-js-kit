package js.npm.mongoose;

extern class Model 
extends Document
implements npm.Package.RequireNamespace<"mongoose","*"> {
	public var db : Connection;

}