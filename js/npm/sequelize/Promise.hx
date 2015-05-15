package js.npm.sequelize;

extern class Promise {
	function then(cb:Dynamic):Void;
	function done(cb:Dynamic):Void;
	function error(cb:Dynamic):Void;
	function success(cb:Dynamic):Void;
}