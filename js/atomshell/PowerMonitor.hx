package js.atomshell;
import js.node.events.EventEmitter;

/**
 * @author AS3Boyan
 * MIT

 */
extern class PowerMonitor implements npm.Package.Require<"power-monitor","*"> extends EventEmitter
{
	
}

@:enum 
abstract PowerMonitorEvent(String) to String
{
	var SUSPEND = "suspend";
	var RESUME = "resume";
}