package js.node;


extern class NodeDns 
implements npm.Package.Require<"dns","*"> 
{
  static function resolve(domain:String,?rrtype:String,cb:NodeErr->Array<Dynamic>->Void):Void;
  static function resolveNs(domain:String,cb:NodeErr->Array<Dynamic>->Void):Void;
  static function resolve4(domain:String,cb:NodeErr->Array<String>->Void):Void;
  static function resolve6(domain:String,cb:NodeErr->Array<String>->Void):Void;
  static function resolveMx(domain:String,cb:NodeErr->Array<{priority:Int,exchange:String}>->Void):Void;
  static function resolveSrv(domain:String,cb:NodeErr->Array<{priority:Int,weight:Int,port:Int,name:String}->Void>):Void;
  static function resolveCname(domain:String,cb:NodeErr->Array<String>->Void):Void;
  static function reverse(ip:String,cb:NodeErr->Array<String>->Void):Void;
  static function resolveTxt(domain:String,cb:NodeErr->Array<String>->Void):Void;
  static function lookup(domain:String,?family:String,cb:NodeErr->String->Int->Void):Void;
}