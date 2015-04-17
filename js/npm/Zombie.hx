package js.npm;

extern class Zombie
extends js.npm.zombie.Browser #if !haxe3,#end
implements npm.Package.Require<"zombie", "^3.1.1">
{
	public function new(?options : {}) : Void;
}
