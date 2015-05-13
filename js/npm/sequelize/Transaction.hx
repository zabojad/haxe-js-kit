package js.npm.sequelize;

@:enum abstract ISOLATION_LEVELS(String) {
	var READ_UNCOMMITTED = 'READ UNCOMMITTED';
	var READ_COMMITTED = 'READ COMMITTED';
	var REPEATABLE_READL = 'REPEATABLE READ';
	var SERIALIZABLE = 'SERIALIZABLE';
}

private class C_LOCKS {
	var UPDATE:String;
	var SHARE:String;
}

extern class Transaction
implements npm.Package.RequireNamespace < "sequelize", "*" > {
	var LOCK:C_LOCKS;
	
	function commit():Transaction;
	function rollback():Transaction;
}

