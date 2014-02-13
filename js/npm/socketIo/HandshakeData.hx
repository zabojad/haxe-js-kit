package js.npm.socketIo;

typedef HandshakeData = {
	headers : Dynamic,
	time : String,
	address : { 
		address : String , 
		port : Int 
	},
	xdomain : Bool,
	secure : Bool,
	issued : Int,
	url : String,
	query : Dynamic
}