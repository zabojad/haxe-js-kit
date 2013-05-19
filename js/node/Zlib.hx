package js.node;

import js.node.Buffer;
import js.Node;

import js.node.zlib.*;

extern class ZLib 
implements npm.Package.Require<"zlib","*">
{
    static function createGzip(?options:Dynamic):Gzip;
    static function createGunzip(?options:Dynamic):Gunzip;
    static function createDeflate(?options:Dynamic):Deflate;
    static function createInflate(?options:Dynamic):Inflate;
    static function createInflateRaw(?options:Dynamic):InflateRaw;
    static function createDeflateRaw(?options:Dynamic):DeflateRaw;
    static function createUnzip(?options:Dynamic):Unzip;

    // convenience
    @:overload(function (str:String,cb:NodeError->Dynamic->Void):Void {})
    function deflate(buf:Buffer,cb:NodeError->Dynamic->Void):Void;
    @:overload(function (str:String,cb:NodeError->Dynamic->Void):Void {})
    function deflateRaw(buf:Buffer,cb:NodeError->Dynamic->Void):Void;
    @:overload(function (str:String,cb:NodeError->Dynamic->Void):Void {})
    function gzip(buf:Buffer,cb:NodeError->Dynamic->Void):Void;
    @:overload(function (str:String,cb:NodeError->Dynamic->Void):Void {})
    function gunzip(buf:Buffer,cb:NodeError->Dynamic->Void):Void;
    @:overload(function (str:String,cb:NodeError->Dynamic->Void):Void {})
    function inflate(buf:Buffer,cb:NodeError->Dynamic->Void):Void;
    @:overload(function (str:String,cb:NodeError->Dynamic->Void):Void {})
    function inflateRaw(buf:Buffer,cb:NodeError->Dynamic->Void):Void;
    @:overload(function (str:String,cb:NodeError->Dynamic->Void):Void {})
    function unzip(buf:Buffer,cb:NodeError->Dynamic->Void):Void;
}