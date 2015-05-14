package js.node;

import js.node.Http;
import js.node.http.ClientRequest;
import js.node.http.*;
  
extern class Https 
implements npm.Package.Require<"https","*"> 
{
  static function createServer(options:{key:String,cert:String},
                        listener:HttpServerReq->ServerResponse->Void):Server;
  static function request(options:HttpsReqOpt,res:HttpClientResp->Void):ClientRequest;
  static function get(options:HttpsReqOpt,res:HttpClientResp->Void):ClientRequest;
}


typedef HttpsReqOpt = { > js.node.Http.HttpReqOpt,
    @:optional var pfx : Dynamic;
    @:optional var key : Dynamic;
    @:optional var passphrase : Dynamic;
    @:optional var cert : Dynamic;
    @:optional var ca : Dynamic;
    @:optional var ciphers : String;
    @:optional var rejectUnauthorized : Bool;
    @:optional var secureProtocol : Dynamic;
}
