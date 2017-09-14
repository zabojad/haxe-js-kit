package js.npm;

/**
Extern for [ReduxLogger](https://github.com/evgenyrodionov/redux-logger)
**/
@:jsRequire('redux-logger')
extern class ReduxLogger {
	@:selfCall
	static public function createLogger() : Dynamic;
}

/**
Extern for [ReduxLogger](https://github.com/evgenyrodionov/redux-logger)
**/
@:jsRequire('redux-logger','logger')
extern class Logger {}
