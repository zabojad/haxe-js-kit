package js.atomshell;
import js.node.Process;

/**
 * @author AS3Boyan
 * MIT

 */
extern class AtomShellProcess implements npm.Package.Require<"process","*"> extends Process
{
	var type:String;
	var resourcesPath:String;
}