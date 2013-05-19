package js.node;

import js.node.fs.FSWatcher;
import js.node.fs.Stats;
import js.node.Buffer;
import js.node.stream.Readable;
import js.node.stream.Writable;
import js.Node;

extern class Fs 
implements npm.Package.Require<"fs","*"> 
{
  static function rename(from:String,to:String,cb:NodeError->Void):Void;
  static function renameSync(from:String,to:String):Void;
  
  static function stat(path:String,cb:NodeError->Stats->Void):Void;
  static function statSync(path:String):Stats;

  static function lstat(path:Dynamic,cb:NodeError->Stats->Void):Void;
  static function lstatSync(path:String):Stats;
  
  static function fstat(fd:Int,cb:NodeError->Stats->Void):Void;
  static function fstatSync(fd:Int):Stats;
  
  static function link(srcPath:String,dstPath:String,cb:NodeError->Void):Void;
  static function linkSync(srcPath:String,dstPath:String):Void;

  static function unlink(path:String,cn:NodeError->Void):Void;
  static function unlinkSync(path:String):Void;
  
  static function symlink(linkData:Dynamic,path:String,?type:String,?cb:NodeError->Void):Void;
  static function symlinkSync(linkData:Dynamic,path:String,?type:String):Void;
  
  static function readlink(path:String,cb:NodeError->String->Void):Void;
  static function readlinkSync(path:String):String;
  
  static function realpath(path:String,cb:NodeError->String->Void):Void;
  static function realpathSync(path:String):String;
  
  static function chmod(path:String,mode:Int,cb:NodeError->Void):Void;
  static function chmodSync(path:String,?mode:Int):Void;

  static function fchmod(fd:Int,mode:Int,cb:NodeError->Void):Void;
  static function fchmodSync(fd:Int,?mode:Int):Void;

  static function chown(path:String,uid:Int,gid:Int,cb:NodeError->Void):Void ;
  static function chownSync(path:String,uid:Int,gid:Int):Void;
  
  static function fchown(fd:Int,uid:Int,gid:Int,cb:NodeError->Void):Void ;
  static function fchownSync(fd:Int,uid:Int,gid:Int):Void;

  static function rmdir(path:String,cb:NodeError->Void):Void;
  static function rmdirSync(path:String):Void;
  
  static function mkdir(path:String,?mode:Int,?cb:NodeError->Void):Void;
  static function mkdirSync(path:String,?mode:Int):Void;
  
  static function readdir(path:String,cb:NodeError->Array<String>->Void):Void;
  static function readdirSync(path:String):Array<String>;
  
  static function close(fd:Int,cb:NodeError->Void):Void;
  static function closeSync(fd:Int):Void;
  
  static function open(path:String,flags:String,?mode:Int,cb:NodeError->Int->Void):Void;
  
  static function openSync(path:String,flags:String,?mode:Int):Int;
  
  static function write(fd:Int,bufOrStr:Dynamic,offset:Int,length:Int,position:Null<Int>,?cb:NodeError->Int->Void):Void;
  static function writeSync(fd:Int,bufOrStr:Dynamic,offset:Int,length:Int,position:Null<Int>):Int;
  
  static function read(fd:Int,buffer:Buffer,offset:Int,length:Int,position:Int,cb:NodeError->Int->Buffer->Void):Void;
  static function readSync(fd:Int,buffer:Buffer,offset:Int,length:Int,position:Int):Int;
  
  static function truncate(fd:Int,len:Int,cb:NodeError->Void):Void;
  static function truncateSync(fd:Int,len:Int):NodeError;
  
  static function readFile(path:String,?enc:String,cb:NodeError->String->Void):Void;
  static function readFileSync(path:String,?enc:String):String;

  @:overload(function(fileName:String,data:Buffer,cb:NodeError->Void):Void {})
  static function writeFile(fileName:String,contents:String,?enc:String,cb:NodeError->Void):Void;
  @:overload(function(fileName:String,data:Buffer):Void {})
  static function writeFileSync(fileName:String,contents:String,?enc:String):Void;

  @:overload(function(fileName:String,data:Buffer,cb:NodeError->Void):Void {})
  static function appendFile(fileName:String,contents:String,?enc:String,cb:NodeError->Void):Void;

  @:overload(function(fileName:String,data:Buffer):Void {})
  static function appendFileSync(fileName:String,contents:String,?enc:String):Void;

  
  static function utimes(path:String,atime:Dynamic,mtime:Dynamic,cb:NodeError->Void):Void;
  static function utimeSync(path:String,atime:Dynamic,mtime:Dynamic):Void;

  static function futimes(fd:Int,atime:Dynamic,mtime:Dynamic,cb:NodeError->Void):Void;
  static function futimeSync(fd:Int,atime:Dynamic,mtime:Dynamic):Void;

  static function fsync(fd:Int,cb:NodeError->Void):Void;
  static function fsyncSync(fd:Int):Void;
  
  static function watchFile(fileName:String,?options:FsWatchOpt,listener:Stats->Stats->Void):Void;
  static function unwatchFile(fileName:String):Void;
  static function watch(fileName:String,?options:FsWatchOpt,listener:String->String->Void):FSWatcher;
  static function createReadStream(path:String,?options:FsReadStreamOpt):Readable;
  static function createWriteStream(path:String,?options:FsWriteStreamOpt):Writable;

  static function exists(p:String,cb:Bool->Void):Void;
  static function existsSync(p:String):Bool;
}


typedef FsReadStreamOpt = {
    flags:String,
    encoding:String,
    fd:Null<Int>,
    mode:Int,
    bufferSize:Int,
    ?start:Int,
    ?end:Int
}


typedef FsWriteStreamOpt = {
  var flags:String;
  var encoding:String;
  var mode:Int;
}

typedef FsWatchOpt = {persistent:Bool,interval:Int};
